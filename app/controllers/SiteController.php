<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\Response;
use yii\web\UploadedFile;
use app\models\form\LoginForm;
use app\models\User;
use app\models\Profile;


class SiteController extends Controller
{
    public $publicActions = ['login', 'signup', 'home', 'signup-success', 'verification'];
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return Yii::$app->permission->behaviors($this->publicActions);
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function beforeAction($action)
    { 
        switch ($action->id) {
            case 'signup-success':
            case 'signup':
                $this->layout = 'frontend_main';
                break;
            case 'login':
            case 'error':
                $this->layout = 'no-sidebar';
            default:
                break;
        }

        return parent::beforeAction($action);
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->redirect(['/dashboard']);
        }

        
        return $this->redirect(['site/home']);
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->redirect(['dashboard/index']);
        }

        $model = new LoginForm();

        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->redirect(['dashboard/index']);
        }

        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->redirect(['site/home']);
    }

    

    public function actionSignup()
    {
        $user = new User();
        $profile = new Profile();
        $user->status = 0;
        $user->role_id = Yii::$app->general->setting('default_role');


        if ($user->load(Yii::$app->request->post()) && $user->save() && $profile->load(Yii::$app->request->post()) && $profile->validate()) {
            $profile->user_id = $user->id;

            if ($profile->save()) {

                //live send email
                // $mail = Yii::$app->mailer->compose('authorization', [
                //     'authkey' => $user->authkey,    
                // ])
                // ->setFrom('printingkanity@gmail.com')
                // ->setTo($profile->email)
                // ->setSubject('Verification') 
                // ->send();

                return $this->redirect(['signup-success', 'id' => $user->id]);
            }
        }

        return $this->render('signup', [
            'user' => $user,
            'profile' => $profile,
        ]);
    }


    public function actionSignupSuccess($id)
    {
        $model = User::findOne($id);

        //live 
        // return $this->render('signup_success_live', ['model' => $model]);

        return $this->render('signup_success', ['model' => $model]);
    }


    public function actionVerification($authkey)
    {
        $model = User::findOne(['authkey' => $authkey]);

        if ($model) {
            $model->verification = true;
            $model->status = 1;
            $model->password_confirm = $model->password;
            if ($model->save()) {
                Yii::$app->kanity->notify($model, [
                    'message' => 'New User signup.',
                    'user_id' => $model->id,
                    'controller' => 'user'
                ]);
                Yii::$app->session->setFlash('success', 'Account Verified');
                return $this->redirect(['login']);
            }
        }

        return 'User not Found';
    }

    
    public function actionHome()
    {
        $this->layout = 'frontend_main';

        return $this->render('home');
    }
       
}

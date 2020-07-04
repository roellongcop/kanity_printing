<?php

namespace app\controllers;

use Yii;
use app\models\User;
use app\models\Profile;
use app\models\search\UserSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all User models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionMyAccount()
    {
        return $this->render('my_account', [
            'model' => $this->findModel(Yii::$app->user->identity->id),
        ]);
    }

 


    /**
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new User();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Created');
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Updated');
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);

        $model->status = 0;
        $model->verification = true;
        $model->password_confirm = $model->password;


        if($model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Deleted');
        }
        else {
            Yii::$app->session->setFlash('danger', 'Error in Deleting');
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = User::find()
            ->alias('u')
            ->where(['u.id' => $id])
            ->andWhere(Yii::$app->permission->filter())
            ->andWhere(['u.status' => 1])
            ->one();

        $action = Yii::$app->permission->findAction(); 

        if ($model) {

            if (isset($model->$action) && !$model->$action) {
                if (! $model->$action) {
                    throw new ForbiddenHttpException('The requested page cannot process ' . ucfirst($this->action->id) . ' action');
                }
            }
            
            return $model;
        }
    }

    public function actionCreateProfile($id)
    {
        $model = Profile::findOne(['user_id' => $id]);
        $model =  $model ? $model: new Profile();
        $model->user_id = $id;


        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->image_input = UploadedFile::getInstance($model, 'image_input');
            $model->upload();
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Successfully Created');
                return $this->redirect(['view-profile', 'id' => $model->id]);
            }
            else {
                Yii::$app->session->setFlash('danger', json_encode($model->errors));
            }

        }

        return $this->render('profile', [
            'user' => $this->findModel($id),
            'model' => $model,
        ]);
    }

    public function actionViewProfile($id)
    {
        $model = Profile::findOne($id);

        return $this->render('view_profile', [
            'model' => $model,
        ]);
    }

    public function actionMyProfile()
    {
        $id = Yii::$app->user->identity->id;
        $model = Profile::findOne(['user_id' => $id]);

        return $this->render('my_profile', [
            'model' => $model,
        ]);
    }

    public function actionBuildProfile()
    {
        $id = Yii::$app->user->identity->id;

        $model = Profile::findOne(['user_id' => $id]);
        $model =  $model ? $model: new Profile();
        $model->user_id = $id;


        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->image_input = UploadedFile::getInstance($model, 'image_input');
            $model->upload();
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Successfully Created');
                return $this->redirect(['my-profile']);
            }
            else {
                Yii::$app->session->setFlash('danger', json_encode($model->errors));
            }

        }

        return $this->render('profile', [
            'user' => $this->findModel($id),
            'model' => $model,
        ]);
    }


    public function actionUpdateAccount()
    {
        $id = Yii::$app->user->identity->id;
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Updated');
            return $this->redirect(['my-account']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
}

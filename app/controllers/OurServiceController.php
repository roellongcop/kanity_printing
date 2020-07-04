<?php

namespace app\controllers;

use Yii;
use app\models\Service;
use app\models\search\ServiceSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * ServiceController implements the CRUD actions for Service model.
 */
class OurServiceController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    // public function behaviors()
    // {
    //     return Yii::$app->permission->behaviors();
    // }


    public function beforeAction($action)
    {
        $this->layout = 'frontend_main';
        return parent::beforeAction($action);
    }

    /**
     * Lists all Service models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ServiceSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Service model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $other_services = Service::find()
            ->where(['status' => 1])
            ->andWhere(['<>', 'id', $id])
            ->all();

        return $this->render('view', [
            'model' => $this->findModel($id),
            'other_services' => $other_services,
        ]);
    }
 

    /**
     * Finds the Service model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Service the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = Service::find()
            ->where(['id' => $id])
            ->andWhere(['status' => 1])
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
}

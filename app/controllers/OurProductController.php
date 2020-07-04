<?php

namespace app\controllers;

use Yii;
use app\models\Service;
use app\models\Product;
use app\models\search\ProductSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * ProductController implements the CRUD actions for Product model.
 */
class OurProductController extends Controller
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
     * Lists all Product models.
     * @return mixed
     */
    public function actionIndex($service_id='')
    {
        $services  = Product::find()
            ->where(['status' => 1])
            ->groupBy('service_id')
            ->all();

        $models  = Product::find()
            ->where(['status' => 1])
            ->andFilterWhere(['service_id' => $service_id])
            ->all();

        $service = Service::findOne($service_id);
        $serviceName = ($service) ? $service->name: '';



        return $this->render('index', [
            'models' => $models,
            'services' => $services,
            'serviceName' => $serviceName,
        ]);
    }

    /**
     * Displays a single Product model.
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
     * Finds the Product model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Product the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = Product::find()
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

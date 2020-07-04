<?php

namespace app\controllers;

use Yii;
use app\models\Portfolio;
use app\models\search\PortfolioSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * PortfolioController implements the CRUD actions for Portfolio model.
 */
class OurPortfolioController extends Controller
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
     * Lists all Portfolio models.
     * @return mixed
     */
    public function actionIndex()
    {
        $categories = Portfolio::find()
            ->where(['status' => 1])
            ->groupBy('portfolio_category_id')
            ->all();

        $models = Portfolio::find()
            ->where(['status' => 1])
            ->all();

        return $this->render('index', [
            'models' => $models,
            'categories' => $categories,
        ]);
    }

    /**
     * Displays a single Portfolio model.
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
     * Finds the Portfolio model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Portfolio the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = Portfolio::find()
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

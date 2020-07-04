<?php

namespace app\controllers;

use Yii;
use app\models\DailyOutput;
use app\models\search\JobOrderSearch;
use app\models\search\DailyOutputSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * DailyOutputController implements the CRUD actions for DailyOutput model.
 */
class DailyOutputController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all DailyOutput models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new DailyOutputSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DailyOutput model.
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
     * Creates a new DailyOutput model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new DailyOutput();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            Yii::$app->kanity->notify($model, [
                'message' => 'New Daily Output was created.',
                'user_id' => $model->quotation->user_id,
            ]);
           
            Yii::$app->session->setFlash('success', 'Daily Ouput Added');
            
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }


    

    /**
     * Deletes an existing DailyOutput model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);

        $model->status = 0;

        if($model->save()) {
            Yii::$app->session->setFlash('success', 'Daily Ouput Deleted');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($model->errors));
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the DailyOutput model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return DailyOutput the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = DailyOutput::find()
            ->alias('do')
            ->where(['do.id' => $id])
            ->andWhere(Yii::$app->permission->filter())
            ->andWhere(['do.status' => 1])
            ->joinWith('user u')
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


    public function actionGetJobOrder($id)
    {
        $model = JobOrderSearch::one($id);

        return $this->renderPartial('_job_order_detail', ['model' => $model]);
    }


    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new DailyOutputSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
}

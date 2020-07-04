<?php

namespace app\controllers;

use Yii;
use app\models\DailyOutput;
use app\models\search\DailyOutputSearch;
use app\models\JobOrder;
use app\models\PurchaseOrder;
use app\models\search\JobOrderSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * JobOrderController implements the CRUD actions for JobOrder model.
 */
class JobOrderController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all JobOrder models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new JobOrderSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single JobOrder model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $searchModel = new DailyOutputSearch();
        $searchModel->job_order_id = $id;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        $do = new DailyOutput();

        return $this->render('view', [
            'model' => $this->findModel($id),
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'do' => $do,
        ]);
    }

    /**
     * Creates a new JobOrder model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new JobOrder();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->kanity->notify($model, [
                'message' => 'New Job Order was created.',
                'user_id' => $model->quotation->user_id,
            ]);
            
            Yii::$app->session->setFlash('success', 'Successfully Created');
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing JobOrder model.
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
     * Deletes an existing JobOrder model.
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
            Yii::$app->session->setFlash('success', 'Successfully Deleted');
        }
        else {
            Yii::$app->session->setFlash('danger', 'Error in Deleting');
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the JobOrder model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return JobOrder the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = JobOrder::find()
            ->alias('jo')
            ->where(['jo.id' => $id])
            ->andWhere(Yii::$app->permission->filter())
            ->andWhere(['jo.status' => 1])
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

    public function actionAddDailyOutput($id)
    {
        $model = $this->findModel($id);
        $do = new DailyOutput();
        $do->job_order_id = $id;

        if ($do->load(Yii::$app->request->post()) && $do->save()) {
            Yii::$app->kanity->notify($do, [
                'message' => 'New Daily Output was created.',
                'user_id' => $model->quotation->user_id,
                'controller' => 'daily-output'
            ]);

            Yii::$app->session->setFlash('success', 'Daily Ouput Added');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($do->errors));
        }

        return $this->redirect(['view', 'id' => $model->id]);
    }


    public function actionReceivedScheduled($id)
    {
        $model = $this->findModel($id);
        $model->process_status = 1;

        if ($model->save()) {
            Yii::$app->kanity->notify($do, [
                'message' => 'New Job Order was received / unserved.',
                'user_id' => $model->quotation->user_id,
            ]);

            Yii::$app->session->setFlash('success', 'Successfully Received / Scheduled / Unserved');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($model->errors));
        }
        return $this->redirect(['view', 'id' => $model->id]);
    }

    public function actionCancel($id)
    {
        $model = $this->findModel($id);
        $model->process_status = 4; //cancelled

        if ($model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Cancelled');
        }
        else {
            Yii::$app->session->setFlash('success', 'Error Encounter');
        }

        return $this->redirect(['index']);
    }

    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new JobOrderSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


}

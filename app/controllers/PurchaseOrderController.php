<?php

namespace app\controllers;

use Yii;
use app\models\JobOrder;
use app\models\AcknowledgmentReceipt;
use app\models\search\AcknowledgmentReceiptSearch;
use app\models\PurchaseOrder;
use app\models\search\PurchaseOrderSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * PurchaseOrderController implements the CRUD actions for PurchaseOrder model.
 */
class PurchaseOrderController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all PurchaseOrder models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PurchaseOrderSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single PurchaseOrder model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $jo = new JobOrder;
        $ar = new AcknowledgmentReceipt;
        $searchModel = new AcknowledgmentReceiptSearch();
        $searchModel->purchase_order_id = $id;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('view', [
            'model' => $model,
            'ar' => $ar,
            'jo' => $jo,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new PurchaseOrder model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new PurchaseOrder();
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->kanity->notify($model, [
                'message' => 'New Purchase Order was created.',
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
     * Updates an existing PurchaseOrder model.
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
     * Deletes an existing PurchaseOrder model.
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
     * Finds the PurchaseOrder model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return PurchaseOrder the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = PurchaseOrder::find()
            ->alias('pu')
            ->where(['pu.id' => $id])
            ->andWhere(Yii::$app->permission->filter())
            ->andWhere(['pu.status' => 1])
            ->joinWith('user u')
            ->one();


        $action = Yii::$app->permission->findAction();

        if ($model) {
            if (isset($model->$action) && !$model->$action) {
                throw new ForbiddenHttpException('The requested page cannot process "' .  $action . '" action');
            }
            
            return $model;
        }
    }

    public function actionCreateJobOrder($id)
    {
        $jo = new JobOrder;
        $model = $this->findModel($id);

        $jo->purchase_order_id = $model->id;

        
        if ($jo->load(Yii::$app->request->post()) && $jo->save()) {
            Yii::$app->kanity->notify($jo, [
                'message' => 'New Job Order was created.',
                'user_id' => $model->quotation->user_id,
                'controller' => 'job-order'
            ]);

            Yii::$app->session->setFlash('success', 'Successfully Job Order Created');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($jo->errors));
        }
        
        return $this->redirect(['view', 'id' => $model->id]);
    }


    public function actionAcknowledgeReceipt($id)
    {
        $model = $this->findModel($id);
        $ar = new AcknowledgmentReceipt();
        $ar->purchase_order_id = $id;

        if ($ar->load(Yii::$app->request->post()) && $ar->save()) {
            Yii::$app->kanity->notify($ar, [
                'message' => 'New Acknowledge Receipt was created.',
                'user_id' => $model->quotation->user_id,
                'controller' => 'acknowledgment-receipt'
            ]);

            Yii::$app->session->setFlash('success', 'Acknowledge Receipt');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($ar->errors));
        }

        return $this->redirect(['view', 'id' => $model->id]);
    }


    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new PurchaseOrderSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

}

<?php

namespace app\controllers;

use Yii;
use app\models\Profile;
use app\models\SalesInvoice;
use app\models\search\SalesInvoiceSearch;
use app\models\search\PurchaseOrderSearch;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * SalesInvoiceController implements the CRUD actions for SalesInvoice model.
 */
class SalesInvoiceController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all SalesInvoice models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SalesInvoiceSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SalesInvoice model.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);

        return $this->render('view', [
            'model' => $model,
        ]);
    }

    public function actionPrintOne($id)
    {
        $model = $this->findModel($id);
        $this->layout = 'default';
        return $this->render('print_one', [
            'model' => $model,
        ]);
    }

    /**
     * Creates a new SalesInvoice model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new SalesInvoice();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->kanity->notify($model, [
                'message' => 'New Sales Invoice was created.',
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
     * Updates an existing SalesInvoice model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
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
     * Deletes an existing SalesInvoice model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
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
     * Finds the SalesInvoice model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return SalesInvoice the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = SalesInvoiceSearch::one($id);
        $action = Yii::$app->permission->findAction();

        if ($model) {

            if (isset($model->$action) && !$model->$action) {
                throw new ForbiddenHttpException('The requested page cannot process ' . ucfirst($this->action->id) . ' action');
            }
            
            return $model;
        }

    }



    public function actionGetPurchaseOrder($id='')
    {
        if ($id) {
            $model = PurchaseOrderSearch::one($id);
            $profile = Profile::find()
                ->where(['user_id' => $model->quotation->user_id])
                ->andWhere(['status' => 1])
                ->one();


            return json_encode([
                'quotation_details' => $this->renderPartial('/quotation/_detail', 
                    ['model' => $model->quotation]),
                'po_details' => $this->renderPartial('/purchase-order/_detail', 
                    ['model' => $model]),
                'profile' => $profile
            ]);
        }
    }


    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new SalesInvoiceSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
}

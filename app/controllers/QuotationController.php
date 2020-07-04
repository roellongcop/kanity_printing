<?php

namespace app\controllers;

use Yii;
use app\models\PurchaseOrder;
use app\models\Quotation;
use app\models\search\QuotationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException; 
use yii\web\ForbiddenHttpException; 
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * QuotationController implements the CRUD actions for Quotation model.
 */
class QuotationController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all Quotation models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QuotationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Quotation model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = $this->findModel($id, 'viewable'); 
        
        $po = new PurchaseOrder;
        $model->scenario = 'set_quotation';

        return $this->render('view', [
            'model' => $model,
            'po' => $po,
        ]);
    }


    public function actionNoBid($id)
    {
        $model = $this->findModel($id);
        $model->scenario = 'no_bid';
        $model->process_status = 2;
        $model->process_by = Yii::$app->user->identity->id;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully No Bid');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($model->errors));
        }

        return $this->redirect(['view', 'id' => $model->id]);
    }

    public function actionCancel($id)
    {
        $model = $this->findModel($id);
        $model->process_status = 3;

        if ($model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Cancelled');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($model->errors));
        }

        return $this->redirect(['view', 'id' => $model->id]);
    }


    public function actionSetQuotation($id)
    {
        $model = $this->findModel($id);
        $model->scenario = 'set_quotation';
        $model->process_status = 1;
        $model->process_by = Yii::$app->user->identity->id;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->kanity->notify($model, [
                'message' => 'Quotation no ' . $model->quotation_no . ' was quoted.',
                'user_id' => $model->user_id
            ]);

            Yii::$app->session->setFlash('success', 'Successfully Set Quotation');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($model->errors));
        }

        return $this->redirect(['view', 'id' => $model->id]);
    }



    public function actionSendPo($id)
    {
        $po = new PurchaseOrder;
        $model = $this->findModel($id);
        
        $po->quotation_id = $model->id;
        
        if ($po->load(Yii::$app->request->post()) && $po->save()) {
            Yii::$app->kanity->notify($po, [
                'message' => 'New Purchase Order was created.',
                'user_id' => $model->user_id,
                'controller' => 'purchase-order'
            ]);
            Yii::$app->session->setFlash('success', 'Successfully PO Sent');
        }
        else {
            Yii::$app->session->setFlash('danger', json_encode($po->errors));
        }
        
        return $this->redirect(['view', 'id' => $model->id]);
    }


    /**
     * Creates a new Quotation model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Quotation();  
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            
            $model->imageFiles = UploadedFile::getInstances($model, 'imageFiles');
            $model->upload();

            if ($model->save()) {

                Yii::$app->kanity->notify($model, [
                    'message' => 'New Quotation was Created.',
                    'user_id' => $model->user_id
                ]);
                
                Yii::$app->session->setFlash('success', 'Successfully Created');
            }
            else {
                Yii::$app->session->setFlash('danger', json_encode($model->errors));
            }

            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Quotation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->imageFiles = UploadedFile::getInstances($model, 'imageFiles');
            $model->upload();

            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Successfully Updated');
            }
            else {
                Yii::$app->session->setFlash('danger', json_encode($model->errors));
            }

            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Quotation model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id, 'deletable');

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
     * Finds the Quotation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Quotation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $action='')
    {
        $model = Quotation::find()
            ->alias('q')
            ->where(['q.id' => $id])
            ->andWhere(Yii::$app->permission->filter())
            ->andWhere(['q.status' => 1])
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

    public function actionRemoveImage()
    {
        $post = Yii::$app->request->post();

        $model = $this->findModel($post['id']);
        $temp_images = $model->images;

        unset($temp_images[$post['key']]);

        $model->images = $temp_images;
        
        return $model->save();
    }


    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new QuotationSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
}

<?php

namespace app\controllers;

use Yii;
use app\models\TypeOfService;
use app\models\search\TypeOfServiceSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * TypeOfServiceController implements the CRUD actions for TypeOfService model.
 */
class TypeOfServiceController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all TypeOfService models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TypeOfServiceSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single TypeOfService model.
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
     * Creates a new TypeOfService model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new TypeOfService();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Created');
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing TypeOfService model.
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
     * Deletes an existing TypeOfService model.
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
     * Finds the TypeOfService model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return TypeOfService the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = TypeOfService::find()
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

    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new TypeOfServiceSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
}

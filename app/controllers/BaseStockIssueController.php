<?php

namespace app\controllers;

use Yii;
use app\models\BaseStockIssue;
use app\models\search\BaseStockIssueSearch;
use app\models\search\BaseStockSearch;
use app\models\search\UserSearch;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * BaseStockIssueController implements the CRUD actions for BaseStockIssue model.
 */
class BaseStockIssueController extends Controller
{
    /**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    /**
     * Lists all BaseStockIssue models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BaseStockIssueSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single BaseStockIssue model.
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

    /**
     * Creates a new BaseStockIssue model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new BaseStockIssue();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Successfully Created');
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing BaseStockIssue model.
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
     * Deletes an existing BaseStockIssue model.
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
     * Finds the BaseStockIssue model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return BaseStockIssue the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = BaseStockIssueSearch::one($id);
        $action = Yii::$app->permission->findAction();

        if ($model) {

            if (isset($model->$action) && !$model->$action) {
                throw new ForbiddenHttpException('The requested page cannot process ' . ucfirst($this->action->id) . ' action');
            }
            
            return $model;
        }

    }


    public function actionPrint($params)
    {
        $params = json_decode($params, true);
        $searchModel = new BaseStockIssueSearch();
        $dataProvider = $searchModel->search($params);
        $this->layout = 'default';
        return $this->render('print', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionGetBaseStockDetail($id)
    {
        if ($id) {
            $model = BaseStockSearch::one($id);

            return $this->renderPartial('/base-stock/_detail', [
                'model' => $model
            ]);
        }

        return 'N/A';
    }

    public function actionGetUserDetail($id)
    {
        if ($id) {
            $model = UserSearch::one($id);

            return $this->renderPartial('/user/_detail', [
                'model' => $model
            ]);
        }

        return 'N/A';
    }
}

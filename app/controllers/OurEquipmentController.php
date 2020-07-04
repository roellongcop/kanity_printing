<?php

namespace app\controllers;

use Yii;
use app\models\Equipment;
use app\models\EquipmentCategory;
use app\models\search\EquipmentSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * EquipmentController implements the CRUD actions for Equipment model.
 */
class OurEquipmentController extends Controller
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
     * Lists all Equipment models.
     * @return mixed
     */
    public function actionIndex($equipment_category_id='')
    {
        $categories  = Equipment::find()
            ->where(['status' => 1])
            ->groupBy('equipment_category_id')
            ->all();

        $models  = Equipment::find()
            ->where(['status' => 1])
            ->andFilterWhere(['equipment_category_id' => $equipment_category_id])
            ->all();

        $category = EquipmentCategory::findOne($equipment_category_id);
        $categoryName = ($category) ? $category->name: '';


        return $this->render('index', [
            'models' => $models,
            'categories' => $categories,
            'categoryName' => $categoryName,
        ]);
    }

    /**
     * Displays a single Equipment model.
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
     * Finds the Equipment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Equipment the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = Equipment::find()
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

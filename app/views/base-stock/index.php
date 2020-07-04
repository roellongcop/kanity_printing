<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\BaseStockSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Base Stocks';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
    
        <div class="base-stock-index">
        
            <div class="table-responsive">
              <p class="pull-right">
                  <?= Yii::$app->permission->button(['create', 'print']) ?>
              </p>

              <?= GridView::widget([
                  'dataProvider' => $dataProvider,
                  'columns' => [
                      ['class' => 'yii\grid\SerialColumn'],
                        'name',
                         'categoryName',
                        'unit',
                        // 'createdAt',
                        // 'updatedAt',
                    //'description:ntext',
                    //'max_stock',
                    //'min_stock',
                    'current_stock',
                    [
                          'attribute' => 'stock_status',
                          'value' => 'stockStatus'
                      ],
                      // [
                      //     'attribute' => 'status',
                      //     'value' => 'statusTitle'
                      // ],

                      Yii::$app->permission->actionColumn(),
                  ],
              ]); ?>
                          
          </div>
        </div>
    </div>
</div>
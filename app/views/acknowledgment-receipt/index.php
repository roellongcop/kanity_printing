<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\AcknowledgmentReceiptSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Acknowledgment Receipts';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
    
        <div class="acknowledgment-receipt-index">
        
            <div class="table-responsive">
              <p class="pull-right">
                  <?= Yii::$app->permission->button(['create', 'print']) ?>
              </p>

              <?= GridView::widget([
                  'dataProvider' => $dataProvider,
                  'columns' => [
                      ['class' => 'yii\grid\SerialColumn'],
                        'purchaseOrderNo',
                        
                        'quantity',
                        'delivery_date',
                        [
                          'attribute' => 'delivery_status',
                          'value' => 'deliveryStatus',
                        ],
                        'particular:ntext',
                    //'createdAt',
                    //'updatedAt',

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
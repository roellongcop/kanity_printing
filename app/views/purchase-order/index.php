<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\PurchaseOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Purchase Orders';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
    
        <div class="purchase-order-index">
        
            <div class="table-responsive">
              <p class="pull-right">
                  <?= Yii::$app->permission->button(['create', 'print']) ?>
              </p>

              <?= GridView::widget([
                  'dataProvider' => $dataProvider,
                  'columns' => [
                      ['class' => 'yii\grid\SerialColumn'],
                        [
                          'attribute' => 'quotationNo',
                          'label' => 'Quotation Number',
                      ],
                        'po_no',
                        'quantity',
                        'served_quantity',
                          'pending_quantity',
                        // 'customer_note:ntext',
                        // 'createdAt',
                      [
                          'attribute' => 'process_status',
                          'format' => 'raw',
                          'value' => 'currentStatusClass'
                      ],
                      

                      Yii::$app->permission->actionColumn(),
                  ],
              ]); ?>
                          
          </div>
        </div>
    </div>
</div>
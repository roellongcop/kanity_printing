<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\SalesInvoiceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Sales Invoices';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
    
        <div class="sales-invoice-index">
        
            <div class="table-responsive">
              <p class="pull-right">
                  <?= Yii::$app->permission->button(['create', 'print']) ?>
              </p>

              <?= GridView::widget([
                  'dataProvider' => $dataProvider,
                  'columns' => [
                      ['class' => 'yii\grid\SerialColumn'],
                        'no',
                                'purchaseOrderNo',
                        'pickup_date',
                        'company_name',
                    // 'prepared_by',
                    // 'noted_by',
                    'total',
                     [
                          'attribute' => 'payment_status',
                          'value' => 'paymentStatus'
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
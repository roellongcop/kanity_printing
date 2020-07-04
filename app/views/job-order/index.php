<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\JobOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Job Orders';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
    
        <div class="job-order-index">
        
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
                        [
                            'attribute' => 'purchaseOrderNo',
                            'label' => 'PO NO',
                        ],
                        'jo_no',

                        [
                            'attribute' => 'quantity',
                            'label' => 'Quotation (QTY)',
                        ],

                        [
                            'attribute' => 'served_quantity',
                            'label' => 'served',
                        ],
                        
                        [
                            'attribute' => 'pending_quantity',
                            'label' => 'Pending',
                        ],

                        
                        [
                            'attribute' => 'process_status',
                            'format' => 'raw',
                            'value' => 'currentStatusClass'
                        ],
                        // 'createdAt',
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
<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\QuotationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Quotations';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;


?>
<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
        <div class="quotation-index">


            <div class="table-responsive">
                <p class="pull-right">
                    <?= Yii::$app->permission->button(['create', 'print']) ?> 
                </p>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],
                        'quotation_no',
                        'typeOfServiceName',
                        'username',
                        'fullname',
                        'companyName',
                        // 'specs',
                        'quantity',
                        [
                            'attribute' => 'process_status',
                            'format' => 'raw',
                            'value' => 'currentStatusClass'
                        ],
                        //'mode_of_payment_id',
                        //'images:ntext',
                        //'statusTitle',
                        //'createdAt',
                        //'updatedAt',

                        Yii::$app->permission->actionColumn(),
                    ],
                ]); ?>
            </div>
        </div>
    </div>
</div>

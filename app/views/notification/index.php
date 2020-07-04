<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\NotificationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Notifications';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>



<div class="card mt10px">
    <div class="card-body">
    
        <div class="notification-index">
        
            <div class="table-responsive">
                <p class="pull-right">
                    <?= Yii::$app->permission->button(['create', 'print']) ?>
                    <?= Yii::$app->permission->link([
                      'title' => 'Mark All as Read',
                      'link' => ['notification/markall-as-read'],
                      'options' => ['class' => 'btn btn-primary']
                    ]); ?>
                </p>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],
                          'message:ntext',
                          // 'controller',
                          // 'action',
                      
                          [
                            'attribute' => 'created_at',
                            'value' => 'createdAt'
                        ],

                        [
                            'attribute' => 'read_status',
                            'label' => 'Status',
                            'value' => 'readStatus',
                            'format' => 'raw'
                        ],
                        // [
                        //     'attribute' => 'status',
                        //     'value' => 'statusTitle'
                        // ],

                        Yii::$app->permission->actionColumn(['template' => ['view']]),
                    ],
                ]); ?>
                            
            </div>
        </div>
    </div>
</div>
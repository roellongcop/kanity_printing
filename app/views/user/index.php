<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>
<div class="card mt10px">
    <div class="card-body">
        <div class="user-index">


            <div class="table-responsive">
                <p class="pull-right">
                    <?= Yii::$app->permission->button(['create', 'print']) ?>
                </p>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    // 'filterModel' => $searchModel,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],

                        'roleName',
                        'username',
                        'access_token',
                        'authkey',
                        //'status',
                        // [
                        //     'attribute' => 'status',
                        //     'value' => 'statusTitle'
                        // ],
                        // 'createdAt',
                        //'updatedAt',

                        Yii::$app->permission->actionColumn()

                    ],
                ]); ?>
            </div>
        </div>
    </div>
</div>

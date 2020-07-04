<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ProfileSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Profiles';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>

<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
        
        <div class="profile-index">

            <div class="table-responsive">
                <p class="pull-right">
                    <?= Yii::$app->permission->button(['create', 'print']) ?>
                </p>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],
                        'email:email',
                        'fullname',
                        'company_name',
                        //'company_address:ntext',
                        'position',
                        'contact_number',
                        // [
                        //     'attribute' => 'status',
                        //     'value' => 'statusTitle'
                        // ],
                        //'createdAt',
                        //'updatedAt',

                        Yii::$app->permission->actionColumn(),
                    ],
                ]); ?>
            </div>
        </div>

    </div>
</div>
<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ModeOfPaymentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Mode Of Payments';
$this->params['breadcrumbs'][] = $this->title;
$this->params['searchModel'] = $searchModel;
?>
<?= $this->render('_search', ['model' => $searchModel]); ?>

<div class="card mt10px">
    <div class="card-body">
    
        <div class="mode-of-payment-index">
        
            <div class="table-responsive">
              <p class="pull-right">
                  <?= Yii::$app->permission->button(['create', 'print']) ?>
              </p>

              <?= GridView::widget([
                  'dataProvider' => $dataProvider,
                  'columns' => [
                      ['class' => 'yii\grid\SerialColumn'],
                        'name',
                        'description:ntext', 
                        // 'lastUpdated',
                    //'createdAt',
                    // 'updatedAt',

                      Yii::$app->permission->actionColumn(),
                  ],
              ]); ?>
          </div>
        </div>
    </div>
</div>
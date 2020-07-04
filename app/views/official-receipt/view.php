<?php

use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\OfficialReceipt */

$this->title = $model->no;
$this->params['breadcrumbs'][] = ['label' => 'Official Receipts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;
?>

<div class="card mt10px">
    <div class="card-body">
        <div class="official-receipt-view">

            <p>
                <?= $permission->button(['create', 'update', 'delete'], $model) ?>
            </p>

            <hr>
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link show active" data-toggle="tab" href="#general-data" role="tab" aria-controls="home" aria-selected="true">
                    <i class="icons cui-note"></i> General Details
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link show" data-toggle="tab" href="#print_preview" role="tab" aria-controls="profile" aria-selected="false">
                        <i class="icon-print"></i> Print Preview
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane show active" id="general-data" role="tabpanel">
            		<?=  $this->render('_detail', ['model' => $model]) ?>
                </div>
                <div class="tab-pane show" id="print_preview" role="tabpanel"><br>
                	<?php if($permission->user_can('print')): ?>
                		<?= Html::a('Print', '#', [
                			'data-url' => Url::to(['official-receipt/print-one', 'id' => $model->id], true),
                			'class' => 'btn btn-printer'
                		]) ?>
                	<?php endif; ?><br><br>

                	<?= $this->render('_print_one', ['model' => $model]) ?>
                </div>
            </div>



        </div>
    </div>
</div>

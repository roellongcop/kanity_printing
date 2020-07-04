<?php

use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\AcknowledgmentReceipt */

$this->title = $model->purchaseOrderNo;
$this->params['breadcrumbs'][] = ['label' => 'Acknowledgment Receipts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;

$print_url = Url::to(['acknowledgment-receipt/print-one', 'id' => $model->id], true);
 
?>

<div class="card mt10px">
    <div class="card-body">
        <div class="acknowledgment-receipt-view">

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
                    <div class="row">
                        <div class="col-md-6">
                            <p class="lead">AR Details</p>
                            <?= $this->render('_detail', ['model' => $model]) ?>
                        </div>
                        <div class="col-md-6">
                            <p class="lead">Purchase Order Details</p>
                            <?= $this->render('/purchase-order/_detail', [
                                'model' => $model->purchaseOrder
                            ]) ?>
                        </div>
                    </div>

                    <hr>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <p class="lead">Quotation Details</p>
                            <?= $this->render('/quotation/_detail', [
                                'model' => $model->quotation
                            ]) ?>
                        </div>
                        <div class="col-md-6">
                            <p class="lead">Image Referrence</p>
                            <?= $this->render('/quotation/_images', [
                                'images' => $model->quotation->images,
                                'col' => 2
                            ]) ?>
                        </div>
                    </div>

                </div>
                <div class="tab-pane show " id="print_preview" role="tabpanel">
                    <?php if($permission->user_can('print-one')): ?>
                        <p>
                            <a href="#" class="btn btn-success btn-printer" data-url="<?= $print_url ?>">
                                Print
                            </a>
                        </p> 
                    <?php endif; ?>

                    <div class="card print-card">
                        <div class="card-body">
                            <?= $this->render('_print_one_preview', ['model' => $model]) ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

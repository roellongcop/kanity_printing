<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\DailyOutput */

$this->title = $model->quotationNo;
$this->params['breadcrumbs'][] = ['label' => 'Daily Outputs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;
$user = $model->user;
$quotation = $model->quotation;
$jobOrder = $model->jobOrder;
$purchaseOrder = $model->purchaseOrder;

$attr = [
  'quantity',
  'createdAt',
  'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}


$jo_attr = [
  'jo_no',
  'quantity',
  'served_quantity',
  'pending_quantity',
  'note:ntext',
    [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $jobOrder->currentStatusClass
    ],
  // 'createdAt',
  // 'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($jo_attr, ['label' => 'Status','value' => $jobOrder->statusTitle]);
    array_push($jo_attr, ['label' => 'Created By','value' => $jobOrder->createdByName]);
    array_push($jo_attr, ['label' => 'Updated By','value' => $jobOrder->updatedByName]);
}

$quotation_attr = [
    'quotation_no',
    'specs',
    'quantity',
    // 'pending_quantity',
    [
        'label' => 'Mode of Payment',
        'value' => $quotation->mop
    ],
    [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $quotation->currentStatusClass
    ],
    'price_per_piece',
    'typeOfServiceName',
    'paymentType',
    'description:ntext',

    // 'createdAt',
    // 'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($quotation_attr, ['label' => 'Process By', 'value' => $quotation->processByUsername ]);
    array_push($quotation_attr, ['label' => 'Status','value' => $quotation->statusTitle]);
    array_push($quotation_attr, ['label' => 'Created By','value' => $quotation->createdByName]);
    array_push($quotation_attr, ['label' => 'Updated By','value' => $quotation->updatedByName]);
}
array_push($quotation_attr, 'note');


$po_attr = [
  'po_no',
  'quantity',
  'served_quantity',
  'pending_quantity',
  'arStatus',
   [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $purchaseOrder->currentStatusClass
    ],
  'customer_note:ntext',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($po_attr, ['label' => 'Status','value' => $purchaseOrder->statusTitle]);
    array_push($po_attr, ['label' => 'Created By','value' => $purchaseOrder->createdByName]);
    array_push($po_attr, ['label' => 'Updated By','value' => $purchaseOrder->updatedByName]);
}


?>

<div class="card mt10px">
    <div class="card-body">
        <div class="daily-output-view">

            <p>
                <?= $permission->button(['create', 'delete'], $model) ?>
            </p>
            <hr>

            <div class="row">
                <div class="col-md-6">
                    <p class="lead">Daily Output Details</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $attr,
                    ]) ?>
                </div>

                <div class="col-md-6">
                    <p class="lead">Job Order Details
                        <?= Html::a('<i class="fa fa-eye"></i>', [
                            'job-order/view', 'id' => $jobOrder->id
                        ]) ?>
                    </p>
                    <?= DetailView::widget([
                        'model' => $jobOrder,
                        'attributes' => $jo_attr,
                    ]) ?>
                </div>
            </div>

            <hr>


            <div class="row">
                

                <div class="col-md-6">
                    <p class="lead">Purchased Order Details
                        <?= Html::a('<i class="fa fa-eye"></i>', [
                            'purchase-order/view', 'id' => $purchaseOrder->id
                        ]) ?>
                    </p>
                    <?= DetailView::widget([
                        'model' => $purchaseOrder,
                        'attributes' => $po_attr,
                    ]) ?>
                </div>
                <div class="col-md-6">
                    <p class="lead">User Details 
                        <?= Html::a('<i class="fa fa-eye"></i>', [
                            'user/view', 'id' => $user->id
                        ]) ?>
                    </p>
                    <?= DetailView::widget([
                    'model' => $user,
                        'attributes' => [
                            'profile_picture:raw',
                            'username',
                            'profile.fullname',
                            'profile.email',
                            'profile.contact_number',
                            'profile.company_name',
                            'profile.company_address',
                            'profile.tin',
                        ],
                    ]) ?>
                </div>
            </div>

            <hr>

            <div class="row">
                <div class="col-md-6">
                    <p class="lead">Quotation Details 
                        <?= Html::a('<i class="fa fa-eye"></i>', [
                            'quotation/view', 'id' => $quotation->id
                        ]) ?>
                    </p>
                    <?= DetailView::widget([
                        'model' => $quotation,
                        'attributes' => $quotation_attr,
                    ]) ?>
                </div>
                <div class="col-md-6">
                    <p class="lead">Image Referrence</p>
                    <?= $this->render('/quotation/_images', ['images' => $quotation->images]) ?>
                </div>
            </div>

        </div>
    </div>
</div>

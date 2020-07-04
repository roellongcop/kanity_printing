<?php
use yii\widgets\DetailView;

$attr = [
  'quotationNo',
  'purchaseOrderNo',
  'jo_no',
  'paymentType',
  'quantity',
  'served_quantity',
  'pending_quantity',
  'note:ntext',
    [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $model->currentStatusClass
    ],
  // 'createdAt',
  // 'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($attr, ['label' => 'Updated By','value' => $model->updatedByName]);
} 

?>

<p class="lead">Job Order Details</p>
<?= DetailView::widget([
    'model' => $model,
    'attributes' => $attr,
]) ?>
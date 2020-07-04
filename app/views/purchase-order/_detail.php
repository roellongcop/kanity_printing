<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\PurchaseOrder */

$permission = Yii::$app->permission;

$attr = [
  'quotationNo',
  'po_no',
  'quantity',
  'served_quantity',
  'pending_quantity',
  'paymentType',
  'customer_note:ntext',
  'arStatus',
  [
    'label' => 'Process Status',
    'format' => 'raw',
    'value' => $model->currentStatusClass,
  ],
  'createdAt',
  'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}

?>

<?= DetailView::widget([
    'model' => $model,
    'attributes' => $attr,
]) ?>
<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\AcknowledgmentReceipt */

$permission = Yii::$app->permission;

$attr = [
  'purchaseOrderNo',
  'received_by',
  'quantity',
  'delivery_date',
  'deliveryStatus',
  'particular:ntext',
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
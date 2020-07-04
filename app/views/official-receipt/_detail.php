<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\OfficialReceipt */

$attr = [
  'salesInvoiceNo',
  'no',
  'createdAt',
  'updatedAt',
  'date',
  'received_from',
  'tin',
  'address:ntext',
  'business_style',
  'sum_of',
  'payment_for',
  'cashier',
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
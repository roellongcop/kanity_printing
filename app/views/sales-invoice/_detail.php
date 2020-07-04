<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\SalesInvoice */

$permission = Yii::$app->permission;

$attr = [
  'total',
  'purchaseOrderNo',
  'company_name',
  'company_address',
  'contact_person',
  'no',
  'prepared_by',
  'noted_by',
  'paymentStatus',
  'reason',
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
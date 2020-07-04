<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Notification */

$attr = [
  'user_id',
  'message:ntext',
  'controller',
  'action',
  'ref_id',
  'read_status',
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
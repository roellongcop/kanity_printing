<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Log */

$attr = [
  'user_id',
  'ref_id',
  'request_data:ntext',
  'change_attribute:ntext',
  'method',
  'url:ntext',
  'action',
  'controller',
  'model',
  'user_agent:ntext',
  'ip',
  'browser',
  'os',
  'device',
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
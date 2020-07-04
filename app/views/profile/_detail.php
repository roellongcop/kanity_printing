<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Profile */

$attr = [
  'user_id',
  'first_name',
  'middle_name',
  'last_name',
  'position',
  'company_name',
  'company_address:ntext',
  'tin',
  'email:email',
  'contact_number',
  'image:ntext',
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
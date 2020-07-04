<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Portfolio */

$attr = [
  'portfolio_category_id',
  'name',
  'description:ntext',
  'createdAt',
  'updatedAt',
  'image:ntext',
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
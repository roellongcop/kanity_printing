<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStock */

$attr = [
  'name',
  'categoryName',
  'unit',
  'description:ntext',
  'max_stock',
  'min_stock',
  'current_stock',
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
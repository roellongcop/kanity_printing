<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Quotation */

$permission = Yii::$app->permission;

$attr = [
    'quotation_no',
    'specs',
    'quantity',
    [
        'label' => 'Mode of Payment',
        'value' => $model->mop
    ],
    [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $model->currentStatusClass
    ],
    'price_per_piece',
    'typeOfServiceName',
    'description:ntext',

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
<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Role */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Roles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;
$attr = [
    'name',
    // 'module_access:ntext',
    // 'user_access:ntext',
    'statusTitle',
    'createdAt',
    'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}

?>

<div class="card mt10px">
    <div class="card-body">
        <div class="role-view">

            <p>
                <?= $permission->button(['create', 'update', 'delete'], $model) ?>
            </p>

            <?= DetailView::widget([
                'model' => $model,
                'attributes' => $attr,
            ]) ?>

        </div>
    </div>
</div>

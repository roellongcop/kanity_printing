<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\DashboardCarousel */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Dashboard Carousels', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;

$attr = [
  'name',
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

<div class="card mt10px">
    <div class="card-body">
        <div class="dashboard-carousel-view">

            <p>
                <?= $permission->button(['create', 'update', 'delete'], $model) ?>
            </p>

            <div class="row">
                <div class="col-md-7">
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $attr,
                    ]) ?>
                </div>
                <div class="col-md-5">
                    <img src="<?= Yii::$app->general->file_path($model->image) ?>" class="img-thumbnail">
                </div>
            </div>

        </div>
    </div>
</div>

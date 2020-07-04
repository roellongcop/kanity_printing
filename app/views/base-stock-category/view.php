<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStockCategory */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Base Stock Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;

?>

<div class="card mt10px">
    <div class="card-body">
        <div class="base-stock-category-view">

            <p>
                <?= $permission->button(['create', 'update', 'delete'], $model) ?>
            </p>


            <?=  $this->render('_detail', ['model' => $model]) ?>

        </div>
    </div>
</div>

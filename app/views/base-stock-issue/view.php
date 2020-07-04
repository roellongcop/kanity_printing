<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStockIssue */

$this->title = $model->stockName;
$this->params['breadcrumbs'][] = ['label' => 'Base Stock Issues', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;

?>

<div class="card mt10px">
    <div class="card-body">
        <div class="base-stock-issue-view">

            <p>
                <?= $permission->button(['create', 'update', 'delete'], $model) ?>
            </p>


            <?=  $this->render('_detail', ['model' => $model]) ?>

        </div>
    </div>
</div>

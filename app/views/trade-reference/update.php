<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\TradeReference */

$this->title = 'Update Trade Reference: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Trade References', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="trade-reference-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

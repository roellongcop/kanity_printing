<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ModeOfPayment */

$this->title = 'Update Mode Of Payment: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Mode Of Payments', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="mode-of-payment-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

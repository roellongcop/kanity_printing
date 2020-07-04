<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ModeOfPayment */

$this->title = 'Create Mode Of Payment';
$this->params['breadcrumbs'][] = ['label' => 'Mode Of Payments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="mode-of-payment-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

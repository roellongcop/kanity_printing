<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AcknowledgmentReceipt */

$this->title = 'Update Acknowledgment Receipt: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Acknowledgment Receipts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="acknowledgment-receipt-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

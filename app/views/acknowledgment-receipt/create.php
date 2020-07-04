<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AcknowledgmentReceipt */

$this->title = 'Create Acknowledgment Receipt';
$this->params['breadcrumbs'][] = ['label' => 'Acknowledgment Receipts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="acknowledgment-receipt-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

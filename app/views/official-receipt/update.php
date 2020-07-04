<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\OfficialReceipt */

$this->title = 'Update Official Receipt: ' . $model->no;
$this->params['breadcrumbs'][] = ['label' => 'Official Receipts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->no, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="official-receipt-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

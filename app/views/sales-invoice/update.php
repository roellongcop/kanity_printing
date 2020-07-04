<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SalesInvoice */

$this->title = 'Update Sales Invoice: ' . $model->no;
$this->params['breadcrumbs'][] = ['label' => 'Sales Invoices', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->no, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="sales-invoice-update">

			
		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

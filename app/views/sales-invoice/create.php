<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SalesInvoice */

$this->title = 'Create Sales Invoice';
$this->params['breadcrumbs'][] = ['label' => 'Sales Invoices', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="sales-invoice-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

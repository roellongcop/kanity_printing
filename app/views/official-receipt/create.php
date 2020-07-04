<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\OfficialReceipt */

$this->title = 'Create Official Receipt';
$this->params['breadcrumbs'][] = ['label' => 'Official Receipts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="official-receipt-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

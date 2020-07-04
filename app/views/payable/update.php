<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Payable */

$this->title = 'Update Payable: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Payables', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="payable-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

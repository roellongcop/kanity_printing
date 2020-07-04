<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Quotation */

$this->title = 'Update Quotation: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Quotations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => ($model->user)? $model->user->username: '', 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="quotation-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

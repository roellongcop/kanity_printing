<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\TypeOfService */

$this->title = 'Update Type Of Service: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Type Of Services', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="type-of-service-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Specification */

$this->title = 'Update Specification: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Specifications', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="specification-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

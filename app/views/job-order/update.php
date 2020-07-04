<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\JobOrder */

$this->title = 'Update Job Order: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Job Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="job-order-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\DailyOutput */

$this->title = 'Update Daily Output: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Daily Outputs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="daily-output-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

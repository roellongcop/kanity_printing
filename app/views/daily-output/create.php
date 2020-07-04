<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\DailyOutput */

$this->title = 'Create Daily Output';
$this->params['breadcrumbs'][] = ['label' => 'Daily Outputs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="daily-output-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

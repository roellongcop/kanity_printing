<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\JobOrder */

$this->title = 'Create Job Order';
$this->params['breadcrumbs'][] = ['label' => 'Job Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="job-order-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

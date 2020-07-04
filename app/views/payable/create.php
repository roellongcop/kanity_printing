<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Payable */

$this->title = 'Create Payable';
$this->params['breadcrumbs'][] = ['label' => 'Payables', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="payable-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

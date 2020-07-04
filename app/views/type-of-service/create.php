<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\TypeOfService */

$this->title = 'Create Type Of Service';
$this->params['breadcrumbs'][] = ['label' => 'Type Of Services', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="type-of-service-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

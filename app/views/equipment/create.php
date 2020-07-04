<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Equipment */

$this->title = 'Create Equipment';
$this->params['breadcrumbs'][] = ['label' => 'Equipments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="equipment-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

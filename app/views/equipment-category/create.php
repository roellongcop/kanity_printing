<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\EquipmentCategory */

$this->title = 'Create Equipment Category';
$this->params['breadcrumbs'][] = ['label' => 'Equipment Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="equipment-category-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStockUnit */

$this->title = 'Create Base Stock Unit';
$this->params['breadcrumbs'][] = ['label' => 'Base Stock Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="base-stock-unit-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStockCategory */

$this->title = 'Create Base Stock Category';
$this->params['breadcrumbs'][] = ['label' => 'Base Stock Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="base-stock-category-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

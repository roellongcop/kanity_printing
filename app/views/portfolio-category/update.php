<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PortfolioCategory */

$this->title = 'Update Portfolio Category: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Portfolio Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="portfolio-category-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

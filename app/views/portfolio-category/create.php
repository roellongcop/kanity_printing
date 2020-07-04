<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PortfolioCategory */

$this->title = 'Create Portfolio Category';
$this->params['breadcrumbs'][] = ['label' => 'Portfolio Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="portfolio-category-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

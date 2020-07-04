<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\DashboardCarousel */

$this->title = 'Create Dashboard Carousel';
$this->params['breadcrumbs'][] = ['label' => 'Dashboard Carousels', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="dashboard-carousel-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

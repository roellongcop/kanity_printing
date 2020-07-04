<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Portfolio */

$this->title = 'Create Portfolio';
$this->params['breadcrumbs'][] = ['label' => 'Portfolios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="portfolio-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

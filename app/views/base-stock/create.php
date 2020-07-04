<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStock */

$this->title = 'Create Base Stock';
$this->params['breadcrumbs'][] = ['label' => 'Base Stocks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="base-stock-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

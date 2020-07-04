<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\TradeReference */

$this->title = 'Create Trade Reference';
$this->params['breadcrumbs'][] = ['label' => 'Trade References', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="trade-reference-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

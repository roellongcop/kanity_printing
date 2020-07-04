<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Quotation */

$this->title = 'Create Quotation';
$this->params['breadcrumbs'][] = ['label' => 'Quotations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="quotation-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Specification */

$this->title = 'Create Specification';
$this->params['breadcrumbs'][] = ['label' => 'Specifications', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="specification-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

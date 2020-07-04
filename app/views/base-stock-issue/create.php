<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStockIssue */

$this->title = 'Create Base Stock Issue';
$this->params['breadcrumbs'][] = ['label' => 'Base Stock Issues', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="base-stock-issue-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Announcement */

$this->title = 'Update Announcement: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Announcements', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="announcement-update">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

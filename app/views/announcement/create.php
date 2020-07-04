<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Announcement */

$this->title = 'Create Announcement';
$this->params['breadcrumbs'][] = ['label' => 'Announcements', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card mt10px">
    <div class="card-body">
		<div class="announcement-create">


		    <?= $this->render('_form', [
		        'model' => $model,
		    ]) ?>

		</div>
	</div>
</div>

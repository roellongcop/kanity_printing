<?php if(Yii::$app->session->hasFlash('success')): ?>
	<div class="alert alert-success">
		<?= Yii::$app->session->getFlash('success') ?>
	</div>
<?php endif; ?>

<?php if(Yii::$app->session->hasFlash('danger')): ?>
	<div class="alert alert-danger">
		<?= Yii::$app->session->getFlash('danger') ?>
	</div>
<?php endif; ?>



<?php if(Yii::$app->session->hasFlash('warning')): ?>
	<div class="alert alert-warning">
		<?= Yii::$app->session->getFlash('warning') ?>
	</div>
<?php endif; ?>


<?php if(Yii::$app->session->hasFlash('info')): ?>
	<div class="alert alert-info">
		<?= Yii::$app->session->getFlash('info') ?>
	</div>
<?php endif; ?>
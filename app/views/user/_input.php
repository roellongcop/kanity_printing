<?php
use app\models\search\UserSearch;
?>

<?php if(Yii::$app->user->identity->roleAccess): ?>
	<?= $form->field($model, 'user_id')->dropDownList(
	    UserSearch::myAccess(), [
	        'class' => 'form-control select2'
	    ]
	)->label('User') ?>

<?php else: ?>
	<?= $form->field($model, 'user_id')->hiddenInput([
		'value' => Yii::$app->user->identity->id
	])->label(false) ?>

<?php endif; ?>



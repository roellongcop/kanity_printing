<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Notification */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="notification-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				
              <?= $form->field($model, 'user_id')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'message')->textarea(['rows' => 6]) ?>

              <?= $form->field($model, 'controller')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'action')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'ref_id')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'read_status')->textInput() ?>

			</div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

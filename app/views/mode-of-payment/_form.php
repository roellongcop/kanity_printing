<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ModeOfPayment */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mode-of-payment-form">

    <?php $form = ActiveForm::begin(); ?>

    	<div class="row">
    		<div class="col-md-5">
    			<?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    			<?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>
    		</div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Payable */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="payable-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				
              <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>


              <?= $form->field($model, 'amount')->textInput([
                'type' => 'number',
                'step' => '.01',
            ]) ?>

              <?= $form->field($model, 'date_paid')->textInput([
                'type' => 'date'
              ]) ?>

			</div>
            <div class="col-md-7">
              <?= $form->field($model, 'transaction')->textarea(['rows' => 5]) ?>
            </div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

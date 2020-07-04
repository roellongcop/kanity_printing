<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\TypeOfService */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="type-of-service-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				<?= $form->field($model, 'payment_type_id')->dropDownList(
                    Yii::$app->params['payment_type_id'], [
                        'prompt' => 'Select Payment Type'
                    ]
                ) ?>
                
                <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

			</div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

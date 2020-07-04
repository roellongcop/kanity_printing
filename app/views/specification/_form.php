<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Specification */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="specification-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				
              <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'paper')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

              <?= $form->field($model, 'watermark')->dropDownList(
                    Yii::$app->params['watermark']
                )?>

			</div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

use app\models\search\BaseStockCategorySearch;
use app\models\search\BaseStockUnitSearch;

/* @var $this yii\web\View */
/* @var $model app\models\BaseStock */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="base-stock-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-4">
                <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
				
                <?= $form->field($model, 'base_stock_category_id')->dropDownList(
                    BaseStockCategorySearch::dropdown(), [
                        'prompt' => 'Select Category'
                    ]
                ) ?>

                <?= $form->field($model, 'base_stock_unit_id')->dropDownList(
                    BaseStockUnitSearch::dropdown(), [
                        'prompt' => 'Select Unit'
                    ]
                ) ?>

			</div>
            <div class="col-md-8">
                <?= $form->field($model, 'description')->textarea(['rows' => 9]) ?>
            </div>
    	</div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'max_stock')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'min_stock')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'current_stock')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
        </div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

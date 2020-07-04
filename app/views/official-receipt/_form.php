<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\SalesInvoiceSearch;

/* @var $this yii\web\View */
/* @var $model app\models\OfficialReceipt */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="official-receipt-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-4">
                <?= $form->field($model, 'sales_invoice_id')->dropDownList(
                    SalesInvoiceSearch::dropdown(), [
                        'prompt' => 'Select Sales Invoice '
                    ]
                ) ?>






			</div>
            <div class="col-md-4">
                <?= $form->field($model, 'date')->textInput([
                    'type' => 'date'
                  ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'received_from')->textInput(['maxlength' => true]) ?>
            </div>
    	</div>
        <div class="row">
            <div class="col-md-4">
                 <?= $form->field($model, 'tin')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'business_style')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-8">
                <?= $form->field($model, 'address')->textarea(['rows' => 5]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
              <?= $form->field($model, 'sum_of')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-4">
              <?= $form->field($model, 'payment_for')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-4">
              <?= $form->field($model, 'cashier')->textInput(['maxlength' => true]) ?>
            </div>
        </div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

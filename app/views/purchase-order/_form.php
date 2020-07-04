<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\QuotationSearch;

/* @var $this yii\web\View */
/* @var $model app\models\PurchaseOrder */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="purchase-order-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				
                <?php if($model->isNewRecord): ?>
                    <?= $form->field($model, 'quotation_id')->dropDownList(
                        QuotationSearch::dropdown(['process_status' => 1])
                    ) ?>
                <?php endif; ?>

                <?= $form->field($model, 'po_no')->textInput(['maxlength' => true]) ?>


                <strong>Disclaimer:</strong> P.O. Number should be provided by the customer.

                <br> <br>
                <label>
                    <input type="checkbox" required="" value="1" id="agree-checkbox">
                    I Agree to <?= Html::a('Terms and Condition', '#toc-modal', [
                        'data-toggle' => 'modal'
                    ]) ?>
                </label>

			</div>
            <div class="col-md-7">
                <?= $form->field($model, 'customer_note')->textarea(['rows' => 5]) ?>
            </div>
    	</div>

    <div class="form-group">
                <br>
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?= $this->render('/setting/_toc_modal') ?>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\PurchaseOrderSearch;

/* @var $this yii\web\View */
/* @var $model app\models\AcknowledgmentReceipt */
/* @var $form yii\widgets\ActiveForm */
$src = <<< SCRIPT
    $('#acknowledgmentreceipt-purchase_order_id').on('change', function() {
        var id = $(this).val()
        $.ajax({
            url: base_url + 'acknowledgment-receipt/get-purchase-order',
            data: {id: id},
            dataType: 'json',
            success: function(res) {
                $('.po-details').html(res.po_details)
                $('.qo-details').html(res.quotation_details)
                $('#acknowledgmentreceipt-company_name').val(res.profile.company_name);
                $('#acknowledgmentreceipt-received_by').val(res.profile.first_name + ' ' + res.profile.last_name);
            }
        })    
    })
SCRIPT;
$this->registerJs($src);
?>

<div class="acknowledgment-receipt-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
                <?php if($model->isNewRecord): ?>
                    <?= $form->field($model, 'purchase_order_id')->dropDownList(
                        PurchaseOrderSearch::dropdown(['<>', 'pending_quantity', 0]), [
                            'prompt' => 'Select Purchase Order No'
                        ]
                    ) ?>
                    <?= $form->field($model, 'quantity')->textInput() ?>
                <?php else: ?>
                    <p class="lead"><?= $model->purchaseOrder->paymentType ?></p>
                    <label>Quantity: <?= $model->quantity ?></label>
                <?php endif; ?>


                <?= $form->field($model, 'company_name')->textInput([
                    'maxlength' => true
                ]) ?>

                <?= $form->field($model, 'received_by')->textInput([
                    'maxlength' => true
                ]) ?>

              <?= $form->field($model, 'delivery_date')->textInput([
                'type' => 'date'
              ]) ?>
              

              <?= $form->field($model, 'delivery_status')->dropDownList(
                Yii::$app->params['delivery_status']
              ) ?>

              <?= $form->field($model, 'particular')->textarea(['rows' => 6]) ?>
              <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>

			</div>

            <div class="col-md-7"> 

                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link show active" data-toggle="tab" href="#po-data" role="tab" aria-controls="home" aria-selected="true">
                         Purchase Order Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link show" data-toggle="tab" href="#qo-data" role="tab" aria-controls="profile" aria-selected="false">
                            Quotation Details
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="po-data" role="tabpanel">
                        <div class="po-details">
                            <?php if(!$model->isNewRecord): ?>
                                <?= $this->render('/purchase-order/_detail', ['model' => $model->purchaseOrder]) ?>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="tab-pane show " id="qo-data" role="tabpanel">
                        <div class="qo-details">
                            <?php if(!$model->isNewRecord): ?>
                                <?= $this->render('/quotation/_detail', ['model' => $model->purchaseOrder->quotation]) ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                
            </div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

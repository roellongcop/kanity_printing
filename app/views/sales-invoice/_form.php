<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\PurchaseOrderSearch;

/* @var $this yii\web\View */
/* @var $model app\models\SalesInvoice */
/* @var $form yii\widgets\ActiveForm */

$src = <<< SCRIPT
    $('#salesinvoice-purchase_order_id').on('change', function() {
        var id = $(this).val()
        $.ajax({
            url: base_url + 'sales-invoice/get-purchase-order',
            data: {id: id},
            dataType: 'json',
            success: function(res) {
                $('.po-details').html(res.po_details)
                $('.qo-details').html(res.quotation_details)

                if(res.profile) {
                     $('#salesinvoice-company_name').val(res.profile.company_name);
                    $('#salesinvoice-company_address').val(res.profile.company_address);
                    $('#salesinvoice-contact_person').val(res.profile.first_name + ' ' + res.profile.last_name);
                }
               
            }
        })    
    })
SCRIPT;
$this->registerJs($src);
?>

<div class="sales-invoice-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				
                <?= $form->field($model, 'purchase_order_id')->dropDownList(
                    PurchaseOrderSearch::dropdown(['pending_quantity' => 0]), [
                        'prompt' => 'Select Purchase Order No'
                    ]
                ) ?>

                <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'company_address')->textArea(['rows' => 5]) ?>

                <?= $form->field($model, 'contact_person')->textInput(['maxlength' => true]) ?>


                <?= $form->field($model, 'prepared_by')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'noted_by')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'payment_status')->dropDownList(
                    Yii::$app->params['payment_status']
                ) ?>

                <?= $form->field($model, 'reason')->textArea(['rows' => 5]) ?>

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

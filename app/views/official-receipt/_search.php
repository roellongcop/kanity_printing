<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\UserSearch;
use app\models\search\OfficialReceiptSearch;
use app\models\search\SalesInvoiceSearch;

/* @var $this yii\web\View */
/* @var $model app\models\search\OfficialReceiptSearch */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="card mt10px collapse"  id="search-panel">
    <div class="card-body">
        <div class="official-receipt-search">
            <p class="lead">Advanced Filter</p> <hr>

            <?php $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
                    ]); ?>

                <div class="row">  
                                                                                                    
                    <div class="col-md-3">
                        <?= $form->field($model, 'sales_invoice_id')->dropDownList(
                            SalesInvoiceSearch::dropdown(), [
                                'prompt' => 'All Sales Invoice '
                            ]
                        ) ?>
                    </div>
                                                              
                    <div class="col-md-3">
                        <?= $form->field($model, 'business_style')->dropDownList(
                            OfficialReceiptSearch::filter('business_style'), [
                                'prompt' => 'All Business Style'
                            ]
                        ) ?>
                    </div>
                                                                                
                                                          
                    <div class="col-md-3">
                        <?= $form->field($model, 'payment_for')->dropDownList(
                            OfficialReceiptSearch::filter('payment_for'), [
                                'prompt' => 'All Payment For'
                            ]
                        ) ?>
                    </div>
                                                                                
                    <div class="col-md-3">
                        <?= $form->field($model, 'cashier')->dropDownList(
                            OfficialReceiptSearch::filter('cashier'), [
                                'prompt' => 'All Cashier'
                            ]
                        ) ?>
                    </div>
                                        
                    <?php if(Yii::$app->user->identity->roleAccess): ?>
                        <div class="col-md-3">
                            <?= $form->field($model, 'created_by')->dropDownList(
                                UserSearch::myAccess(), [
                                    'prompt' => 'All Created by'
                                ]
                            )->label('Created By') ?>
                        </div>

                        <div class="col-md-3">
                            <?= $form->field($model, 'updated_by')->dropDownList(
                                UserSearch::myAccess(), [
                                    'prompt' => 'All Updated by'
                                ]
                            )->label('Updated By') ?>
                        </div>
                    <?php endif; ?>

                    <div class="col-md-3">
                        <?= $form->field($model, 'pagination')->dropDownList(
                            Yii::$app->params['pagination']
                        )->label('Pagination') ?>
                    </div>
                </div>
                <div class="form-group"><br>
                    <?= Html::a('Reset', ['index'], ['class' => 'btn btn-primary btn-sm']) ?>
                    <?= Html::submitButton('Search', ['class' => 'btn btn-primary  btn-sm']) ?>
                </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>

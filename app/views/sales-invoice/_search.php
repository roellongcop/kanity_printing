<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\UserSearch;
use app\models\search\SalesInvoiceSearch
/* @var $this yii\web\View */
/* @var $model app\models\search\SalesInvoiceSearch */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="card mt10px collapse"  id="search-panel">
    <div class="card-body">
        <div class="sales-invoice-search">
            <p class="lead">Advanced Filter</p> <hr>

            <?php $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
                    ]); ?>

                <div class="row">  
                              
                                            
                    <div class="col-md-3">
                        <?= $form->field($model, 'no')->dropDownList(
                            SalesInvoiceSearch::filter('no'), [
                                'prompt' => 'All No'
                            ]
                        ) ?>
                    </div>
                                            
                    <div class="col-md-3">
                        <?= $form->field($model, 'pickup_date')->dropDownList(
                            SalesInvoiceSearch::filter('pickup_date'), [
                                'prompt' => 'All Pickup Date'
                            ]
                        ) ?>
                    </div>
                                            
                    <div class="col-md-3">
                        <?= $form->field($model, 'prepared_by')->dropDownList(
                            SalesInvoiceSearch::filter('prepared_by'), [
                                'prompt' => 'All Prepared By'
                            ]
                        ) ?>
                    </div>
                                            
                    <div class="col-md-3">
                        <?= $form->field($model, 'noted_by')->dropDownList(
                            SalesInvoiceSearch::filter('noted_by'), [
                                'prompt' => 'All Noted By'
                            ]
                        ) ?>
                    </div>
                                            
                    <div class="col-md-3">
                        <?= $form->field($model, 'payment_status')->dropDownList(
                            Yii::$app->params['payment_status'], [
                                'prompt' => 'All Payment Status'
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

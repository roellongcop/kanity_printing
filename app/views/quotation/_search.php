<?php

use yii\helpers\ArrayHelper;
use yii\helpers\Html; 
use yii\widgets\ActiveForm;
use app\models\search\UserSearch;
use app\models\search\TypeOfServiceSearch;
use app\models\search\ModeOfPaymentSearch;

/* @var $this yii\web\View */
/* @var $model app\models\search\QuotationSearch */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="card mt10px collapse"  id="search-panel">
    <div class="card-body">
        <div class="quotation-search">
            <p class="lead"> Advanced Filter </p>

            <hr>
            <?php $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
            ]); ?>

                <div class="row">
                    <div class="col-md-3">
                        <?= $form->field($model, 'mode_of_payment_id')->dropDownList(
                            ModeOfPaymentSearch::dropdown(), [
                                'prompt' => 'All Mode of Payment'
                            ]
                        ) ?>
                    </div>

                    <div class="col-md-3">
                        <?= $form->field($model, 'type_of_service_id')->dropDownList(
                            TypeOfServiceSearch::dropdown(), [
                                'prompt' => 'All Type of Service'
                            ]
                        ) ?>
                    </div>

                    <div class="col-md-3">
                        <?= $form->field($model, 'process_status')->dropDownList(
                            ArrayHelper::map(Yii::$app->params['process_status'], 'id', 'title'), [
                                'prompt' => 'All Process Status'
                            ]
                        )->label('Process Status') ?>
                    </div>
                   
                    

                    <?php if(Yii::$app->user->identity->roleAccess): ?>
                        <div class="col-md-3">
                            <?= $form->field($model, 'user_id')->dropDownList(
                                UserSearch::myAccess(), [
                                    'prompt' => 'All User'
                                ]
                            )->label('User') ?>
                        </div>
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
                <?= Html::submitButton('Search', ['class' => 'btn btn-primary btn-sm']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>

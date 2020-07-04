<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\UserSearch;
use app\models\search\BaseStockSearch;
/* @var $this yii\web\View */
/* @var $model app\models\BaseStockIssue */
/* @var $form yii\widgets\ActiveForm */

$src = <<< SCRIPT
    $('#basestockissue-base_stock_id').on('change', function() {
        var id = $(this).val()
        $.ajax({
            url: base_url + 'base-stock-issue/get-base-stock-detail',
            data: {id: id},
            dataType: 'html',
            success: function(res) {
                $('.basestock-details').html(res);
            }
        })    
    });

    $('#basestockissue-user_id').on('change', function() {
        var id = $(this).val()
        $.ajax({
            url: base_url + 'base-stock-issue/get-user-detail',
            data: {id: id},
            dataType: 'html',
            success: function(res) {
                $('.user-details').html(res);
            }
        })    
    });
SCRIPT;
$this->registerJs($src);

?>

<div class="base-stock-issue-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				
                <?= $form->field($model, 'base_stock_id')->dropDownList(
                    BaseStockSearch::dropdown(), [
                        'prompt' => 'Select Base Stock '
                    ]
                ) ?>

                <?= $form->field($model, 'user_id')->dropDownList(
                    UserSearch::myAccess(), [
                        'prompt' => 'Select User '
                    ]
                ) ?>

                <?= $form->field($model, 'quantity')->textInput() ?>

                <div class="form-group">
                    <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                </div>
                
			</div>
            <div class="col-md-7">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link show active" data-toggle="tab" href="#basestock" role="tab" aria-controls="home" aria-selected="true">
                        <i class="icons cui-note"></i> Basestock Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link show" data-toggle="tab" href="#user" role="tab" aria-controls="profile" aria-selected="false">
                            <i class="icon-basket-loaded"></i> User Details
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="basestock" role="tabpanel">
                        <div class="basestock-details"> </div>
                    </div>
                    <div class="tab-pane show" id="user" role="tabpanel">
                        <div class="user-details"> </div>
                    </div>
                </div>
            </div>
    	</div>

    

    <?php ActiveForm::end(); ?>

</div>

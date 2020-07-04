<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\UserSearch;

/* @var $this yii\web\View */
/* @var $model app\models\search\RoleSearch */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="card mt10px collapse"  id="search-panel">
    <div class="card-body">
        <div class="role-search">
            <p class="lead">Advanced Filter</p> <hr>
            <?php $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
            ]); ?>

                <div class="row">
                  
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
                </div>


            <div class="form-group"><br>
                <?= Html::a('Reset', ['index'], ['class' => 'btn btn-primary btn-sm']) ?>
                <?= Html::submitButton('Search', ['class' => 'btn btn-primary btn-sm']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>

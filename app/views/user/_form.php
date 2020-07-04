<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\RoleSearch;

/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-5">
            <?= $form->field($model, 'role_id')->dropDownList(
                RoleSearch::myAccess(), [
                    'prompt' => 'Select User'
                ]
            )->label('Role') ?>
            <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>
            <?= $form->field($model, 'password_confirm')->passwordInput(['maxlength' => true]) ?>


            <?php if(Yii::$app->user->identity->super_admin): ?>
                <?= $form->field($model, 'super_admin')->checkbox() ?>
            <?php endif; ?>

            <div class="form-group">
                <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
            </div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>

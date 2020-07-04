<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = 'Signup';
?>

<section class="main__middle__container">
    <div class="row blue__line">
        <div class="container text-center">
            <h1>Signup</h1>
        </div>
    </div>
    <div class="container">
        <div class="row no_padding nothing no-margin">
            <h4>PERSONAL INFORMATION</h4>
            <hr>
            <?php $form = ActiveForm::begin(); ?>
                <div class="one_third">
                    <?= $form->field($profile, 'last_name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="one_third">
                    <?= $form->field($profile, 'middle_name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="one_third column-last">
                    <?= $form->field($profile, 'first_name')->textInput(['maxlength' => true]) ?>
                </div>

                <div class="dc_clear"></div>


                <div class="one_third">
                    <?= $form->field($profile, 'email')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="one_third">
                    <?= $form->field($profile, 'contact_number')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="one_third column-last">
                    <?= $form->field($profile, 'tin')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="dc_clear"></div>

                
                <div class="one_third">
                    <?= $form->field($profile, 'company_name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="one_third">
                    <?= $form->field($profile, 'company_address')->textInput() ?>
                </div>
                <div class="one_third column-last">
                    <?= $form->field($profile, 'position')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="dc_clear"></div>
                <hr>
                <h4>ACCOUNT INFORMATION</h4>
                <hr>


                <div class="one_third">
                    <?= $form->field($user, 'username')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="one_third">
                    <?= $form->field($user, 'password')->passwordInput(['maxlength' => true]) ?>
                </div>
                <div class="one_third column-last">
                    <?= $form->field($user, 'password_confirm')->passwordInput(['maxlength' => true]) ?>
                </div>
                <div class="dc_clear"></div>
                


                <div class="one_third">
                    <?= Html::submitButton('Signup', ['class' => 'btn btn-primary']) ?> <br> <br>
                    <p>Already have an account ? <?= Html::a('Login here', ['site/login']) ?></p>
                </div>

            <?php ActiveForm::end(); ?>
        </div>
    </div>
</section>
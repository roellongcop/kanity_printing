<?php
use yii\helpers\Html;
use yii\helpers\Url;
$this->title = 'Signup Success';
?>

<section class="main__middle__container">
    <div class="row blue__line">
        <div class="container text-center">
            <h1>Signup Success</h1>
        </div>
    </div>
    <div class="container">
        <div class="row no_padding nothing no-margin">
            <h4>EMAIL VERIFICATION</h4>
            <hr>
            <p>
                Hi <b><?=  $model->profile? $model->profile->fullname: '' ?></b>! Thankyou for signing up to Kanity Printing. <br>
                Please click the button below for verification. <br>
                <?= Html::a('Verify Account', Url::to(['site/verification', 'access_token' => $model->access_token], true), [
                    'class' => 'dc_fb_button'
                ]) ?>

            </p>
           
        </div>
    </div>
</section>
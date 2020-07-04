<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\helpers\Url;

$this->title = 'Authorization Email';
$this->params['breadcrumbs'][] = $this->title;

$url = Url::to(['site/verification', 'auth_key' => $auth_key], true);

?>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card mx-4">
                <div class="card-body p-4">
                    <h1>Email Verification</h1>
                    <p class="text-muted">Click the button below for completing registration</p>
                </div>
                <div class="card-footer p-4">
                    <?= Html::a( $url , $url) ?>
                </div>
            </div>
        </div>
        
    </div>
</div>


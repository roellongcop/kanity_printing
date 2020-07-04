<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
$code = str_replace(['(#', ')'], ['', ''], strstr($name, '(#'));
?>


<div class="container" style="color: #fff;background-color: #00000094; padding: 2%;">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="clearfix">
        <h1 class="float-left display-3 mr-4"><?= $code ?></h1>
        <h4 class="pt-3">Oops! You're lost.</h4>
        <p >  <?= nl2br(Html::encode($message)) ?></p>
      </div>
      <div class="input-prepend input-group">
        <div class="input-group-prepend">
          <span class="input-group-text">
            <i class="fa fa-search"></i>
          </span>
        </div>
        <input class="form-control" id="prependedInput" size="16" type="text" placeholder="What are you looking for?">
        <span class="input-group-append">
            <?= Html::a('Dashboard', ['/dashboard'], ['class' => 'btn btn-primary']) ?>
        </span>
      </div>
    </div>
  </div>
</div>

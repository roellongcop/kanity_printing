<?php
$setting = Yii::$app->general->setting();
?>
<div class="row">
    <div class="col-md-3 col-xs-3"></div>
    <div class="col-md-6 col-xs-6">

        <div class="text-center">
            <img class="navbar-brand-full" 
                src="<?= Yii::$app->general->logo() ?>" 
                alt="CoreUI Logo" style="width: 100%;">

            <div class="mtn40">
                <?= $setting['company_address'] ?> <br>
                TEL NO: <?= $setting['company_phone_no'] ?>  FAX: <?= $setting['company_fax_no'] ?>
            </div>
            <br><br>

            <h3><?= $title ?> </h3>
        </div>

    </div>
</div>
<br><br>
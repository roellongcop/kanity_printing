<?php
use app\models\search\TradeReferenceSearch;
$setting = Yii::$app->general->setting();

?>
<div class="row no-margin no_padding grey-info-block text-center"> </div>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h3>About</h3>
                <p><?= $setting['company_tag_line'] ?> <br />
                <br />
                <?= $setting['company_description'] ?></p>
            </div>
            <div class="col-md-3">
                <h3>our Business</h3>
                <p>
                    <span>Form of Business</span> <br>
                    <?= $setting['form_of_business'] ?>
                </p>
                <p>
                    <span>Line of Business</span> <br>
                    <?= $setting['line_of_business'] ?>
                </p>

                <p>
                    <span>Tax Identification No</span> <br>
                    <?= $setting['tin'] ?>
                </p>
                
                <p>
                    <span>SEC Reg. No</span> <br>
                    <?= $setting['reg_no'] ?>
                </p>

                
            </div>
            <div class="col-md-3">
                <h3>Trade Reference</h3>
                <p>Our Best partners and clients!</p>
                <br />
                <?php if(($trades = TradeReferenceSearch::dropdown(false)) != null): ?>
                    <?php foreach ($trades as $key => $trade) : ?>
                        <p> <span><?= ucwords($trade->name) ?></span> </p>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
            <div class="col-md-3">
                <h3>Social</h3>
                <p><?= $setting['company_address'] ?>
                    <br />
                    Phone: <?= $setting['company_phone_no'] ?><br />
                    Fax: <?= $setting['company_fax_no'] ?><br />
                    <br />
                </p>
                <div class="social__icons"> 
                    <a href="<?= $setting['twitter'] ?>" class="socialicon socialicon-twitter"></a> 
                    <a href="<?= $setting['facebook'] ?>" class="socialicon socialicon-facebook"></a> 
                    <a href="<?= $setting['google'] ?>" class="socialicon socialicon-google"></a> 
                    <a href="<?= $setting['email'] ?>" class="socialicon socialicon-mail"></a> 
                </div>
            </div>
        </div>
        <hr>
        <p class="text-center"> <?= $setting['company_name'] ?> | Infinity.free.com</p>
    </div>
</footer>
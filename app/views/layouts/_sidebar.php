<?php
use yii\helpers\Html; 



$menu = json_decode(Yii::$app->general->setting('menu'), true);

?>


<!-- <li class="nav-title">Theme</li> -->

           
<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">


            <?php Yii::$app->template->createSidebar($menu); ?>
        </ul>
    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>
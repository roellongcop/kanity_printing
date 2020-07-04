<?php
use yii\helpers\Html;
use app\models\search\ServiceSearch;
$setting = Yii::$app->general->setting();
$company_name = explode(' ', $setting['company_name']);
unset($company_name[0]);
$span = implode(' ', $company_name);

$controller = Yii::$app->controller->id;
?>

<header class="main__header">
    <div class="container bb">
        <nav class="navbar navbar-default" role="navigation"> 
            <!-- Brand and toggle get grouped for better mobile display --> 
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-header">
                <h1 class="navbar-brand">
                    <a href="index.html">
                        <?= explode(' ', $setting['company_name'])[0] ?><span> <?= $span ?></span>
                    </a>
                </h1>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
                    <span class="sr-only">Toggle navigation</span> 
                    <span class="icon-bar"></span> 
                    <span class="icon-bar"></span> 
                    <span class="icon-bar"></span> 
                </button>
            </div>

            <div class="navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="<?= ($controller == 'site')? 'active': '' ?>">
                        <?= Html::a('Home', ['site/home']) ?>
                    </li>

                    <li class="dropdown"> 
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services</a>
                        <?php if(($services = ServiceSearch::dropdown(false)) != null): ?>
                            <ul class="dropdown-menu">
                                <?php foreach ($services as $service) : ?>
                                    <li>
                                    <li><?= Html::a(ucwords($service->name), ['our-service/view', 'id' => $service->id]) ?></li>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        <?php endif; ?>
                    </li>
                    <li class="<?= ($controller == 'our-portfolio')? 'active': '' ?>">
                        <?= Html::a('Portfolio', ['our-portfolio/index']) ?>
                    </li>
                    <li class="<?= ($controller == 'our-product')? 'active': '' ?>">
                        <?= Html::a('Products', ['our-product/index']) ?>
                    </li>
                    <li class="<?= ($controller == 'our-equipment')? 'active': '' ?>">
                        <?= Html::a('Equipments', ['our-equipment/index']) ?>
                    </li>
                    <li> 
                        <?= Html::a('Signup', ['site/signup']) ?> 
                    </li>
                    <li> 
                        <?php if(Yii::$app->user->isGuest): ?>
                            <?= Html::a('Login', ['site/login']) ?> 
                        <?php else: ?>
                            <?= Html::a('Dashboard', ['dashboard/index']) ?> 
                        <?php endif; ?>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse --> 
        </nav>
    </div>
</header>

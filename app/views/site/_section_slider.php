<?php
use yii\helpers\Html;
use app\models\search\DashboardCarouselSearch;
?>

<section class="slider">
    <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <?php if(($carousels = DashboardCarouselSearch::dropdown(false)) != null): ?>
                <?php foreach ($carousels as $key => $carousel) : ?>
                    <div class="item <?= ($key == 0)? 'active': '' ?>"> 
                        <img data-src="<?= Yii::$app->general->file_path($carousel->image) ?>" alt="First slide" src="<?= Yii::$app->general->file_path($carousel->image) ?>">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1><?= $carousel->name ?></h1>
                                <p><?= $carousel->description ?></p>
                                <p>
                                    <?= Html:: a('get started', ['site/signup'], [
                                        'class' => 'btn btn-primary btn-lg'
                                    ]) ?>
                                </p>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon carousel-control-left"></span>
        </a> 
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon carousel-control-right"></span>
        </a> 
    </div>
</section>
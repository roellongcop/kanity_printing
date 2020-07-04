<?php
use yii\helpers\Html;
use app\models\search\ProductSearch;
use app\models\search\ServiceSearch;
use app\models\search\AnnouncementSearch;


?>

<!--end of slider section-->
<section class="main__middle__container">
    <?php if(($announcement = AnnouncementSearch::latest()) != null): ?>
        <div class="row text-center no-margin">
            <div class="container">
                <h1 class="page_title" style="font-size: 50px;"><?= $announcement->name ?></h1>
                <p class="big-paragraph">Our Latest Announcement Information</p>
                <p class="small-paragraph"><?= $announcement->description ?></p>
            </div>
        </div>
    <?php endif; ?>
    

    <div class="row icons__blocks  text-center">
        <div class="container">
            <h2><span style="text-transform: capitalize;">Our Products</span></h2>
            <p class="small-paragraph">browse our best product</p>

            <?php if(($products = ProductSearch::dropdown(false, 3)) != null): ?>

                <?php foreach ($products as $key => $product) : ?>
                    <div class="col-md-4 <?= ($key == 1)? 'middle': '' ?>">
                        <h3>
                            <?= Html::a($product->name, ['our-product/index', 'service_id' => $product->service_id]) ?>
                        </h3>
                        <p class="smaller"><small><?= $product->tag_line ?></small></p>

                        <img src="<?= Yii::$app->general->file_path($product->image) ?>" alt="image" class="img-responsive img-rounded">

                        <p><?= $product->description ?> </p>
                    </div>
                <?php endforeach; ?>

            <?php endif; ?>

        </div>
    </div>


  


    <div class="row no-margin grey-info-block text-center pb-0">
        <div class="container">
            <h2><span style="text-transform: capitalize;">What we offer ?</span></h2>
            <p class="small-paragraph">We offer waht the best for our clients</p>
            <?php if(($services = ServiceSearch::dropdown(false, 2)) != null): ?>

                <?php foreach ($services as $key => $service) : ?>
                    <div class="col-md-6">
                        <h3><?= $service->name ?></h3>
                        <p class="small-paragraph light"><?= $service->tag_line ?></p>
                        <img style="height: 200px" src="<?= Yii::$app->general->file_path($service->image) ?>" alt="pic" class="img-rounded">
                        <p><?= $service->description ?></p>
                        <p>
                            <?= Html::a('Learn More', ['our-service/view', 'id' => $service->id], [
                                'class' => 'btn btn-primary btn-md'
                            ]) ?>
                        </p>
                    </div>
                <?php endforeach; ?>

            <?php endif; ?>
        </div>
    </div>
</section>
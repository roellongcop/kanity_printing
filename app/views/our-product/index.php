<?php
use yii\helpers\Html;
$this->title = 'Products'; 
?>

<section class="main__middle__container">
  <div class="row blue__line">
    <div class="container text-center">
      <h1><?= $this->title ?></h1>
      <h4><?= $serviceName ?></h4>
      <!-- <p class="big-paragraph">Our Products</p> -->
    </div>
  </div>
  <section class="recent-posts">
    <div class="container">
      <div class="row no_padding nothing no-margin to_top">
        <div class="col-md-9">

          <?php foreach ($models as $model) : ?>
              <article> 
                <img src="<?= Yii::$app->general->file_path($model->image) ?>" alt="pic1" class="pull-left img-responsive">
              <div class="text">
                <p class="small-paragraph"><?= $model->tag_line ?></p>
                <h3><a href="#"><?= $model->name ?></a></h3>
                <p><?= $model->description ?></p>
                <!-- <p><a href="#" class="btn btn-primary btn-md">Learn more</a></p> -->
              </div>
              <div class="clearfix"></div>
            </article>
           <?php endforeach; ?>
          


        </div>
        <div class="col-md-3">
          <?php foreach ($services as $key => $service) : ?>
            <div class="icon-item">
            <h4>
              <?= Html::a($service->serviceName, ['our-product/index', 'service_id' => $service->service_id]); ?>
            </h4>
          </div>
          <?php endforeach; ?>
          
         
        </div>
      </div>
    </div>
  </section>
</section>
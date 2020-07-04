<?php
use yii\helpers\Html;
$this->title = 'Equipments'; 
?>

<section class="main__middle__container">
  <div class="row blue__line">
    <div class="container text-center">
      <h1><?= $this->title ?></h1><br>
      <h4><?= $categoryName ?></h4>
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
          <?php foreach ($categories as $key => $category) : ?>
            <div class="icon-item">
            <h4>
              <?= Html::a($category->categoryName, ['our-equipment/index', 'equipment_category_id' => $category->equipment_category_id]); ?>
            </h4>
          </div>
          <?php endforeach; ?>
          
         
        </div>
      </div>
    </div>
  </section>
</section>
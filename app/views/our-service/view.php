<?php
use yii\helpers\Html;
$this->title = $model->name;
?>

<section class="main__middle__container">
  <div class="container">
    <div class="row nothing">
      <section class="col-md-8 main-content">
        <h2 style="text-transform: capitalize;"><?= $model->name ?></h2>
        <p><strong><?= $model->tag_line ?></strong></p>
        <br /> 
        <br />
        <img style="    width: 100%;" src="<?= Yii::$app->general->file_path($model->image) ?>" alt="image" class="img-responsive "> <br />
        <!-- <h3>Aliquam dictum felis a purus cursus</h3> -->
        <hr>
        <p><?= $model->description ?></p>
      
      </section>
      <aside class="col-md-4">
        <h3><span>Related Services</span></h3>
        <ul>
        <?php foreach ($other_services as $key => $service) : ?>
          <li><?= Html::a(ucwords($service->name), ['our-service/view', 'id' => $service->id]) ?></li>
        <?php endforeach; ?>
        </ul>
      </aside>
    </div>
  </div>
</section>

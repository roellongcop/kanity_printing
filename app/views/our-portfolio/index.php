<?php
use yii\helpers\Html;
$this->title = 'Our Portfolio';
?>


<section class="main__middle__container">
  <div class="row blue__line">
    <div class="container text-center">
      <h1>Our Portfolio</h1>
      <!-- <p class="big-paragraph">Big paragraph text under page title.</p> -->
    </div>
  </div>
  <div class="container">
    <div id="portfolio" class="row no_padding title__block nothing no-margin">
      <ul class="list-unstyled controls">
        <li class="filter" data-filter="all">Show All</li>
        <?php foreach ($categories as $category) : ?>
        <li class="filter" data-filter="<?= $category->portfolio_category_id ?>"><?= $category->categoryName ?></li>
        <?php endforeach; ?>
      </ul>
        <ul id="Grid" class="gallery">

        <?php foreach ($models as $model) : ?>
          <?= $this->render('_portfolio', ['model' => $model]) ?>
        <?php endforeach; ?>
      </ul>
    </div>
  </div>
</section>
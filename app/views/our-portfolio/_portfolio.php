 <li class="mix <?= $model->portfolio_category_id ?> col-sm-4"> 
          <a href="<?= Yii::$app->general->file_path($model->image) ?>">
            <img alt="" src="<?= Yii::$app->general->file_path($model->image) ?>" class="img-responsive" style="height: 236px;"> 
            <span class="text">
              <?= $model->name ?>
              <span><?= $model->description ?></span>
            </span>
          </a> 
        </li>
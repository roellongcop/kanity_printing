<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\PortfolioCategorySearch;

/* @var $this yii\web\View */
/* @var $model app\models\Portfolio */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="portfolio-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
    	<div class="row">
			<div class="col-md-5">
				<?= $form->field($model, 'portfolio_category_id')->dropDownList(
                    PortfolioCategorySearch::dropdown(), [
                        'prompt' => 'Select Category'
                    ]
                ) ?>
              <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

			</div>
            <div class="col-md-7">
                <?= $form->field($model, 'image_input')->fileInput(['class' => 'image-input']) ?>
                <?= $this->render('/layouts/_image', ['model' => $model]) ?>
            </div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

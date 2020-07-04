<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\ModeOfPaymentSearch;
use app\models\search\SpecificationSearch;

/* @var $this yii\web\View */
/* @var $model app\models\Quotation */
/* @var $form yii\widgets\ActiveForm */
$src = <<< SCRIPT
    
    $('.remove-image').on('click', function() {
        var id = $(this).data('quotation-id');
        var path = $(this).data('path');
        var key = $(this).data('key');

        $.ajax({
            url: base_url + 'quotation/remove-image',
            data: {
                id: id,
                path: path,
                key: key
            },
            method: 'post',
            success: function(res) {
                if(res) {
                    $('div[data-container="'+key+'"]').remove();
                }
            }
        });
    });
SCRIPT;

$this->registerJs($src);
?>

<div class="quotation-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
        <div class="row">
            <div class="col-md-12">
                <?= $this->render('/user/_input', [
                    'form' => $form, 'model' => $model
                ]) ?>
            </div>
            <div class="col-md-5">
                
                <?= $form->field($model, 'quantity')->textInput([
                    'type' => 'number'
                ]) ?>
                
                <?= $form->field($model, 'mode_of_payment_id')->radioList(
                    ModeOfPaymentSearch::dropdown()
                ) ?>
            </div>
            <div class="col-md-7">
                <?= $form->field($model, 'specs')->textInput([
                    'maxlength' => true,
                    'list' => 'specs-list'
                ]) ?>

                <datalist id="specs-list">
                    <?php if(($specs = SpecificationSearch::dropdown()) != null): ?>
                        <?php foreach ($specs as $key => $spec) : ?>
                            <option value="<?= $spec ?>">
                        <?php endforeach; ?>
                    <?php endif; ?>
                    
                </datalist>
                <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

                <label>
                    <input type="checkbox" required="" value="1" id="agree-checkbox">
                    I Agree to <?= Html::a('Terms and Condition', '#toc-modal', [
                        'data-toggle' => 'modal'
                    ]) ?>
                </label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12"><hr>
                <?= $form->field($model, 'imageFiles[]')->fileInput([
                    'multiple' => true,
                    'accept' => 'image/*'
                ]) ?>

                <?php if(($images = $model->images) != null): ?>
                    <div class="row">
                        <?php foreach ($images as $key => $image) : ?>
                            <div class="col-md-2 text-center" data-container="<?= $key ?>">
                                <img  data-toggle="modal" data-target="#modal-<?=$key ?>"  src="<?= Yii::$app->general->file_path($image) ?>" class="img-thumbnail image-ref"><br>

                                <a href="#!" data-key="<?= $key ?>" data-path="<?= $image ?>" data-quotation-id="<?= $model->id ?>"  class="remove-image">remove</a>
                            </div>
                            <div id="modal-<?=$key ?>" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-md">
                                    <div class="modal-content">
                                        <div class="modal-body text-center">
                                            <img src="<?= Yii::$app->general->file_path($image) ?>" class="img-thumbnail" >
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                            <a target="_blank" class="btn btn-success"  href="<?= Yii::$app->general->file_path($image) ?>">Fullpage View</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>


    <div class="form-group"><hr>
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?= $this->render('/setting/_toc_modal') ?>
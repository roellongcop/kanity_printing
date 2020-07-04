<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\JobOrderSearch;

/* @var $this yii\web\View */
/* @var $model app\models\DailyOutput */
/* @var $form yii\widgets\ActiveForm */
$src = <<< SCRIPT
    $('#dailyoutput-job_order_id').on('change', function() {
        var id = $(this).val()
        $.ajax({
            url: base_url + 'daily-output/get-job-order',
            data: {id: id},
            dataType: 'html',
            success: function(res) {
                $('.jo-details').html(res)
            }
        })    
    })
SCRIPT;
$this->registerJs($src);
?>

<div class="daily-output-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				<?php if($model->isNewRecord): ?>
                    <?= $form->field($model, 'job_order_id')->dropDownList(
                        JobOrderSearch::dropdown(['process_status' => [1, 2]]), [
                            'prompt' => 'Select Job Order No'
                        ]
                    ) ?>
                <?php endif; ?>


                <?= $form->field($model, 'quantity')->textInput() ?>
                <div class="form-group">
                    <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                </div>
			</div>
            <div class="col-md-7">
                <div class="jo-details">
                    
                </div>
            </div>
    	</div>

    

    <?php ActiveForm::end(); ?>

</div>

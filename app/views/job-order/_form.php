<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\PurchaseOrderSearch;

/* @var $this yii\web\View */
/* @var $model app\models\JobOrder */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="job-order-form">

    <?php $form = ActiveForm::begin(); ?>
    	<div class="row">
			<div class="col-md-5">
				<?php if($model->isNewRecord): ?>
                    <?= $form->field($model, 'purchase_order_id')->dropDownList(
                        PurchaseOrderSearch::dropdown(['process_status' => 0])
                    ) ?>
                <?php endif; ?>

                <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>
			</div>
    	</div>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

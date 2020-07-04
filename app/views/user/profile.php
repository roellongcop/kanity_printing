<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Profile */

$this->title = 'Create Profile';
$this->params['breadcrumbs'][] = ['label' => $model->user->username, 'url' => ['user/view', 'id' => $model->user_id]];
$this->params['breadcrumbs'][] = 'Create Profile';
?>

<div class="card mt10px">
    <div class="card-body">
        <div class="profile-update">



            <?php $form = ActiveForm::begin(); ?>
            	<div class="row">
            		<div class="col-md-4">
            			<?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>
            		</div>
            		<div class="col-md-4">
            			<?= $form->field($model, 'middle_name')->textInput(['maxlength' => true]) ?>
            		</div>
            		<div class="col-md-4">
            			<?= $form->field($model, 'first_name')->textInput(['maxlength' => true]) ?>
            		</div>
            	</div>

            	<div class="row">
            		<div class="col-md-4">
            			<?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
            		</div>
            		<div class="col-md-4">
            			<?= $form->field($model, 'contact_number')->textInput(['maxlength' => true]) ?>
            		</div>
            		<div class="col-md-4">
            			<?= $form->field($model, 'tin')->textInput(['maxlength' => true]) ?>
            		</div>
            	</div>

            	<div class="row">
            		<div class="col-md-8">
        	    		<?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>
            		</div>
            		<div class="col-md-4">
        	    		<?= $form->field($model, 'position')->textInput(['maxlength' => true]) ?>
            		</div>
            	</div>


            	<div class="row">
            		<div class="col-md-6">
        	    		<?= $form->field($model, 'company_address')->textarea(['rows' => 6]) ?>
            		</div>
                    <div class="col-md-6">
                        <?= $form->field($model, 'image_input')->fileInput(['class' => 'image-input']) ?> 
                        <?= $this->render('/layouts/_image', ['model' => $model]) ?>
                    </div>
            	</div>






            <div class="form-group">
                <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
            </div>

            <?php ActiveForm::end(); ?>


        </div>
    </div>
</div>

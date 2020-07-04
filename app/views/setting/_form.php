<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\RoleSearch;
/* @var $this yii\web\View */
/* @var $model app\models\Setting */
/* @var $form yii\widgets\ActiveForm */
$dates = \DateTimeZone::listIdentifiers(\DateTimeZone::ALL);
$dates = array_combine($dates, $dates);

$src = <<< SCRIPT

    $('.all-notification-checkbox').on('change', function() {
        var is_checked = $(this).is(':checked');
        if(is_checked) {
            $('.notification').prop('checked', true);
        }
        else {
            $('.notification').prop('checked', false);
        }
    });

    $('.delete-menu').on('click', function() {
        $(this).closest('li').remove();
    });
SCRIPT;
$this->registerJs($src);
?>

<div class="setting-form">

    <?php $form = ActiveForm::begin(); ?>
        <p class="lead">General</p>
    	<div class="row">
			<div class="col-md-4">
				<?= $form->field($model, 'default_role')->dropDownList(
                    RoleSearch::myAccess()
                ) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'pagination')->dropDownList(
                    Yii::$app->params['pagination']
                ) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'timezone')->dropDownList($dates) ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'terms_and_condition')->textarea([
                    'class' => 'form-control summernote'
                ]) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'privacy_policy')->textarea([
                    'class' => 'form-control summernote'
                ]) ?>
            </div>
        </div>
        <hr>
        <p class="lead">Quotation</p>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'quotation_no_padding')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'quotation_no_prefix')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'maximum_request_amount_restriction')->textInput([
                    'type' => 'number',
                    'step' => '.01'
                ]) ?>
            </div>
        </div>

        <hr>
        
        <p class="lead">Job Order</p>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'jo_no_padding')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'jo_no_prefix')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>


        <hr>
        
        <p class="lead">Sales Invoice</p>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'si_no_padding')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'si_no_prefix')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>


        <hr>
        
        <p class="lead">Acknowlegement Receipt</p>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'ar_no_padding')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'ar_no_prefix')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>


        <hr>
        
        <p class="lead">Official Receipt</p>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'or_no_padding')->textInput([
                    'type' => 'number'
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'or_no_prefix')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>

        <hr>
        <p class="lead">Company Information</p>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'company_name')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
            <div class="col-md-8">
                <?= $form->field($model, 'company_tag_line')->textInput([
                    'maxlength' => true
                ]) ?>
            </div> 
            
        </div>

        <div class="row">
            
            <div class="col-md-4">
                <?= $form->field($model, 'form_of_business')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'line_of_business')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'tin')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>

        <div class="row">
            
            <div class="col-md-4">
                <?= $form->field($model, 'reg_no')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>

            <div class="col-md-4">
                <?= $form->field($model, 'company_phone_no')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>

            <div class="col-md-4">
                <?= $form->field($model, 'company_fax_no')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>

        
        <div class="row">
            <div class="col-md-8">
                <?= $form->field($model, 'company_address')->textInput([
                    'maxlength' => true
                ]) ?>
                <?= $form->field($model, 'company_description')->textarea([
                    'rows' => 6
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'image_input')->fileInput(['class' => 'image-input'])->label('Company Logo') ?>
                <?= $this->render('/layouts/_image', ['model' => $model, 'image_attr' => 'company_logo']) ?>
            </div>
        </div>

        <hr>
        <p class="lead">Social</p>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'twitter')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'facebook')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'google')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'email')->textInput([
                    'maxlength' => true
                ]) ?>
            </div>
        </div>

        <hr>
        <p class="lead">
            <label>
                <input type="checkbox" class="all-notification-checkbox">
                Notifications
            </label>
        </p>
        <small>User that can notified</small>
        <div class="row">
            <div class="col-md-12">
                <table class="table">
                    <?php foreach (Yii::$app->params['notification_pages'] as $key => $np) : ?>
                       <tr>
                            <th><?= $np['title'] ?></th>
                            <?php if(($roles = RoleSearch::myAccess()) != null): ?>
                                <?php foreach ($roles as $role_id => $role) : ?>
                                    <?php if($role_id != $model->default_role): ?>
                                        <td>
                                            <label>

                                                <input type="hidden" name="Setting[notification_pages][<?= $np['controller'] ?>][title]" value="<?= $np['title'] ?>">


                                                <input class="notification" type="checkbox" name="Setting[notification_pages][<?= $np['controller'] ?>][roles][]" value="<?= $role_id ?>" <?=  isset($model->notification_pages[$np['controller']])? in_array($role_id, $model->notification_pages[$np['controller']]['roles'])? 'checked': '': '' ?>>
                                                <?= $role ?> &nbsp;&nbsp;&nbsp;
                                            </label>
                                        </td>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            <?php endif; ?>
                       </tr>
                    <?php endforeach; ?>
                </table>
            </div>
        </div>


        <?php if(Yii::$app->user->identity->super_admin): ?>

            <hr>
            <p class="lead">Navigation Menu</p>

            <?php if(($menus = $model->menu) != null) : ?>
                <ul class="menus sortable">
                    <?php foreach ($menus as $main_controller => $menu) : ?>

                        <?php $main_key = Yii::$app->security->generateRandomString(7); ?>
                        <li  class="ui-state-default">
                            <input type="text" name="Setting[menu][<?= $main_key ?>][controller]" value="<?= $main_controller ?>" placeholder="Controller" list="controllers">
                            <input type="text" name="Setting[menu][<?= $main_key ?>][title]" value="<?= $menu['title'] ?>"  placeholder="Title">
                            <input type="text" name="Setting[menu][<?= $main_key ?>][icon]" value="<?= $menu['icon'] ?>"  placeholder="Icon">
                            <i class="fa fa-trash delete-menu  btn btn-sm btn-danger"></i>
                            
                            <?php if(isset($menu['sub']) && $menu['sub']): ?>
                                <ul style="margin-left: 30px;" class="sortable">
                                 
                                    <?php foreach ($menu['sub'] as $sub_controller => $sub) : ?>
                                        <?php $sub_key = Yii::$app->security->generateRandomString(7); ?>
                                        <li>
                                            <input type="text" 
                                                name="Setting[menu][<?= $main_key ?>][sub][<?= $sub_key ?>][controller]" 
                                                value="<?= $sub_controller ?>"  placeholder="Controller" list="controllers">

                                            <input 
                                                type="text" 
                                                name="Setting[menu][<?= $main_key ?>][sub][<?= $sub_key ?>][title]" 
                                                value="<?= $sub['title'] ?>"  placeholder="Title">
                                            <input 
                                                type="text" 
                                                name="Setting[menu][<?= $main_key ?>][sub][<?= $sub_key ?>][icon]" 
                                                value="<?= $sub['icon'] ?>"  placeholder="Icon">

                                            <i class="fa fa-trash delete-menu btn btn-sm btn-danger"></i>

                                        </li>
                                    <?php endforeach; ?> 
                                    <li>
                                        <input type="text" name="Setting[menu][<?= $main_key ?>][sub][additional][controller]"  placeholder="Controller" list="controllers">
                                        <input type="text" name="Setting[menu][<?= $main_key ?>][sub][additional][title]"  placeholder="Title">
                                        <input type="text" name="Setting[menu][<?= $main_key ?>][sub][additional][icon]"  placeholder="Icon">
                                    </li>
                                </ul>
                            <?php endif; ?>
                        </li>
                    <?php endforeach; ?>
                    <li  class="ui-state-default">
                        <input type="text" name="Setting[menu][additional][controller]"  placeholder="Controller" list="controllers">
                        <input type="text" name="Setting[menu][additional][title]"  placeholder="Title">
                        <input type="text" name="Setting[menu][additional][icon]"  placeholder="Icon">
                    </li>
                    <li  class="ui-state-default">
                        <input type="text" name="Setting[menu][additional2][controller]"  placeholder="Controller" list="controllers">
                        <input type="text" name="Setting[menu][additional2][title]"  placeholder="Title">
                        <input type="text" name="Setting[menu][additional2][icon]"  placeholder="Icon">
                        <ul style="margin-left: 30px;" class="sortable">
                         
                            <li>
                                <input type="text" name="Setting[menu][additional2][sub][additional2][controller]"  placeholder="Controller" list="controllers">
                                <input type="text" name="Setting[menu][additional2][sub][additional2][title]"  placeholder="Title">
                                <input type="text" name="Setting[menu][additional2][sub][additional2][icon]"  placeholder="Icon">
                            </li>
                        </ul>
                    </li>
                </table>
               
            <?php endif; ?>
        <?php endif; ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<datalist id="controllers">
    <?php if(($controller_actions = Yii::$app->permission->controllerActions()) != null): ?>
        <?php foreach ($controller_actions as $controller => $actions) : ?>
            <option value="<?= $controller ?>">
        <?php endforeach; ?>
    <?php endif; ?>
</datalist>
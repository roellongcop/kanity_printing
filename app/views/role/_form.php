<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\search\RoleSearch;
$controller_actions = Yii::$app->permission->controllerActions();

/* @var $this yii\web\View */
/* @var $model app\models\Role */
/* @var $form yii\widgets\ActiveForm */

$src = <<< SCRIPT


    $('#check_all_role').on('change', function() {
        var is_checked = $(this).is(':checked');
        if(is_checked) {
            $('.role_access').prop('checked', true);
        }
        else {
            $('.role_access').prop('checked', false);
        }
    });

    $('#check_all').on('change', function() {
        var is_checked = $(this).is(':checked');
        if(is_checked) {
            $('.module_access').prop('checked', true);
        }
        else {
            $('.module_access').prop('checked', false);
        }
    });

    $('.controller-checkbox').on('change', function() {
        var is_checked = $(this).is(':checked');
        var controller = $(this).data('controller');
        if(is_checked) {
            $('.' + controller).prop('checked', true);
        }
        else {
            $('.' + controller).prop('checked', false);
        }
    });
SCRIPT;
$this->registerJs($src);
?>

<div class="role-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <p class="lead">Role Access</p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <td colspan="2">
                    <label>
                        <input type="checkbox" name="" id="check_all_role">
                        Check All
                    </label>
                </td>
            </tr>
            <?php foreach (RoleSearch::dropdown() as $id => $name) : ?>
                <tr>
                    <td>
                         <label>
                            <input class="role_access" type="checkbox" name="Role[role_access][]" value="<?= $id ?>" <?= isset($model->role_access) && in_array($id, $model->role_access) ? 'checked': '' ?>>
                            <?= ucwords($name) ?>
                        </label>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <hr>

    <p class="lead">Module Access</p>

    <table class="table table-bordered">
        <tbody>
            <tr>
                <td colspan="2">
                    <label>
                        <input type="checkbox" name="" id="check_all">
                        Check All
                    </label>
                </td>
            </tr>
            <tr>
                <th>PAGE</th>
                <th>ACTIONS</th>
            </tr>
            <?php foreach ($controller_actions as $controller => $actions) : ?>
                <tr>
                    <td width="30%">
                        <label>
                            <input type="checkbox" data-controller="<?= $controller ?>" class="controller-checkbox module_access">
                            <?= ucwords(str_replace('-', ' ', $controller)) ?>
                        </label>
                    </td>
                    <td>
                        <?php foreach ($actions as $action) : ?>
                            <label>
                                <input class="<?= $controller ?> module_access" type="checkbox" name="Role[module_access][<?= $controller ?>][]" value="<?= $action ?>" <?= isset($model->module_access[$controller]) && in_array($action, $model->module_access[$controller]) ? 'checked': '' ?>>
                                <?= ($action == 'index') ? 'list': strtolower($action) ?>
                            </label> &nbsp; &nbsp;
                        <?php endforeach; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

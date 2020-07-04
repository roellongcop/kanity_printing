<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\search\RoleSearch;
$roles = RoleSearch::dropdown();

/* @var $this yii\web\View */
/* @var $model app\models\Setting */

$this->title = $model->company_name;
$this->params['breadcrumbs'][] = ['label' => 'Settings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;
$general_attr = [
  'roleName',
  'pagination',
  'timezone',
];


$terms_attr = [
  'terms_and_condition:raw',
  'privacy_policy:raw',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($general_attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($general_attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($general_attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}

$quotation_attr = [
  'quotation_no_padding',
  'quotation_no_prefix',
  'maximum_request_amount_restriction',
];

$or_attr = [
  'or_no_padding',
  'or_no_prefix',
];


$job_attr = [
  'jo_no_padding',
  'jo_no_prefix',
];


$si_attr = [
  'si_no_padding',
  'si_no_prefix',
];


$ar_attr = [
  'ar_no_padding',
  'ar_no_prefix',
];


$company_attr = [
'logo:raw',
  'company_name',
  'company_address',
  'company_tag_line',
  'company_description',
  'form_of_business',
  'line_of_business',
  'tin',
  'reg_no',
  'company_phone_no',
  'company_fax_no',
];

$social_attr = [
    'twitter',
    'facebook',
    'google',
    'email',
];

?>

<div class="card mt10px">
    <div class="card-body">
        <div class="setting-view">

            <p>
                <?= $permission->button(['create', 'update', 'delete'], $model) ?>
            </p>
            <hr>

            <div class="row">
                <div class="col-md-6">
                    <p class="lead">General</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $general_attr,
                    ]) ?>
                    <hr>
                    <p class="lead">Social</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $social_attr,
                    ]) ?>
                </div>
                <div class="col-md-6">
                    <p class="lead">Company Details</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $company_attr,
                    ]) ?>
                </div> 
            </div>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <p class="lead">Quotation</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $quotation_attr,
                    ]) ?>
                </div>
                <div class="col-md-6">
                    <p class="lead">Job Order</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $job_attr,
                    ]) ?>
                </div> 
            </div>

            <hr>
            <div class="row">
                <div class="col-md-6">
                    <p class="lead">Sales Invoice</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $si_attr,
                    ]) ?>
                </div>
                <div class="col-md-6">
                    <p class="lead">Acknowlegement Receipt</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $ar_attr,
                    ]) ?>
                </div>
            </div>

            <hr>
            <div class="row">
                <div class="col-md-6">
                    <p class="lead">Official Receipt</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $or_attr,
                    ]) ?>
                </div>
            </div>

            <hr>
            <p class="lead">
                    Notifications
            </p>
            <small>User that can notified</small>
            <div class="row">
                <div class="col-md-12">
                    <table class="table">
                        <?php foreach ($model->notification_pages as $controller => $np) : ?>
                           <tr>
                                <th><?= $np['title'] ?></th>
                                <?php if(isset($np['roles']) && $np['roles']): ?>
                                    <td> 
                                        <?php foreach ($np['roles'] as $n) : ?>
                                            <?= $roles[$n] ?> | 
                                        <?php endforeach; ?>
                                    </td>
                                <?php endif; ?>
                           </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            </div>


            <hr>
            <div class="row">
                <div class="col-md-12">
                    <p class="lead">Terms and Privacy</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $terms_attr,
                    ]) ?>
                </div>
            </div>

        </div>
    </div>
</div>

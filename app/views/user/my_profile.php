<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Profile */

$this->title = $model->fullname;
$this->params['breadcrumbs'][] = ['label' => $model->user->username, 'url' => ['user/view', 'id' => $model->user_id]];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;
$attr = [
    'profile_picture:raw',
    'first_name',
    'middle_name',
    'last_name',
    'position',
    'company_name',
    'company_address:ntext',
    'tin',
    'email:email',
    'contact_number',
    'createdAt',
    'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}
?>
<div class="card mt10px">
    <div class="card-body">
        <div class="profile-view">

            <p>
                <?= $permission->link([
                    'title' => 'My Account',
                    'link' => ['user/my-account'],
                    'options' => [
                        'class' => 'btn btn-success'
                    ]
                ]) ?>
                <?= $permission->link([
                    'title' => 'Update Profile',
                    'link' => ['user/build-profile'],
                    'options' => [
                        'class' => 'btn btn-primary'
                    ]
                ]) ?>
            </p>

            <?= DetailView::widget([
                'model' => $model,
                'attributes' => $attr,
            ]) ?>

        </div>
    </div>
</div>

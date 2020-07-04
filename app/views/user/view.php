<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\User */

$this->title = $model->roleName;
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;

$profile_link = $model->profile ? ['user/view-profile', 'id' => $model->profile->id]: ['user/create-profile', 'id' => $model->id];

$attr = [
    'profile_picture:raw',
    'roleName',
    'username',
    'password',
    'authkey',
    'access_token',
    'statusTitle',
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
        <div class="user-view">

            <p>
                <?= $permission->link([
                    'title' => 'Profile',
                    'link' => $profile_link,
                    'options' => [
                        'class' => 'btn btn-info'
                    ]
                ]) ?>
                <?= $permission->button(['create', 'update', 'delete'], $model) ?>
            </p>

            <?= DetailView::widget([
                'model' => $model,
                'attributes' => $attr,
            ]) ?>

        </div>
    </div>
</div>

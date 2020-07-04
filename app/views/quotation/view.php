<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;
use app\models\search\TypeOfServiceSearch;

/* @var $this yii\web\View */
/* @var $model app\models\Quotation */

$this->title = ($model->user)? $model->user->username: '';
$this->params['breadcrumbs'][] = ['label' => 'Quotations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;

$attr = [
    'quotation_no',
    'specs',
    'quantity',
    [
        'label' => 'Mode of Payment',
        'value' => $model->mop
    ],
    [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $model->currentStatusClass
    ],
    'price_per_piece',
    'typeOfServiceName',
    'description:ntext',

    'createdAt',
    'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($attr, ['label' => 'Process By', 'value' => $model->processByUsername ]);
    array_push($attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}
array_push($attr, 'note');
array_push($attr, 'reason');
?>

<div class="card mt10px">
    <div class="card-body">
        <div class="quotation-view">

            <p>
                <?= $permission->button(['create'], $model) ?>

                <?php if(in_array($model->process_status, [0])): ?>
                    <?= $permission->link([
                        'title' => 'Update',
                        'link' => ['quotation/update', 'id' => $model->id],
                        'options' => [
                            'class' => 'btn btn-primary',
                        ]
                    ]) ?>

                    <?= $permission->link([
                        'title' => 'Cancel',
                        'link' => ['quotation/cancel', 'id' => $model->id],
                        'options' => [
                            'class' => 'btn btn-danger',
                            'data-confirm' => 'This Quotation is going to set to Cancel'
                        ]
                    ]) ?>
                <?php endif; ?>

                <?php if($model->purchaseOrder): ?>
                    <span class="pull-right">
                        <?= $permission->link([
                            'title' => 'View Purchase Order',
                            'link' => ['purchase-order/view', 'id' => $model->purchaseOrder->id],
                            'options' => ['class' => 'btn btn-info', ]
                        ]) ?>
                    <?php if($model->jobOrder): ?>
                            <?= $permission->link([
                                'title' => 'View Job Order',
                                'link' => ['job-order/view', 'id' => $model->jobOrder->id],
                                'options' => ['class' => 'btn btn-info', ]
                            ]) ?>
                    <?php endif; ?>
                        </span>
                <?php endif; ?>




                <?php if($model->canSendPo && $permission->user_can('send-po')): ?>
                    <span class="pull-right">
                        <?= Html::a('Send PO', '#', [
                            'class' => 'btn btn-success',
                            'data-toggle' => 'modal',
                            'data-target' => '#send-po-modal'
                        ]) ?>
                    </span>
                <?php endif; ?>
            </p>
            <hr>
            <div class="row">
                <div class="col-md-6"> 
                    <p class="lead">Quotation Details</p>
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => $attr,
                    ]) ?>

                    
                </div>
                <div class="col-md-6">
                    <p class="lead">User Details
                        <?= Html::a('<i class="fa fa-eye"></i>', [
                            'user/view', 'id' => $model->user_id
                        ]) ?>
                    </p>
                    <?= DetailView::widget([
                    'model' => $model->user,
                        'attributes' => [
                            'profile_picture:raw',
                            'roleName',
                            'username',
                            'profile.fullname',
                            'profile.email',
                            'profile.contact_number',
                            'profile.company_name',
                            'profile.company_address',
                            'profile.position',
                            'profile.tin',
                        ],
                    ]) ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <hr>
                    <p class="lead">Image Referrence</p>
                    <?= $this->render('/quotation/_images', [
                        'images' => $model->images,
                        'col' => 2
                    ]) ?>
                </div>
            </div>


            <div class="row">
                <div class="col-md-12">
                    <hr>

                    <?php if(in_array($model->process_status, [0])): ?>
                        <?php if($permission->user_can('set-quotation')): ?>

                            <?= Html::a('Set Quotation', '#', [
                                'class' => 'btn btn-success',
                                'data-toggle' => 'modal',
                                'data-target' => '#set-quotation-modal'
                            ]) ?>
                        <?php endif; ?>


                        <?php if($permission->user_can('no-bid')): ?>
                            <?= Html::a('No Bid', '#', [
                                'class' => 'btn btn-default',
                                'data-toggle' => 'modal',
                                'data-target' => '#no-bid-modal'
                            ]) ?>
                        <?php endif; ?>

                    <?php endif; ?>
                </div>
            </div>

        </div>
    </div>
</div>


<?php if($permission->user_can('set-quotation')): ?>
    <!-- Modal -->
    <div id="set-quotation-modal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-md">

            <?php $form = ActiveForm::begin(['action' => ['set-quotation', 'id' => $model->id]]); ?>
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Set Quotation</h4>
                    </div>
                    <div class="modal-body">
                        <?= $form->field($model, 'price_per_piece')->textInput([
                            'type' => 'number',
                            'step' => '.01'
                        ]) ?>

                        <?= $form->field($model, 'type_of_service_id')->dropDownList(
                            TypeOfServiceSearch::dropdown()
                        ) ?>

                        <?= $form->field($model, 'note')->textarea([
                            'rows' => 6
                        ]) ?>
                    </div>
                    <div class="modal-footer">
                        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            <?php ActiveForm::end(); ?>

        </div>
    </div>
<?php endif; ?>


<?php if($permission->user_can('send-po')): ?>

<!-- Modal -->
<div id="send-po-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">

        <?php $form = ActiveForm::begin(['action' => ['send-po', 'id' => $model->id]]); ?>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Send PO</h4>
                </div>
                <div class="modal-body">
                    <?= $form->field($po, 'po_no')->textInput([
                        'maxlength' => true
                    ]) ?>

                    <?= $form->field($po, 'customer_note')->textarea([
                        'rows' => 6
                    ]) ?>

                    <strong>Disclaimer:</strong> P.O. Number should be provided by the customer.

                    <br> <br>
                    <label>
                        <input type="checkbox" required="" value="1" id="agree-checkbox">
                        I Agree to <?= Html::a('Terms and Condition', '#toc-modal', [
                            'data-toggle' => 'modal'
                        ]) ?>
                    </label>

                </div>
                <div class="modal-footer">
                    <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        <?php ActiveForm::end(); ?>

    </div>
</div>

<?php endif; ?>




<?php if($permission->user_can('no-bid')): ?>

<!-- Modal -->
<div id="no-bid-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">

        <?php $form = ActiveForm::begin(['action' => ['no-bid', 'id' => $model->id]]); ?>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">No Bid</h4>
                </div>
                <div class="modal-body">
                    <?= $form->field($model, 'reason')->textarea([
                        'rows' => 6
                    ]) ?>
                </div>
                <div class="modal-footer">
                    <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        <?php ActiveForm::end(); ?>

    </div>
</div>

<?php endif; ?>
<?= $this->render('/setting/_toc_modal') ?>

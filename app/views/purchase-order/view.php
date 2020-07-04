<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\PurchaseOrder */

$this->title = $model->po_no;
$this->params['breadcrumbs'][] = ['label' => 'Purchase Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;
$quotation = $model->quotation;
$user = $quotation->user;

$attr = [
  'po_no',
  'quantity',
  'served_quantity',
  'pending_quantity',
  'arStatus',
   [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $model->currentStatusClass
    ],
  'customer_note:ntext',
  'createdAt',
  'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}



$quotation_attr = [
    'quotation_no',
    'specs',
    'quantity',
    [
        'label' => 'Mode of Payment',
        'value' => $quotation->mop
    ],
    [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $quotation->currentStatusClass
    ],
    'price_per_piece',
    'typeOfServiceName',
    'description:ntext',

    'createdAt',
    'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($quotation_attr, ['label' => 'Process By', 'value' => $quotation->processByUsername ]);
    array_push($quotation_attr, ['label' => 'Status','value' => $quotation->statusTitle]);
    array_push($quotation_attr, ['label' => 'Created By','value' => $quotation->createdByName]);
    array_push($quotation_attr, ['label' => 'Updated By','value' => $quotation->updatedByName]);
}
array_push($quotation_attr, 'note');

?>

<div class="card mt10px">
    <div class="card-body">
        <div class="purchase-order-view">

            <p>
                <?= $permission->button(['create'], $model) ?>
                <?php if($model->canUpdate): ?>
                    <?= $permission->link([
                        'title' => 'Update',
                        'link' => ['purchase-order/update', 'id' => $model->id],
                        'options' => [
                            'class' => 'btn btn-primary',
                        ]
                    ]) ?>
                <?php endif; ?>

                <?php if($model->jobOrder): ?>
                    <span class="pull-right">
                        <?= $permission->link([
                            'title' => 'View Job Order',
                            'link' => ['job-order/view', 'id' => $model->jobOrder->id],
                            'options' => ['class' => 'btn btn-info', ]
                        ]) ?>
                    </span>
                <?php endif; ?>

                <?php if($model->canCreateJobOrder): ?>
                    <span class="pull-right">
                        <?php if($permission->user_can('create-job-order')): ?>
                            <?= Html::a('Create Job Order', '#', [
                                'class' => 'btn btn-success',
                                'data-toggle' => 'modal',
                                'data-target' => '#create-job-order-modal'
                            ]) ?>
                        <?php endif; ?> 
                    </span>
                <?php endif; ?>
            </p>


            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link show active" data-toggle="tab" href="#general-data" role="tab" aria-controls="home" aria-selected="true">
                    <i class="icons cui-note"></i> General Details
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link show" data-toggle="tab" href="#acknowledge-receipt" role="tab" aria-controls="profile" aria-selected="false">
                        <i class="icon-basket-loaded"></i> Acknowledge Receipt
                            <span class="badge badge-pill badge-danger">
                               <?= number_format(count($model->acknowledgmentReceipt)) ?>
                            </span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane show active" id="general-data" role="tabpanel">
                    <div class="row">
                        <div class="col-md-6">
                            <p class="lead">Purchased Order Details</p>
                            <?= DetailView::widget([
                                'model' => $model,
                                'attributes' => $attr,
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <p class="lead">User Details 
                                <?= Html::a('<i class="fa fa-eye"></i>', [
                                    'user/view', 'id' => $user->id
                                ]) ?>
                            </p>
                            <?= DetailView::widget([
                            'model' => $user,
                                'attributes' => [
                                    'profile_picture:raw',
                                    'username',
                                    'profile.fullname',
                                    'profile.email',
                                    'profile.contact_number',
                                    'profile.company_name',
                                    'profile.company_address',
                                    'profile.tin',
                                ],
                            ]) ?>
                        </div>
                    </div>

                    <hr>

                    <div class="row"> 
                        <div class="col-md-6">
                            <p class="lead">
                                Quotation Details 
                                <?= Html::a('<i class="fa fa-eye"></i>', [
                                    'quotation/view', 'id' => $quotation->id
                                ]) ?>
                            </p>
                            <?= DetailView::widget([
                                'model' => $quotation,
                                'attributes' => $quotation_attr,
                            ]) ?>
                        </div>
                        <div class="col-md-6">
                            <p class="lead">Image Referrence</p>
                            <?= $this->render('/quotation/_images', ['images' => $quotation->images]) ?>
                        </div>
                    </div>
                </div>
                <div class="tab-pane show " id="acknowledge-receipt" role="tabpanel">

                    <p class="pull-right">
                        <?php if($model->canAcknowledgeReceipt): ?> 
                            <?php if($permission->user_can('acknowledge-receipt')): ?>
                                <?= Html::a('Acknowledge Receipt', '#', [
                                    'class' => 'btn btn-success',
                                    'data-toggle' => 'modal',
                                    'data-target' => '#acknowledge-receipt-modal'
                                ]) ?>
                            <?php endif; ?>
                        <?php endif; ?> 
                    </p>

                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],
                              'quantity',
                              'delivery_date',
                              'particular:ntext',
                              [
                                'attribute' => 'delivery_status',
                                'value' => 'deliveryStatus',

                              ],
                            Yii::$app->permission->actionColumn([
                                'controller' => 'acknowledgment-receipt'
                            ]),
                        ],
                    ]); ?>
                    
                </div>
            </div>

            
            

        </div>
    </div>
</div>


<?php if($permission->user_can('create-job-order')): ?>

<!-- Modal -->
<div id="create-job-order-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">

        <?php $form = ActiveForm::begin(['action' => ['create-job-order', 'id' => $model->id]]); ?>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Create Job Order</h4>
                </div>
                <div class="modal-body">

                    <?= $form->field($jo, 'note')->textarea([
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



<?php if($permission->user_can('acknowledge-receipt')): ?>

<!-- Modal -->
<div id="acknowledge-receipt-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">
        
        <?php $form = ActiveForm::begin(['action' => ['acknowledge-receipt', 'id' => $model->id]]); ?>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Acknowledge Receipt</h4>
                </div>
                <div class="modal-body"> 
                    <table class="table">
                        <tr>
                            <th>Payment Type</th>
                            <td><?= $model->paymentType ?></td>
                        </tr>
                      
                        <tr>
                            <th>Pending Quantity</th>
                            <td><?= $model->pending_quantity ?></td>
                        </tr>
                        <tr>
                            <th>AR Quantity</th>
                            <td>
                                <?= $form->field($ar, 'quantity')->textInput([
                                    'type' => 'number'
                                ])->label(false) ?>
                            </td>
                        </tr>

                        <tr>
                            <th>Particulars</th>
                            <td>
                                <?= $form->field($ar, 'particular')->textarea([
                                    'rows' => 4
                                ])->label(false) ?>
                            </td>
                        </tr>

                        <tr>
                            <th>Date of Delivery</th>
                            <td>
                                <?= $form->field($ar, 'delivery_date')->textInput([
                                    'type' => 'date'
                                ])->label(false) ?>
                            </td>
                        </tr>

                        <tr>
                            <th>Delivery Status</th>
                            <td>
                                <?= $form->field($ar, 'delivery_status')->dropDownList(
                                    Yii::$app->params['delivery_status']
                                )->label(false) ?>
                            </td>
                        </tr>

                        <tr>
                            <th>Company Name</th>
                            <td>
                                <?= $form->field($ar, 'company_name')->textInput([
                                    'maxlength' => true
                                ])->label(false) ?>
                            </td>
                        </tr>

                        <tr>
                            <th>Received By</th>
                            <td>
                                <?= $form->field($ar, 'received_by')->textInput([
                                    'maxlength' => true
                                ])->label(false) ?>
                            </td>
                        </tr>
                    </table>
                    
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

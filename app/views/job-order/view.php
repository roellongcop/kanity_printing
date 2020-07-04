<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\JobOrder */

$this->title = $model->jo_no;
$this->params['breadcrumbs'][] = ['label' => 'Job Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
$permission = Yii::$app->permission;

$purchaseOrder = $model->purchaseOrder;
$quotation = $purchaseOrder->quotation;
$user = $quotation->user;

$attr = [
  'jo_no',
  'quantity',
  'served_quantity',
  'pending_quantity',
  'note:ntext',
    [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $model->currentStatusClass
    ],
  // 'createdAt',
  // 'updatedAt',
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
    // 'pending_quantity',
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
    'paymentType',
    'description:ntext',

    // 'createdAt',
    // 'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($quotation_attr, ['label' => 'Process By', 'value' => $quotation->processByUsername ]);
    array_push($quotation_attr, ['label' => 'Status','value' => $quotation->statusTitle]);
    array_push($quotation_attr, ['label' => 'Created By','value' => $quotation->createdByName]);
    array_push($quotation_attr, ['label' => 'Updated By','value' => $quotation->updatedByName]);
}
array_push($quotation_attr, 'note');


$po_attr = [
  'po_no',
   [
        'label' => 'Process Status',
        'format' => 'raw',
        'value' => $purchaseOrder->currentStatusClass
    ],
  'customer_note:ntext',
  // 'createdAt',
  // 'updatedAt',
];

if(Yii::$app->user->identity->roleAccess) {
    array_push($po_attr, ['label' => 'Status','value' => $model->statusTitle]);
    array_push($po_attr, ['label' => 'Created By','value' => $model->createdByName]);
    array_push($po_attr, ['label' => 'Updated By','value' => $model->updatedByName]);
}


?>

<div class="card mt10px">
    <div class="card-body">
        <div class="job-order-view">

            <p>
                <?= $permission->button(['create'], $model) ?>
                <?php if($model->canUpdate): ?>
                    <?= $permission->link([
                        'title' => 'Update',
                        'link' => ['job-order/update', 'id' => $model->id],
                        'options' => [
                            'class' => 'btn btn-primary',
                        ]
                    ]) ?>
                <?php endif; ?>

                <?php if($model->canReceivedScheduled): ?>
                    <?php if($permission->user_can('received-scheduled')): ?>
                        <span class="pull-right">
                            <?= Html::a('Received & Scheduled', '#', [
                                'class' => 'btn btn-success',
                                'data-toggle' => 'modal',
                                'data-target' => '#received-scheduled-modal'
                            ]) ?>
                        </span>
                    <?php endif; ?>
                <?php endif; ?>
                    
            </p>

            <hr>

            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link show active" data-toggle="tab" href="#general-data" role="tab" aria-controls="home" aria-selected="true">
                    <i class="icons cui-note"></i> General Details
                        <!-- <span class="badge badge-success">New</span> -->
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link show" data-toggle="tab" href="#daily-output" role="tab" aria-controls="profile" aria-selected="false">
                        <i class="icon-basket-loaded"></i> Daily Outputs
                            <span class="badge badge-pill badge-danger">
                                <?= number_format(count($model->dailyOutput)) ?>
                            </span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane show active" id="general-data" role="tabpanel">

                    <div class="row">
                        <div class="col-md-6">
                            <p class="lead">Job Order Details</p>
                            <?= DetailView::widget([
                                'model' => $model,
                                'attributes' => $attr,
                            ]) ?>
                        </div>
                        

                        <div class="col-md-6">
                            <p class="lead">Purchased Order Details
                                <?= Html::a('<i class="fa fa-eye"></i>', [
                                    'purchase-order/view', 'id' => $purchaseOrder->id
                                ]) ?>
                            </p>
                            <?= DetailView::widget([
                                'model' => $purchaseOrder,
                                'attributes' => $po_attr,
                            ]) ?>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
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
                        <div class="col-md-6">
                            <p class="lead">Quotation Details 
                                <?= Html::a('<i class="fa fa-eye"></i>', [
                                    'quotation/view', 'id' => $quotation->id
                                ]) ?>
                            </p>
                            <?= DetailView::widget([
                                'model' => $quotation,
                                'attributes' => $quotation_attr,
                            ]) ?>
                        </div>
                    </div>   
                    <hr>
                    <div class="row">
                        <div class="col-md-6">
                            <p class="lead">Image Referrence</p>
                            <?= $this->render('/quotation/_images', ['images' => $quotation->images]) ?>
                        </div>
                    </div>
                </div>
                <div class="tab-pane show" id="daily-output" role="tabpanel">

                    <?php if($permission->user_can('add-daily-output') && $model->canAddDailyOutput): ?>
                        <span class="pull-right">
                            <?= Html::a('Add Daily Ouput', '#', [
                                'class' => 'btn btn-success',
                                'data-toggle' => 'modal',
                                'data-target' => '#add-daily-output-modal'
                            ]) ?>
                        </span> <br><br>
                    <?php endif; ?>


                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],
                              'quantity',
                               [
                                'attribute' => 'created_at',
                                'value' => 'createdAt'
                            ],
                              // 'updatedAt',
                            // [
                            //     'attribute' => 'status',
                            //     'value' => 'statusTitle'
                            // ],

                            Yii::$app->permission->actionColumn([
                                'controller' => 'daily-output'
                            ]),
                        ],
                    ]); ?>
                </div>
            </div>

            

        </div>
    </div>
</div>



<?php if($permission->user_can('add-daily-output') && $model->canAddDailyOutput): ?>

<!-- Modal -->
<div id="add-daily-output-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">

        <?php $form = ActiveForm::begin(['action' => ['add-daily-output', 'id' => $model->id]]); ?>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Daily Output</h4>
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
                            <th>Output Quantity</th>
                            <td>
                                <?= $form->field($do, 'quantity')->textInput([
                                    'type' => 'number'
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




<?php if($permission->user_can('received-scheduled') && $model->process_status == 0): ?>

<!-- Modal -->
<div id="received-scheduled-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Received/Scheduled/Unserved</h4>
            </div>
            <div class="modal-body"> 
                <table class="table">
                    <tr>
                        <th>Quotation No</th>
                        <td><?= $model->quotationNo ?></td>
                    </tr>
                    <tr>
                        <th>Purchase Order No</th>
                        <td><?= $model->purchaseOrderNo ?></td>
                    </tr>
                    <tr>
                        <th>Job Order No</th>
                        <td><?= $model->jo_no ?></td>
                    </tr>
                </table>
                
            </div>
            <div class="modal-footer">
                <?= $permission->link([
                    'title' => 'Confirm',
                    'link' =>  ['job-order/received-scheduled', 'id' => $model->id],
                    'options' => [
                        'class' => 'btn btn-success'
                    ]
                ]) ?>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<?php endif; ?>

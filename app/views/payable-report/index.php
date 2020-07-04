<?php
use yii\helpers\Html;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'Payable Reports';
$this->params['breadcrumbs'][] = $this->title;
//$this->params['searchModel'] = $searchModel;

 
$src = <<< SCRIPT
    $('.date_range').daterangepicker({
        ranges   : {
            'Today'       : [moment(), moment()],
            'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month'  : [moment().startOf('month'), moment().endOf('month')],
            'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
            'This Year'  : [moment().startOf('year'), moment().endOf('year')],
            'Last Year'  : [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('month')],
        },
        startDate: moment("{$start}"),
        endDate  : moment("{$end}")
    },
    function (start, end) {
        var date_range = start.format('MM/DD/YYYY') + ' - ' + end.format('MM/DD/YYYY')
        $('#date_range').val(date_range);

        $('#date_range').closest('form').submit();
    } );
SCRIPT;
$this->registerJs($src, \yii\web\View::POS_READY);

?>

<div class="card mt10px">
    <div class="card-body">
    
        <div class="payable-report-index">
        	<div class="row">
        		<div class="col-md-8">
					<form class="form-inline" role="form" method="GET">
						<div class="form-group">

                            <div class='input-group date_range' >
                                <span class="input-group-addon btn btn-default">
                                    <i class="fa fa-calendar date-addon"></i>
                                </span>

                                <input type="text" name="date_range" id="date_range" class="form-control " style="width: 190px;" placeholder="Filter date range" value="<?= $date_range ?>">

                            </div>   

                        </div>

					</form>
        		</div>
                <div class="col-md-4">
                    <?php if($date_range): ?>
                        <p class="lead text-right">
                            <?= date('F d, Y', strtotime($start)) ?> - 
                            <?= date('F d, Y', strtotime($end)) ?>
                        </p>
                    <?php endif; ?>
                </div>
        	</div>

            <hr>

            <div class="row">
                <div class="col-md-12"> 
                    <p class="lead"><b>OFFICIAL RECEIPT (<?= number_format(count($receivables)) ?>)</b></p>
                    <?= $this->render('_or_table', [
                        'receivables' => $receivables,
                        'total_receivables' => $total_receivables,
                    ]) ?>
                </div>
            </div>

            <hr>

            <div class="row">
                <div class="col-md-12"> 
                    <p class="lead"><b>PAYABLES (<?= number_format(count($payables)) ?>)</b></p>
                    <?= $this->render('_payable_table', [
                        'payables' => $payables,
                        'total_payables' => $total_payables,
                    ]) ?>
                    
                </div>
            </div>

            <hr>
            <div class="row">
                <div class="col-md-12"> 
                    <?= $this->render('_income_table', [
                        'income' => $income,
                    ]) ?>
                </div>
            </div>
         
            <hr>
            <div class="row">
                <div class="col-md-12"> 
                    <?php if(Yii::$app->permission->user_can('print')): ?>
                        <?= Html::a('<i class="fa fa-print"></i> Print Report', '#', [
                            'class' => 'btn pull-right btn-printer  btn-success',
                            'data-url' => Url::to(['payable-report/print', 'date_range' => $date_range])
                        ]) ?>
                    <?php endif; ?>
                </div>
            </div>
        
        </div>
    </div>
</div>
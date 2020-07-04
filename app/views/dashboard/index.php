<?php
use yii\helpers\Html;
$this->title = 'Dashboard';

$src = <<< SCRIPT
  $('#year-filter').on('change', function() {
    var year = $(this).val();
    window.location.href = base_url + 'dashboard/' + year;
  });
SCRIPT;
$this->registerJs($src);
?>



<div class="card mt10px">
    <div class="card-body">
    	 <!-- /.card-->
              <p class="lead">DATA AS OF <?= $year ?>
                  <span class="pull-right">
                    Filter Year :  
                  <span class="pull-right">
                    <select class="form-control" id="year-filter">
                      <?php for ($i=2019; $i <= date('Y') ; $i++) : ?>
                        <option <?= ($i == $year) ? 'selected': '' ?>><?= $i ?></option>
                      <?php endfor; ?>
                    </select>
                  </span>
                  </span>

              </p> <hr>
            <div class="row">
              <div class="col-sm-6 col-lg-6">
                <div class="brand-card">
                  <div class="brand-card-header bg-facebook">
                    <i class="fa fa-book"> <span class="f-mono">Quotations</span></i>
                    <div class="chart-wrapper">
                      <!-- <canvas id="social-box-chart-1" height="90"></canvas> -->
                    </div>
                  </div>
                  <div class="brand-card-body">
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($quotation['pending']), [
                          'quotation/index', 
                          'QuotationSearch[process_status]' => 0,
                          'QuotationSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['process_status'][0]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($quotation['quoted']), [
                          'quotation/index', 
                          'QuotationSearch[process_status]' => 1,
                          'QuotationSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['process_status'][1]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($quotation['no_bid']), [
                          'quotation/index', 
                          'QuotationSearch[process_status]' => 2,
                          'QuotationSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['process_status'][2]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($quotation['cancelled']), [
                          'quotation/index', 
                          'QuotationSearch[process_status]' => 3,
                          'QuotationSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['process_status'][3]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($quotation['purchased_order']), [
                          'quotation/index', 
                          'QuotationSearch[process_status]' => 4,
                          'QuotationSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['process_status'][4]['title']) ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.col-->
              <div class="col-sm-6 col-lg-6">
                <div class="brand-card">
                  <div class="brand-card-header bg-twitter">
                    <i class="fa fa-edit"> <span class="f-mono">Purchase Order</span></i>
                    <div class="chart-wrapper">
                      <!-- <canvas id="social-box-chart-2" height="90"></canvas> -->
                    </div>
                  </div>
                  <div class="brand-card-body">
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($purchase_order['pending']), [
                          'purchase-order/index', 
                          'PurchaseOrderSearch[process_status]' => 0,
                          'PurchaseOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['po_process_status'][0]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($purchase_order['job_order']), [
                          'purchase-order/index', 
                          'PurchaseOrderSearch[process_status]' => 1,
                          'PurchaseOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['po_process_status'][1]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($purchase_order['partial']), [
                          'purchase-order/index', 
                          'PurchaseOrderSearch[process_status]' => 2,
                          'PurchaseOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['po_process_status'][2]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($purchase_order['completed']), [
                          'purchase-order/index', 
                          'PurchaseOrderSearch[process_status]' => 3,
                          'PurchaseOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['po_process_status'][3]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($purchase_order['cancelled']), [
                          'purchase-order/index', 
                          'PurchaseOrderSearch[process_status]' => 4,
                          'PurchaseOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['po_process_status'][4]['title']) ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.col-->
              
              <!-- /.col-->
             
              <!-- /.col-->
            </div> 
            <div class="row">
              <div class="col-sm-6 col-lg-6">
                <div class="brand-card">
                  <div class="brand-card-header bg-linkedin">
                    <i class="fa fa-wrench"> <span class="f-mono">Job Order</span></i>
                    <div class="chart-wrapper">
                      <!-- <canvas id="social-box-chart-3" height="90"></canvas> -->
                    </div>
                  </div>
                  <div class="brand-card-body">
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($job_order['pending']), [
                          'job-order/index', 
                          'JobOrderSearch[process_status]' => 0,
                          'JobOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['jo_process_status'][0]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($job_order['unserved']), [
                          'job-order/index', 
                          'JobOrderSearch[process_status]' => 1,
                          'JobOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['jo_process_status'][1]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($job_order['partial']), [
                          'job-order/index', 
                          'JobOrderSearch[process_status]' => 2,
                          'JobOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['jo_process_status'][2]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($job_order['completed']), [
                          'job-order/index', 
                          'JobOrderSearch[process_status]' => 3,
                          'JobOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['jo_process_status'][3]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($job_order['cancelled']), [
                          'job-order/index', 
                          'JobOrderSearch[process_status]' => 4,
                          'JobOrderSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['jo_process_status'][4]['title']) ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-sm-6 col-lg-6">
                <div class="brand-card">
                  <div class="brand-card-header bg-google">
                    <i class="fa fa-cubes"> <span class="f-mono">Base Stock</span></i>
                    <div class="chart-wrapper">
                      <!-- <canvas id="social-box-chart-3" height="90"></canvas> -->
                    </div>
                  </div>
                  <div class="brand-card-body">
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($base_stock['out_of_stock']), [
                          'base-stock/index', 
                          'BaseStockSearch[stock_status]' => 0,
                          'BaseStockSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['inventory_status'][0]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($base_stock['safe']), [
                          'base-stock/index', 
                          'BaseStockSearch[stock_status]' => 1,
                          'BaseStockSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['inventory_status'][1]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($base_stock['critical']), [
                          'base-stock/index', 
                          'BaseStockSearch[stock_status]' => 2,
                          'BaseStockSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['inventory_status'][2]['title']) ?>
                      </div>
                    </div>
                    <div>
                      <div class="text-value">
                        <?= Html::a(number_format($base_stock['exceed']), [
                          'base-stock/index', 
                          'BaseStockSearch[stock_status]' => 3,
                          'BaseStockSearch[date_range]' => $date_range,
                        ]) ?>
                      </div>
                      <div class="text-uppercase text-muted small">
                        <?= strtoupper(Yii::$app->params['inventory_status'][3]['title']) ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div> 


            <!-- /.row-->
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-sm-8">
                    <h4 class="card-title mb-0">Transactions</h4>
                    <div class="small text-muted"><?= $year ?></div>
                  </div>
                  <!-- /.col-->
                  <div class="col-sm-4 d-none d-md-block">
                    
                  </div>
                  <!-- /.col-->
                </div>
                <!-- /.row-->
                <div class="chart-wrapper" style="height:300px;margin-top:40px;" id="main-chart-wrapper">
                  <!-- <canvas class="chart" id="main-chart" height="300"></canvas> -->
                </div>
              </div>
             <!--  <div class="card-footer">
                <div class="row text-center">
                  <div class="col-sm-12 col-md mb-sm-2 mb-0">
                    <div class="text-muted">Visits</div>
                    <strong>29.703 Users (40%)</strong>
                    <div class="progress progress-xs mt-2">
                      <div class="progress-bar bg-success" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                  <div class="col-sm-12 col-md mb-sm-2 mb-0">
                    <div class="text-muted">Unique</div>
                    <strong>24.093 Users (20%)</strong>
                    <div class="progress progress-xs mt-2">
                      <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                  <div class="col-sm-12 col-md mb-sm-2 mb-0">
                    <div class="text-muted">Pageviews</div>
                    <strong>78.706 Views (60%)</strong>
                    <div class="progress progress-xs mt-2">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                  <div class="col-sm-12 col-md mb-sm-2 mb-0">
                    <div class="text-muted">New Users</div>
                    <strong>22.123 Users (80%)</strong>
                    <div class="progress progress-xs mt-2">
                      <div class="progress-bar bg-danger" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                  <div class="col-sm-12 col-md mb-sm-2 mb-0">
                    <div class="text-muted">Bounce Rate</div>
                    <strong>40.15%</strong>
                    <div class="progress progress-xs mt-2">
                      <div class="progress-bar" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                </div>
              </div> -->
            </div>
           
    </div>
</div>
<?= $this->render('/layouts/_print_header', ['title' => 'PAYABLE REPORTS']) ?>

<?php if($date_range): ?>
<p> <?= date('F d, Y', strtotime($start)) ?> - <?= date('F d, Y', strtotime($end)) ?></p>
<?php endif; ?>
<div class="payable-report-index">
	
    <div class="row">
        <div class="col-md-12"> 
            <p class="lead"><b>RECEIVABLES</b></p>
            <?= $this->render('_or_table', [
                'receivables' => $receivables,
                'total_receivables' => $total_receivables,
            ]) ?>
        </div>
    </div>

    <hr>

    <div class="row">
        <div class="col-md-12"> 
            <p class="lead"><b>PAYABLES</b></p>
            <?= $this->render('_payable_table', [
                'payables' => $payables,
                'total_payables' => $total_payables,
            ]) ?>
            
        </div>
    </div>

    <div class="row">
        <div class="col-md-12"> 
            <?= $this->render('_income_table', [
                'income' => $income,
            ]) ?>
        </div>
    </div>
 
</div>
<p>Prepared By: <?= Yii::$app->user->identity->name; ?></p>
   
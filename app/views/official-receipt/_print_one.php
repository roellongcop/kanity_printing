<?php
$setting = Yii::$app->general->setting();
$si = $model->salesInvoice;

$vatableSales = round($si->total / 1.12, 2);
$ewt = round($vatableSales * 0.2);
$amountDue = round($si->total - $ewt, 2);
$vat = round($vatableSales * 0.12, 2);
?>

<div >
	<div class="row" style="font-size: 12px;">
		<div class="col-md-4 col-xs-4 col-sm-4">
			<table style="width: 100%; border-collapse: collapse;" border="1">
				<tr>
					<th colspan="2" style="text-align: center;color: #fff;background-color: black" class="bcb">IN THE SETTLEMENT OF THE FOLLOWING:</th>
				</tr>
				<tr>
					<td>Particulars</td>
					<td>AMOUNT</td>
				</tr>
				<tr> <td colspan="2">-</td> </tr>

				<tr>
					<td>Total Sales (VAT Inclusive)</td>
					<td><?= number_format($si->total, 2) ?></td>
				</tr>

				<tr>
					<td>Less: VAT</td>
					<td></td>
				</tr>

				<tr>
					<td>Total</td>
					<td></td>
				</tr>

				<tr>
					<td>Less: SC/PWD Discount</td>
					<td></td>
				</tr>

				<tr>
					<td>Total Due</td>
					<td></td>
				</tr>

				<tr>
					<td>Less: WIthoholding Tax</td>
					<td><?= number_format($ewt, 2) ?></td>
				</tr>

				<tr>
					<td>Add: VAT</td>
					<td></td>
				</tr>

				<tr>
					<td>Amount Due</td>
					<td><?= number_format($amountDue , 2) ?></td>
				</tr>

				<tr> <td colspan="2">-</td> </tr>

				<tr> <td colspan="2">-</td> </tr>

				<tr>
					<td>VATable Sales</td>
					<td><?= number_format($vatableSales, 2) ?></td>
				</tr>

				<tr>
					<td>VAT Exempt Sales</td>
					<td></td>
				</tr>

				<tr>
					<td>Zero Rated Sales</td>
					<td></td>
				</tr>

				<tr>
					<td>VAT Amount</td>
					<td><?= $vat ?></td>
				</tr>


				<tr>
					<td>Total Sales</td>
					<td><?= number_format($si->total, 2) ?></td>
				</tr>

				<tr>
					<th colspan="2" style="text-align: center;color: #fff;background-color: black">FORM OF PAYMENT</th>
				</tr>

				<tr>
					<td>
						<label>
							<input type="checkbox" name="">
							CASH
						</label>
					</td>
					<td></td>
				</tr>

				<tr>
					<td>
						<label>
							<input type="checkbox" name="">
							CHECK
						</label>
						<span class="pull-right">Bank</span>
					</td>
					<td></td>
				</tr>

				<tr>
					<td>
						<span class="pull-right">Check No.</span>
					</td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="col-md-8 col-xs-8 col-sm-8">
		 
			<div class="row">
			    <div class="col-md-12 col-xs-12 col-sm-12">
			        <div class="text-left">
			            <img style="margin-top: -30px;" class="navbar-brand-full" 
			                src="<?= Yii::$app->general->logo() ?>" 
			                alt="CoreUI Logo">

			            <div style="margin-top: -54px; margin-left: 67px;">
			                <?= $setting['company_address'] ?> <br>
			                TEL NO: <?= $setting['company_phone_no'] ?>  FAX: <?= $setting['company_fax_no'] ?> <br>
			                TIN: <?= $setting['tin'] ?> VAT
			            </div>
			            <br><br>
			        </div>
			        <span class="pull-right" style="margin-top: -50px;">
			        	<h4>No : <span style="color: red"><?= $model->no ?></span></h4>
			        </span>

			    </div>
			</div>
			<div class="row">
			    <div class="col-md-12 col-xs-12 col-sm-12">
			    	<h4 style="text-decoration: underline;margin-top: -25px;">OFFICIAL RECEIPT</h4>
				</div>
			</div>

			<div class="row">
			    <div class="col-md-8 col-xs-8 col-sm-8"></div>
			    <div class="col-md-2 col-xs-2 col-sm-2">
			    	<span style="    float: right;">Date: </span>
				</div>
			    <div class="col-md-2 col-xs-2 col-sm-2" style="border-bottom: 1px solid black;">
			    	<span>
			    		<?= $model->date ?>
			    	</span>
				</div>
			</div>


			<div class="row">
			    <div class="col-md-12 col-xs-12 col-sm-12">
			    	<table style="width: 100%">
			    		<tr>
			    			<td width="100">Received from</td>
			    			<td colspan="3" style="    border-bottom: 1px solid #000000;">
			    				<?= ucwords($model->received_from) ?>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="50">With TIN</td>
			    			<td colspan="3" style="    border-bottom: 1px solid #000000;">
			    				<?= $model->tin ?>
			    			</td>
			    		</tr>

			    		<tr>
			    			<td width="50">and address at</td>
			    			<td colspan="3" style="    border-bottom: 1px solid #000000;">
			    				<?= $model->address ?>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2">engaged in the business style of</td>
			    			<td colspan="2" width="420" style=" border-bottom: 1px solid #000000;">
			    				<?= $model->business_style ?>
			    			</td>
			    		</tr>

			    		<tr>
			    			<td width="50">the sum of</td>
			    			<td colspan="3" style="    border-bottom: 1px solid #000000;">
			    				<?= $model->sum_of ?>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="    border-bottom: 1px solid #000000;">.</td>
			    			<td width="147" >in partial/full payment for</td>
			    			<td colspan="2" style="    border-bottom: 1px solid #000000;">
			    				<?= $model->payment_for ?>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="    border-bottom: 1px solid #000000;">.	</td>
			    		</tr>

			    		<tr>
			    			<td colspan="4">.</td>
			    		</tr>

			    		<tr>
			    			<td colspan="2">
			    				<table style="width: 100%; border-collapse: collapse;" border="1">
									<tr>
										<td colspan="2" style="    padding: 10px;">
											Senior Citizen TIN
										</td>
									</tr>

									<tr>
										<td style="    padding: 10px;">OSCA/PWD ID No.</td>
										<td style="    padding: 10px;">Signature</td>
									</tr>
									
								</table>
			    			</td>
			    			<td style="width: 100px;">.</td>
			    			<td colspan="2" style="text-align: center;border-bottom: 1px solid #000000;">
			    				<div style="    position: relative; bottom: -35px;">
			    					<h5>
			    				
			    						BY: <span><?= strtoupper($model->cashier) ?></span>
			    					</h5>
			    				</div>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2">.</td>
			    			<td colspan="2" style="text-align: center">Cashier / Authorized Representative</td>
			    		</tr>
			    	</table>

				</div>
			
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-xs-12 col-sm-12" style="text-align: center;"> <br>
			<h6 style="    text-decoration: underline;">THIS OFFICIAL RECEIPT SHALL BE VALID FOR FIVE (5) YEARS FROM THE DATE OF ATP</h6>
		</div>
	</div>
</div>
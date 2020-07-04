<div>

	<div class="row">
		<div class="col-md-3 col-xs-3"></div>
		<div class="col-md-6 col-xs-6">
			<img class="navbar-brand-full" src="<?= Yii::$app->general->logo() ?>" alt="CoreUI Logo" style="width: 100%;">
		</div>
	</div>

	<br><br>

	<div class="row">
		<div class="col-md-4 col-xs-4">
			<?= date('F d, Y', strtotime($model->createdAt)) ?>
		</div>
		<div class="col-md-4 col-xs-4"></div>
		<div class="col-md-4 col-xs-4">
			<p class="lead text-right">
				<b>SALES INVOICE NO: <?= $model->no ?></b>
			</p>
		</div>
	</div>

	<br>

	<div class="row">
		<div class="col-md-4 col-xs-4">
			<b> <?= strtoupper($model->company_name) ?></b> <br>
			<?= $model->company_address ?> 
		</div>
	</div>

	<br><br><br><br>
	<div class="row">
		<div class="col-md-4 col-xs-4">
			ATTENTION: <?= ucwords($model->contact_person) ?> 
		</div>
	</div>

	<br><br><br>

	<div class="row">
		<div class="col-md-12 col-xs-12">
			This is to bill you for the printing cost services on 
			<?php if(($po = $model->purchaseOrder) != null): ?>
				<b><?= $model->quotation->specs ?>.</b>
			<?php endif; ?>
			
		</div>
	</div>

	


	<br><br><br><br>

	<?php if(($ars = $model->purchaseOrder->acknowledgmentReceipt) != null): ?>

		<?php foreach ($ars as $ar) : ?>
			<div class="row">
				<div class="col-md-3 col-xs-3">
					Pickup Date: <?= date('m/d/Y', strtotime($ar->delivery_date)) ?>
				</div>
				<div class="col-md-2 col-xs-2">
					<b><?= $ar->no ?></b>
				</div>
				<div class="col-md-5 col-xs-5">
					<?= $ar->particular ?>
				</div>
				<div class="col-md-2 col-xs-2">
					= Php <?= number_format($ar->totalPrice, 2) ?>
				</div>
			</div>
		<?php endforeach; ?>

	<?php endif; ?>


	




	<br><br><br>
	<div class="row">
		<div class="col-md-5 col-xs-5">
		</div>
		<div class="col-md-5 col-xs-5">
			TOTAL AMOUNT DUE
		</div>
		<div class="col-md-2 col-xs-2">
			= Php <?= number_format($model->quotation->totalPrice, 2) ?><br>
			----------------
		</div>
	</div>

	<br><br><br><br><br><br><br><br>

	<div class="row">
		<div class="col-md-3 col-xs-3">
			Prepared By
		</div>
		<div class="col-md-3 col-xs-3"></div>
		<div class="col-md-3 col-xs-3">
			Noted By
		</div>
	</div>


	<br><br>

	<div class="row">
		<div class="col-md-3 col-xs-3">
			<?= ucwords($model->prepared_by) ?>
		</div>
		<div class="col-md-3 col-xs-3"></div>
		<div class="col-md-3 col-xs-3">
			<?= ucwords($model->noted_by) ?>
		</div>
	</div>

	
</div>

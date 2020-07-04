<?php
?>

<?= $this->render('/layouts/_print_header', ['title' => 'ACKNOWLEDGEMENT RECEIPT']) ?>


<div id="window_print">
	
	<div class="row">
		<div class="col-md-2 col-xs-2"> RECEIVED BY: </div>

		<div class="col-md-5 col-xs-5 bb1">
			<?= ucwords($model->received_by) ?>
		</div>

		<div class="col-md-1 col-xs-1">DATE: </div>

		<div class="col-md-3 col-xs-3 bb1">
			<?= date('F d, Y' , strtotime($model->delivery_date)) ?>
		</div>

	</div>

	<br>

	<div class="row">
		<div class="col-md-2 col-xs-2"> COMPANY: </div>

		<div class="col-md-5 col-xs-5 bb1">
			<?= strtoupper($model->company_name) ?>
		</div>
	</div>


	<br>
	<br>


	<table class="table table-bordered">
		<thead>
			<tr>
				<th>ITEMS NO</th>
				<th>PARTICULARS</th>
				<th class="text-right">QTY</th>
				<th>UNIT</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>
					<div class="text-center"> <br>
						<h4><?= $model->particular ?></h4>
						<p><?= $model->quotation->specs ?></p>
						<p>**  PRINTING COST ONLY **</p>
					</div>

					<br><br>
					<small>NOTE: <?= $model->note ?></small>
				</td>
				<td class="text-right"> 
					<?= $model->quantity ?>
				</td>
				<td>pcs</td>
			</tr>
		</tbody>
	</table>

	<br> <br> <br> <br> <br><br>

	<div class="row">
		<div class="col-md-8 col-xs-8">  </div>
		<div class="col-md-4 col-xs-4 text-center bt1">  
			<h4>RECEIVED BY</h4>
		</div>

	</div>

</div>

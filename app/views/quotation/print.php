<?php
use yii\widgets\ListView;
?>

<?= $this->render('/layouts/_print_header', ['title' => 'QUOTATION REPORTS']) ?>
<p>Date: <?= date('F d, Y') ?></p>
<table class="table table-bordered" id="window_print">
    <thead>
        <th>quotation no</th>
        <th>type Of ServiceName</th>
        <th>fullname</th>
        <th>company Name</th>
        <th>quantity</th>
        <th>Status</th>
        <th>Mode of Payment</th>
        <th>price per piece</th>

    </thead>
    <tbody>
        <?= ListView::widget([
            'dataProvider' => $dataProvider,
            'layout' => '{items}',
            'itemView' => '_print'
        ]); ?>
    </tbody>
</table>

<p>Prepared By: <?= Yii::$app->user->identity->name; ?></p>
 
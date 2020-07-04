<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'ACKNOWLEDGMENT RECEIPT REPORTS']) ?>
<p>Date: <?= date('F d, Y') ?></p>

<table class="table table-bordered" id="window_print">
    <thead>
        <th>no</th>
        <th>purchase order no</th>
        <th>company name</th>
        <th>received by</th>
        <th>quantity</th>
        <th>delivery date</th>
        <th>delivery status</th>
        <th>particular</th>
        <th>note</th>
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
 
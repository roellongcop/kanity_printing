<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'SALES INVOICE REPORTS']) ?>

<p>Date: <?= date('F d, Y') ?></p>
<table class="table table-bordered" id="window_print">
    <thead>
        <th>no</th>
        <th>purchase order no</th>
        <th>pickup date</th>
        <th>prepared by</th>
        <th>noted by</th>
        <th>payment status</th>
        <th>company name</th>
        <th>company address</th>
        <th>contact person</th>
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
 
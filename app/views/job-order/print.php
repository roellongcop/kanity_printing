<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'JOB ORDER REPORTS']) ?>
<p>Date: <?= date('F d, Y') ?></p>

<table class="table table-bordered" id="window_print">
    <thead>
        <th>quotation no</th>
        <th>purchase order no</th>
        <th>jo no</th>
        <th>quantity</th>
        <th>served quantity</th>
        <th>pending quantity</th>
        <th>note</th>
        <th>status</th>
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
 
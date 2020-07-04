<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'BASE STOCK ISSUE REPORTS']) ?>

<p>Date: <?= date('F d, Y') ?></p>
<table class="table table-bordered" id="window_print">
    <thead>
        <th>stock ame</th>
        <th>username</th>
        <th>quantity</th>
        <th>date</th>
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
 
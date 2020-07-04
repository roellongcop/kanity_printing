<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'DAILY OUTPUT REPORTS']) ?>

<p>Date: <?= date('F d, Y') ?></p>
<table class="table table-bordered" id="window_print">
    <thead>
        <th>job order No</th>
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
 
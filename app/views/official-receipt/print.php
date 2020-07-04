<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'OFFICIAL RECEIPT REPORTS']) ?>

<p>Date: <?= date('F d, Y') ?></p>
<table class="table table-bordered" id="window_print">
    <thead>
        <th>sales invoice </th>
        <th>no</th>
        <th>date</th>
        <th>received from</th>
        <th>tin</th>
        <th>address</th>
        <th>business style</th>
        <th>sum of</th>
        <th>payment for</th>
        <th>cashier</th>
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
 
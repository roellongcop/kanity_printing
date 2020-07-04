<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'LOG REPORTS']) ?>

<p>Date: <?= date('F d, Y') ?></p>
<table class="table table-bordered" id="window_print">
    <thead>
        <th>user </th>
        <th>ref id</th>
        <th>method</th>
        <th>url</th>
        <th>action</th>
        <th>controller</th>
        <th>model</th>
        <th>ip</th>
        <th>browser</th>
        <th>os</th>
        <th>device</th>
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
 
<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'BASE STOCK REPORTS']) ?>
<p>Date: <?= date('F d, Y') ?></p>

<table class="table table-bordered" id="window_print">
    <thead>
        <th>category name</th>
        <th>unit</th>
        <th>name</th>
        <th>description</th>
        <th>max stock</th>
        <th>min stock</th>
        <th>current stock</th>
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
 
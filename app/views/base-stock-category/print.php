<?php
use yii\widgets\ListView;

?>

<?= $this->render('/layouts/_print_header', ['title' => 'BASE STOCK CATEGORY REPORTS']) ?>
<p>Date: <?= date('F d, Y') ?></p>

<table class="table table-bordered" id="window_print">
    <thead>
        <th>name</th>
        <th>description</th>
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
 
<?php
$image_attr = isset($image_attr) ? $image_attr: 'image';
?>

<img id="image-preview"src="<?= Yii::$app->general->file_path($model->$image_attr) ?>"alt=""class="img-thumbnail"width="200"height="200">

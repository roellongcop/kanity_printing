<?php if(($_images = $images) != null): ?>
    <div class="row">
        <?php foreach ($_images as $key => $image) : ?>
            <div class="col-md-<?= isset($col) ? $col: 3 ?>">
                <img src="<?= Yii::$app->general->file_path($image) ?>" class="img-thumbnail image-ref" data-toggle="modal" data-target="#modal-<?=$key ?>">
            </div>

            <div id="modal-<?=$key ?>" class="modal fade" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="<?= Yii::$app->general->file_path($image) ?>" class="img-thumbnail" >
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            <a target="_blank" class="btn btn-success"  href="<?= Yii::$app->general->file_path($image) ?>">Fullpage View</a>
                        </div>
                    </div>
                </div>
            </div>

        <?php endforeach; ?>
    </div>
<?php endif; ?>
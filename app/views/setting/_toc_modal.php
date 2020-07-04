<?php
$setting = Yii::$app->general->setting();
?>

<div id="toc-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Terms and Condition</h4>
                </div>
                <div class="modal-body">
                    <?= $setting['terms_and_condition'] ?>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-confirm-toc" data-dismiss="modal">
                        Confirm
                    </button>
                </div>
            </div>

    </div>
</div>
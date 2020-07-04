<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use app\assets\AppAsset;
// use app\assets\DefaultAsset;

$asset = AppAsset::register($this);
// $asset = DefaultAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
	<meta charset="<?= Yii::$app->charset ?>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?= Html::csrfMetaTags() ?>
	<title><?= Html::encode($this->title) ?></title>
	<?php $this->head() ?>
	<script type="text/javascript">
		var base_url = '<?= Yii::$app->urlManager->baseUrl ?>/';
		
	</script>
</head>
<body class="">
<?php $this->beginBody() ?>
	<div class="container" id="window_print">
		<?= $content ?>
	</div>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

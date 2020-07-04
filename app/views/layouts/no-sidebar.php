<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use app\assets\AppAsset;

$asset = AppAsset::register($this);
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
	<script>
	  window.dataLayer = window.dataLayer || [];

	  function gtag() {
		dataLayer.push(arguments);
	  }
	  gtag('js', new Date());
	  // Shared ID
	  gtag('config', 'UA-118965717-3');
	  // Bootstrap ID
	  gtag('config', 'UA-118965717-5');
	</script>
</head>
<body class="app flex-row align-items-center" style="background-image: url('<?= Yii::$app->urlManager->baseUrl; ?>//uploads/bg.jpg');background-size: cover;">

	 <?php $this->beginBody() ?>
	 
<?= $content ?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

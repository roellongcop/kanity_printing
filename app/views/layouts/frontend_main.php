<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use app\assets\DefaultAsset;
use yii\widgets\Breadcrumbs;
use yii\widgets\ActiveForm;

$asset = DefaultAsset::register($this);
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
	
</head>
<body>
<?php $this->beginBody() ?>
  <?= $this->render('_frontend_header') ?>
  <?= $this->render('/layouts/_message') ?>
  <?= $content ?>

  <?= $this->render('_frontend_footer') ?>


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

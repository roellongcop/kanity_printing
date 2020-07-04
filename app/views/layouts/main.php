<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\helpers\Url;
use app\assets\AppAsset;
use yii\widgets\Breadcrumbs;
use yii\widgets\ActiveForm;
use app\models\search\NotificationSearch;

$asset = AppAsset::register($this);
$setting = Yii::$app->general->setting();
if (Yii::$app->user->identity->balance > 0) {
	Yii::$app->session->setFlash('warning', 'You Have '.number_format(Yii::$app->user->identity->balance, 2).'  unpaid Balance.');
}
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
		var base_url = '<?= Yii::$app->urlManager->baseUrl ?>/';

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
<body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
<?php $this->beginBody() ?>
	<header class="app-header navbar">
		<button style="background: #fff;" class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="<?= Url::to(['dashboard/index']) ?>">
			<img class="navbar-brand-full" src="<?= Yii::$app->general->logo() ?>" alt="CoreUI Logo" style="width: 100%;">
			<img class="navbar-brand-minimized" src="<?= Yii::$app->urlManager->baseUrl ?>/uploads/icon.jpg"  alt="CoreUI Logo" style="width: 100%;">
		</a>
		<button style="background: #fff;" class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
			<span class="navbar-toggler-icon"></span>
		</button>
		<ul class="nav navbar-nav d-md-down-none">
			<?php if (isset($this->params['searchModel'])) : ?>
				<li class="nav-item px-3" style="width: 400px;">

						<?php $form = ActiveForm::begin(['method' => 'get', 'action' => ['index']]); ?>
							<?php $searchModelNameSpace = explode('\\', $this->params['searchModel']::className()) ?>

							<?php $searchModelClass = end($searchModelNameSpace); ?>


							<input type="text" class="form-control" name="<?= $searchModelClass ?>[keywords]" value="<?= $this->params['searchModel']->keywords ?>" placeholder="Search">
						<?php ActiveForm::end(); ?>

				</li>
				<li class="nav-item px-3">
					<a href="#" data-toggle="collapse" data-target="#search-panel"> 
						<i class="fa fa-filter"></i> Advanced
					</a>
				</li>
			<?php endif; ?>
				
		</ul>
	  	<ul class="nav navbar-nav ml-auto">
			<li class="nav-item d-md-down-none">

				<?php if(($notifications = NotificationSearch::fetch()) != null): ?>
					<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						<i class="icon-bell"></i>
						<?php if($notifications['grand_total']): ?>
							<span class="badge badge-pill badge-danger">
								<?= $notifications['grand_total'] ?>
							</span>
						<?php endif; ?>
					</a>

			  		<div class="dropdown-menu dropdown-menu-right">

						<div class="dropdown-header text-center">
							<strong>Notifcations</strong>
						</div>
						<?php $class = ['info', 'default', 'primary', 'warning', 'danger', 'success']; ?>

						<?php foreach ($notifications['data'] as $notification) : ?>
							<a class="dropdown-item" href="<?= Url::to(['notification/index', 
								'NotificationSearch[controller]' => $notification['controller'],
								'NotificationSearch[read_status]' => 0,
							]) ?>">
								<i class="<?= $notification['icon'] ?>"></i> 
								<?= $notification['title'] ?>
								<span class="badge badge-<?= $class[rand(0, 5)] ?>">
									<?= $notification['total'] ?>
								</span>
							</a>
						<?php endforeach; ?>
						<a class="dropdown-item" href="<?= Url::to(['notification/index']) ?>">
							<i class="fa fa-bell"></i> 
							View All
						</a>
			  		</div>
				<?php endif; ?>

				
			</li> 
			<li class="nav-item d-md-down-none">
				<?= Yii::$app->user->identity->roleName ?>
			</li> 
			<li class="nav-item dropdown">
		  		<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
					<img class="img-avatar" src="<?= Yii::$app->user->identity->profile_path ?>" alt="img">
		  		</a>
		  		<div class="dropdown-menu dropdown-menu-right">
				 

					<div class="dropdown-header text-center">
						<strong>Account</strong>
					</div>
					
					<?= Yii::$app->permission->link([
						'link' => ['user/build-profile'],
						'title' => '<i class="fa fa-user"></i> My Profile',
						'options' => [
							'class' => 'dropdown-item'
						]
					]) ?>

					<?= Yii::$app->permission->link([
						'link' => ['user/my-account'],
						'title' => '<i class="fa fa-user"></i> Credentials',
						'options' => [
							'class' => 'dropdown-item'
						]
					]) ?>

					<?= Html::beginForm(['/site/logout'], 'post', ['id' => 'frm-logout']) ?>
					<?= Html::endForm() ?>
					<a class="dropdown-item btn-logout" href="#">
						<i class="fa fa-power-off"></i> 
						Logout
					</a>
		  		</div>
			</li>
	  	</ul>
	</header>


	<div class="app-body"> 
 
		<?= $this->render('_sidebar') ?> 
		 



		<main class="main">
			<!-- Breadcrumb-->
			<?php if(Yii::$app->request->referrer && Yii::$app->controller->id != 'dashboard'): ?>
				<?= Html::a('<i class="fa fa-arrow-left"></i>', Yii::$app->request->referrer, [
					'title' => 'Back',
					'class' => 'btn btn-sm btn-info back-button'
				]) ?>
				<?= Html::a('<i class="fa fa-arrow-left"></i>', Yii::$app->request->referrer, [
					'title' => 'Back',
					'class' => 'btn btn-sm btn-info back-button2'
				]) ?>
			<?php endif; ?>

			<?= Breadcrumbs::widget([
			    'homeLink' => ['label' => 'Dashboard', 'url' => ['/dashboard']],
			    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
			    'itemTemplate' => "<li class=\"breadcrumb-item\">{link}</li>\n",
			    'activeItemTemplate' => "<li class=\"breadcrumb-item active\">{link}</li>\n"
			]) ?>


			<div class="container-fluid">
				<div class="animated fadeIn">
					
  							<?= $this->render('/layouts/_message') ?>
							<?= $content ?>
						
				</div>
			</div>
		</main>
	</div>


	<footer class="app-footer">
		<div>
			<span><?= $setting['company_name'] ?> | Infinity.free.com</span>
		</div>
		<div class="ml-auto">
			<span></span>
		</div>
	</footer>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

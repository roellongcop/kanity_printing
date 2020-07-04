<?php
namespace app\components;

use Yii; 
use yii\helpers\Html;
use yii\helpers\FileHelper;
use yii\helpers\Inflector;
use yii\helpers\Url;
use yii\web\NotFoundHttpException;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;


/**
 * 
 */
class Permission extends \yii\base\Component
{


	public function controllerActions($res = [])
	{
		$controllers = FileHelper::findFiles(Yii::getAlias('@app/controllers'), [
			'recursive' => true
		]);

		foreach ($controllers as $key => $controller) {
			$contents = file_get_contents($controller);
			$controller_ID = Inflector::camel2id(substr(basename($controller), 0, -14));
			preg_match_all('/public function action(\w+?)\(/', $contents, $result);
			
			foreach ($result[1] as $action) {
				$action_ID = Inflector::camel2id($action);

				if($action_ID !== 's') {
					$res[$controller_ID][] = $action_ID;
				}
			}
		}
 
		return $res;
	}

	 

	public function actions($controller="")
	{ 
		if ($controller === "") {
			return $this->controllerActions()[Yii::$app->controller->id];
		} 

		$actions = $this->controllerActions();

		return isset($actions[$controller]) ? $actions[$controller]: [];
	}
 	

 	public function behaviors($actions=[''], $verb_actions="")
 	{

 		return [
 			'access' => $this->_access($actions),
            'verbs' => $this->verbs($verb_actions)
        ];
 	}

 	public function verbs($verb_actions="")
 	{
 		$actions = $verb_actions === "" ? ['delete' => ['POST']] : $verb_actions;

 		return [
            'class' => VerbFilter::className(),
            'actions' => $actions,
        ];
 	}


 	public function my_actions($controller='')
 	{
 		if (Yii::$app->user->isGuest) {
 			return [''];
 		}
		$controller = ($controller) ? $controller:  Yii::$app->controller->id;
 		$module_access = Yii::$app->user->identity->moduleAccess;

 		return isset($module_access[$controller]) ? $module_access[$controller]: [''];
 	}

 	public function _access($actions=[''])
 	{
 		return [
			'class' => AccessControl::className(),
			'only' => $this->actions(),
            'rules' => [
                [
                    'actions' => $this->my_actions(),
                    'allow' => true,
                    'roles' => ['@'],
				],
				[
                    'actions' => $actions,
                    'allow' => true,
                    'roles' => ['?'],
				],
            ],
		];
 	}
 

	public function actionColumn($params="")
	{

		$_templates = isset($params['template']) ? $params['template']: ['view', 'update', 'delete'];
		$controller = isset($params['controller']) ? $params['controller']: Yii::$app->controller->id;

		$template = [];

		foreach ($_templates as $_template) {
			$explode_template = explode(':', $_template);

			$controller = isset($explode_template[1]) ? $explode_template[1]: $controller;
			$template[] = '{'.$explode_template[0].'}';
			// $template[] = $this->user_can($explode_template[0], $controller) ? '{'.$explode_template[0].'}':'';

		}
		$use = [
			'controller' => $controller
		];

		return [
            'class' => 'yii\grid\ActionColumn',
            'template' => '<div class="btn-group">'.implode(' ', $template).'</div>',
            'headerOptions' => ['width' => 120],
            'buttons' => [
                'view' => function($url, $model) use($use) {
                	if (isset($model->canView) && $model->canView) {
	                    return $this->link([
	                    	'title' => '<i class="fa fa-eye"></i>',
	                    	'link' => [$use['controller'] . '/view', 'id' => $model->id],
	                    	'options' => ['class' => 'btn btn-info btn-sm', 'title' => 'View']
	                    ]);
                	}
                },
                'update' => function($url, $model) use ($use){
                	if (isset($model->canUpdate) && $model->canUpdate) {
	                	return $this->link([
	                    	'title' => '<i class="fa fa-edit"></i>',
	                    	'link' => [$use['controller'] . '/update', 'id' => $model->id],
	                    	'options' => ['class' => 'btn btn-primary btn-sm', 'title' => 'Update']
	                    ]);
                	}
                },
                'delete' => function($url, $model) use ($use) {
                	if ($this->user_can('delete', $use['controller'])) {
                		if (isset($model->canDelete) && $model->canDelete) {
                			return Html::a('<i class="fa fa-trash"></i>', '#',
		                		[
	                    		'class' => 'btn btn-danger btn-sm delete',
		                        'title' => 'Delete',
		                        'data-key' => $model->id,
		                        'data-selected' => $model->id,
		                        'data-page' => $use['controller'],
	                    	]) ;
                		}
                	}
                },

            ]
        ];
	}




	public function user_can($action='', $controller='')
 	{
		$action = ($action === '') ? Yii::$app->controller->action->id : $action;
		$controller = ($controller === '') ? Yii::$app->controller->id : $controller;

		$access = Yii::$app->user->identity->role->module_access;

		if (isset($access[$controller])) {
			return in_array($action, $access[$controller]);
		}

		return FALSE;

 	}


 	public function button($names=[], $model='', $params=[])
 	{
 		$controller = isset($params['controller']) ? $params['controller']: Yii::$app->controller->id;
 		$names = is_array($names) ? $names: [$names];


 		$buttons = [];
 		foreach ($names as $name) {

 			$title = isset($params['title']) ? $params['title'] : ucwords($name);
        	$action = 'can' . ucfirst($name);

 			switch ($name) { 

 				case 'index':
 					$title = isset($params['title']) ? $params['title'] : 'List';
 					$options = isset($params['options']) ? $params['options'] : ['class' => 'btn btn-white'];
	 				$buttons[] = $this->link([
		 				'title' => $title,
		 				'link' => [$controller . '/' . $name],
		 				'options' => $options
		 			]);
	 				break;

	 			case 'create':
 					$options = isset($params['options']) ? $params['options'] : ['class' => 'btn btn-success'];
 					$title = $title . ' New';

	 				$buttons[] = $this->link([
		 				'title' => $title,
		 				'link' => [$controller . '/' . $name],
		 				'options' => $options
		 			]);


	 				break;

 				case 'view':
 					$options = isset($params['options']) ? $params['options'] : ['class' => 'btn btn-info'];

 					if ($model->$action) {
		 				$buttons[] = $this->link([
			 				'title' => $title,
			 				'link' => [$controller . '/' . $name, 'id' => $model->id],
			 				'options' => $options
			 			]);
 					}
	 				break;

				case 'update':
 					$options = isset($params['options']) ? $params['options'] : ['class' => 'btn btn-primary'];

 					if ($model->$action) {
		 				$buttons[] = $this->link([
			 				'title' => $title,
			 				'link' => [$controller . '/' . $name, 'id' => $model->id],
			 				'options' => $options
			 			]);
 					}
	 				break;

				case 'delete':
 					$options = isset($params['options']) ? $params['options'] : [
 						'class' => 'btn btn-danger',
 						'data' => [
			                'confirm' => 'Are you sure you want to delete this '.ucwords($controller).'?',
			                'method' => 'post',
			            ]
 					];

                	if ($this->user_can('delete', $controller)) {
	 					if ($model->$action) {
	            			$buttons[] = $this->link([
				 				'title' => $title,
				 				'link' => [$controller . '/' . $name, 'id' => $model->id],
				 				'options' => $options
				 			]);
	            		}
            		}

	 				
	 				break;

 				case 'print':
 					$controller = ($controller) ? $controller: Yii::$app->controller->id;

					$print_url = Url::to([$controller . '/print', 'params' => json_encode(Yii::$app->request->queryParams)]);
					if ($this->user_can('print', $controller)) {
						$buttons[] = Html::a('<i class="fa fa-print"></i> PRINT', '#', [
							'class' => 'btn-printer btn',
							'data-url' => $print_url
						]);
					}
	 				break;
	 			
	 			default:
	 				# code...
	 				break;
	 		}
 		}

 		return implode(' ', $buttons);
 	}


 	public function link($params)
 	{

 		$url = $params['link'][0];
 		$controller = explode('/', $url)[0];
 		$action = explode('/', $url)[1];
 		$options = isset($params['options']) ? $params['options']: NULL;


 		if ($this->user_can($action, $controller)) {
 			return \yii\helpers\Html::a($params['title'], $params['link'], $options);
 		}

 	}


 	public function findAction()
 	{
 		$action = Yii::$app->controller->action->id;
 		
        $action = 'can' . Inflector::id2camel($action);

        return $action;
 	}


 	public function filter($query='')
	{
		if (Yii::$app->user->identity->roleAccess) {
			if ($query) {
            	$query->where(['u.role_id' => Yii::$app->user->identity->roleAccess]);  
			}
			else {
            	return ['u.role_id' => Yii::$app->user->identity->roleAccess];
			}
        }
        else {
			if ($query) {
            	$query->where(['u.id' => Yii::$app->user->identity->id]);
			}
			else {
            	return ['u.id' => Yii::$app->user->identity->id];
			}
        }
	}


}
<?php
namespace app\components;

use Yii; 
use yii\helpers\Html;
use yii\helpers\Url;


/**
 * 
 */
class Template extends \yii\base\Component
{
 
 	public function checkSubMenuAccess($controllers)
 	{
 		foreach ($controllers as $controller) {
	 		if (Yii::$app->permission->user_can('index', $controller)) {
	 			return true;
	 		}
 		}
 		return false;
 	}

 	public function createSidebar($access="")
	{ 
		foreach ($access as $key => $menu) { 
			$menu['title'] = isset($menu['title']) ? $menu['title']: '';
			$link = explode('/', $key);
			$controller = $link[0];
			$action = isset($link[1]) ? $link[1]: 'index';

			if($menu['title']) { 
				$sharp_key = (strpos($key, '#') !== false ) ? true: false;
				if(isset($menu['sub']) && !empty($menu['sub'])) { 
					
					$keys = array_keys($menu['sub']);

					$open = in_array(Yii::$app->controller->id, $keys) ? 'open': "";

					if ($this->checkSubMenuAccess($keys)) {

						echo '<li class="nav-item nav-dropdown '. $open .'">';
							if (Yii::$app->permission->user_can($action, $controller)  || $sharp_key) {
								echo Html::a('<i class="nav-icon '.$menu['icon'].'"></i> ' . ucwords(str_replace("-", " ", $menu['title'])),
									($sharp_key)? $key: [$controller . '/' . $action], 
									['class' => 'nav-link nav-dropdown-toggle']
								); 
							}

							echo '<ul class="nav-dropdown-items">';
								$this->createSidebar($menu['sub']);
							echo'</ul>';
						echo '</li>'; 
					}

				} else { 
					echo '<li class="nav-item">';
					if (Yii::$app->permission->user_can($action, $controller)) {

						echo Html::a('<i class="nav-icon '.$menu['icon'].'"></i> ' . ucwords(str_replace("-", " ", $menu['title'])),
								($sharp_key)? $key: [$controller . '/' . $action], 
								['class' => (Yii::$app->controller->id == $key)? 'nav-link active': 'nav-link']
							);
					}
					echo '</li>'; 
				} 
			} 
		} 

	}

 
 
 

}
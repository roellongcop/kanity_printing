<?php
namespace app\components;

use Yii;
use app\models\Setting;
use app\models\Notification;
use app\models\User;

/**
 * 
 */
class Kanity extends \yii\base\Component
{

	public function notify($model, $params=[])
	{
		$action  = isset($params['action']) ? $params['action']: 'view';
		$user_id = isset($params['user_id']) ? $params['user_id']: '';
		$message = isset($params['message']) ? $params['message']: '';
		$controller = isset($params['controller']) ? $params['controller']: Yii::$app->controller->id;


		$setting    = Yii::$app->general->setting();

		$notification_pages = json_decode($setting['notification_pages'], true);

		if (isset($notification_pages[$controller]) && $model) {
			$np = $notification_pages[$controller];

			if (!Yii::$app->user->isGuest) {
				$user    = isset($params['user']) ? $params['user']: Yii::$app->user->identity;
				$users = User::find()
					->where(['role_id' => $np['roles']])
					->andWhere(['status'  => 1])
					->andWhere(['<>', 'id',  $user->id])
					->andWhere(['<>', 'id',  $user_id])
					->all();
			}
			else {
				$users = User::find()
					->where(['role_id' => $np['roles']])
					->andWhere(['status'  => 1])
					->all();
			}
			


			if ($users) {
				foreach ($users as $u) {
					$notification = new Notification();
					$notification->user_id = $u->id;
					$notification->ref_id = $model->id;
					$notification->message = $message;
					$notification->controller = $controller;
					$notification->action = $action;
					$notification->save();
				}
			}
		}

		$notification = new Notification();
		$notification->user_id = $user_id;
		$notification->ref_id = $model->id;
		$notification->message = $message;
		$notification->controller = $controller;
		$notification->action = $action;
		$notification->save();
	}
 

}
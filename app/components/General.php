<?php
namespace app\components;

use Yii;
use app\models\Setting;
use app\models\Log;
use app\models\Quotation;
use app\models\JobOrder;

/**
 * 
 */
class General extends \yii\base\Component
{

	public function logo()
	{
		$setting = $this->setting();

		return $this->file_path($setting['company_logo']);
	}
	public function file_path($src)
	{
        return Yii::$app->urlManager->baseUrl . '/' . $src;
	}

	public function setting($attr='')
	{
		$model = Setting::find()
			->where(['status' => 1])
			->asArray()
			->one();

		if ($model) {
			if ($attr) {
				return $model[$attr];
			}
			return $model;
		}

		if ($attr) {
			return Yii::$app->params['default'][$attr];
		}
		return Yii::$app->params['default'];
	}


	public function date_timezone($rdate, $format='Y-m-d h:i:s A', $timezone_string="")
	{
		if ($timezone_string == "") {
			$timezone_string = $this->setting('timezone');
		}

		$usersTimezone = new \DateTimeZone($timezone_string);
		$l10nDate = new \DateTime($rdate);
		$l10nDate->setTimeZone($usersTimezone);

		return $l10nDate->format($format);
	}
	 
 
 	public function log($model, $changeAttribute=[])
 	{
        if (!Yii::$app->user->isGuest) {

        	$model_name = explode("\\", $model::className());
 		
	 		$agent = Yii::$app->agent;
	 		$user = Yii::$app->user->identity;

	 		$log = new Log();
	 		$log->request_data = (Yii::$app->request->getBodyParams()) ? Yii::$app->request->getBodyParams() : [];
	        $log->method = Yii::$app->request->getMethod();
	        $log->url = Yii::$app->getRequest()->getAbsoluteUrl();
	 		$log->user_id = $user->id;
	 		$log->ref_id = $model->id;
	 		$log->action = Yii::$app->controller->action->id;
	 		$log->controller = Yii::$app->controller->id;
	 		$log->model = end($model_name);
	 		$log->user_agent = $agent->userAgent();
	 		$log->ip = $agent->userIp();
	 		$log->browser = $agent->browser();
	 		$log->os = $agent->os();
	 		$log->device = $agent->device();
	 		$log->change_attribute = $changeAttribute;
	 		$log->save();
	 	}
 	}


 	public function createFolder($data=[], $path='')
	{

		foreach ($data as $folder) {
			$path = $path . $folder . '/';

	        if ( ! is_dir($path) ) {
	            mkdir($path); 
	        } 
		}
		
	    return $path;
	}


	public function pluralize( $count, $text )
	{
		return $count . ( ( $count == 1 ) ? ( " $text" ) : ( " $text"."s" ) );
	}

	public function ago( $datetime )
	{
		// live
		$today = new \DateTime('now'); 

		//local
		// $today = new \DateTime($this->date_timezone(date('Y-m-d H:i:s') ,'Y-m-d H:i:s'));



		$datetime = new \DateTime($datetime);
		$interval = $today->diff( $datetime );
		$suffix = ( $interval->invert ? ' ago' : '' );

		if ( $v = $interval->m >= 1 ) return $this->pluralize( $interval->m, 'month' ) . $suffix;
		if ( $v = $interval->d >= 28 ) return $this->pluralize( 4, 'week' ) . $suffix;
		if ( $v = $interval->d >= 21 ) return $this->pluralize( 3, 'week' ) . $suffix;
		if ( $v = $interval->d >= 14 ) return $this->pluralize( 2, 'week' ) . $suffix;
		if ( $v = $interval->d >= 7 ) return $this->pluralize( 1, 'week' ) . $suffix;
		if ( $v = $interval->d >= 1 ) return $this->pluralize( $interval->d, 'day' ) . $suffix;
		if ( $v = $interval->h >= 1 ) return $this->pluralize( $interval->h, 'hour' ) . $suffix;
		if ( $v = $interval->i >= 1 ) return $this->pluralize( $interval->i, 'minute' ) . $suffix;
		else return 'Just now';
	}


 

	public function invoice_num($input='', $pad_len = 5, $prefix = null) 
    {
	    if ($pad_len <= strlen($input))
	        trigger_error('<strong>$pad_len</strong> cannot be less than or equal to the length of <strong>$input</strong> to generate invoice number', E_USER_ERROR);

	    if (is_string($prefix))
	        return sprintf("%s%s", $prefix, str_pad($input, $pad_len, "0", STR_PAD_LEFT));

	    return str_pad($input, $pad_len, "0", STR_PAD_LEFT);
	}


	public function dateDiff($date1, $date2, $format="days")
	{
		
		$date1 = new \DateTime($date1);
		$date2 = new \DateTime($date2);

		$diff = $date1->diff($date2);


		return $diff->$format;
	}

}
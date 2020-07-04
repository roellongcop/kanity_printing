<?php

namespace app\components;
 
use Yii;
use yii\base\Component; 
use yii\helpers\FileHelper;
use yii\helpers\Inflector; 

class AgentInfo extends Component
{

	 
	public function userIp()
	{
		return Yii::$app->request->getUserIp();
	}
	
	public function userAgent()
	{
		return Yii::$app->request->getUserAgent();
	}
	public function browser(){  
		$browsers = [
			'/firefox/i' 	=> 'Firefox',
			'/safari/i'  	=> 'Safari',
			'/chrome/i'  	=> 'Chrome',
			'/opr/i'     	=> 'Opera',
			'/opera/i'   	=> 'Opera',
			'/edge/i'    	=> 'Edge',
			'/ie/i'      	=> 'Internet Explorer',
			'/trident/i' 	=> 'Internet Explorer',
			'/net/i'     	=> 'Internet Explorer',
			'/ucbrowser/i'  => 'UC Browser',
			'/brave/i' 	    => 'Brave',
			'/duckduckgo/i' => 'Duckduck Go',
		];

		$notFound = "Browser not detected";

		foreach ($browsers as $key => $value) { 
			preg_match($key, $this->userAgent(), $browserMatch); 
				if($browserMatch){
					$browser[] = $value;
				}
		}

		if($browser != null){
			$browserName = end($browser);
		}else{
			$browserName = $notFound;
		}
 
		return $browserName;
	}

	public function os(){   
		$os = [
			'/mac os/i'  => 'MacOS',
			'/android/i' => 'Android',
			'/linux/i'   => 'Linux',
			'/ubuntu/i'  => 'MacOS',
			'/windows/i' => 'Windows',
			'/win/i'     => 'Windows',
			'/iphone/i'  => 'iOS',
		];

		$notFound = "OS not detected";

		foreach ($os as $key => $value) {
			preg_match($key, $this->userAgent(), $osMatch);  
				if($osMatch){
					$osList[] = $value;
				}
		}

		if($osList != null){
			$osName = isset($osList[0]) ? $osList[0]: '';
		}else{
			$osName = $notFound;
		}		
 
		return $osName;
	}

	public function device(){
		$devicesTypes = [
	        "Computer" => ["msie 10", "msie 9", "msie 8", "windows.*firefox", "windows.*chrome", "x11.*chrome", "x11.*firefox", "macintosh.*chrome", "macintosh.*firefox", "opera"],
	        "Tablet"   => ["tablet", "android", "ipad", "tablet.*firefox"],
	        "Mobile"   => ["mobile ", "android.*mobile", "iphone", "ipod", "opera mobi", "opera mini"],
	        "Bot"      => ["googlebot", "mediapartners-google", "adsbot-google", "duckduckbot", "msnbot", "bingbot", "ask", "facebook", "yahoo", "addthis"]
	    ];

	    foreach ($devicesTypes as $key => $devices) {
	    	foreach ($devices as $key1 => $value) {
	    		if(preg_match("/".$value."/i", $this->userAgent())){
	    			$device = $key;
	    		} 
	    	}
	    }

	    return $device;
	}
}

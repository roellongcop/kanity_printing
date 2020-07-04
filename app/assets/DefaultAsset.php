<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main application asset bundle.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class DefaultAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web/app/assets/frontend/';
    public $css = [
        'css/bootstrap.min.css',
        'shortcodes/shortcodes.css',
        'css/magnific-popup.css',
        'css/style.css'
    ];
    public $js = [
        // 'js/jquery.min.js',
        'js/jquery.mixitup.min.js',
        'js/jquery.magnific-popup.js',
        'js/bootstrap.min.js',
        'js/custom.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        // 'yii\bootstrap\BootstrapAsset',
    ];
}

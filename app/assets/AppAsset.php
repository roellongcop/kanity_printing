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
class AppAsset extends AssetBundle
{
    /*
    // PUBLISH
    public $sourcePath = '@app/assets/admin'; //location of the original assetsfiles
    public $baseUrl = '@web'; //location of the generated assetsfiles
    */

    
    
    // DEV
    public $basePath = '@webroot'; //rootfolder
    public $baseUrl = '@web/app/assets/admin/'; //location of the original assetsfiles
    



    public $css = [
        'node_modules/@coreui/icons/css/coreui-icons.min.css',
        'node_modules/flag-icon-css/css/flag-icon.min.css',
        'node_modules/font-awesome/css/font-awesome.min.css',
        'node_modules/simple-line-icons/css/simple-line-icons.css',
        
        'summernote/dist/summernote-bs4.css',

        'sweetalert/sweetalert.css',
        
        //Main styles for this application
        'vendors/pace-progress/css/pace.min.css',
        'js/jquery-ui/jquery-ui.css',
        'daterangepicker/daterangepicker.css',
        'select2/select2.min.css',
        'css/awesome-bootstrap-checkbox.css',
        'icheck/icheck.css',
        'css/style.css',
        'css/custom.css',
        
    ];
    public $js = [
        //CoreUI and necessary plugins
        // 'node_modules/jquery/dist/jquery.min.js',
        'node_modules/popper.js/dist/umd/popper.min.js',
        'node_modules/bootstrap/dist/js/bootstrap.min.js',
        'node_modules/pace-progress/pace.min.js',
        'node_modules/perfect-scrollbar/dist/perfect-scrollbar.min.js',
        'node_modules/@coreui/coreui/dist/js/coreui.min.js',
        'js/moment.min.js',

        'summernote/dist/summernote-bs4.js',
         
        //Plugins and scripts required by this view
        'node_modules/chart.js/dist/Chart.min.js',
        'node_modules/@coreui/coreui-plugin-chartjs-custom-tooltips/dist/js/custom-tooltips.min.js',

        'sweetalert/sweetalert.min.js',
        'js/jquery-ui/jquery-ui.js',
        'daterangepicker/daterangepicker.js',
        'select2/select2.full.min.js',
        'icheck/icheck.min.js',
        'js/printThis.js',
        'js/vue.min.js',
        // 'js/charts.js',
        'js/main.js',
        'js/custom.js',

    ];
    public $depends = [
        'yii\web\YiiAsset',
        // 'yii\bootstrap\BootstrapAsset',
    ];
}

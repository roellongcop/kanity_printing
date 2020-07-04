<?php

namespace app\controllers;

use Yii;
use app\models\search\QuotationSearch;
use app\models\search\PurchaseOrderSearch;
use app\models\search\JobOrderSearch;
use app\models\search\BaseStockSearch;

use app\models\Quotation;
use app\models\PurchaseOrder;
use app\models\JobOrder;
use app\models\BaseStock;


class DashboardController extends \yii\web\Controller
{
	public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    public function actionIndex($year='')
    {
        $year = ($year) ? $year: date('Y');

        $data = [
            'quotation' => [
                'pending'         => QuotationSearch::count(0, $year),
                'quoted'          => QuotationSearch::count(1, $year),
                'no_bid'          => QuotationSearch::count(2, $year),
                'cancelled'       => QuotationSearch::count(3, $year),
                'purchased_order' => QuotationSearch::count(4, $year),
            ],
            'purchase_order' => [
                'pending'    => PurchaseOrderSearch::count(0, $year),
                'job_order'  => PurchaseOrderSearch::count(1, $year),
                'partial'    => PurchaseOrderSearch::count(2, $year),
                'completed'  => PurchaseOrderSearch::count(3, $year),
                'cancelled'  => PurchaseOrderSearch::count(4, $year),
            ],

            'job_order' => [
                'pending'    => JobOrderSearch::count(0, $year),
                'unserved'   => JobOrderSearch::count(1, $year),
                'partial'    => JobOrderSearch::count(2, $year),
                'completed'  => JobOrderSearch::count(3, $year),
                'cancelled'  => JobOrderSearch::count(4, $year),
            ],
            'base_stock' =>  [
                'out_of_stock' => BaseStockSearch::count(0, $year),
                'safe'         => BaseStockSearch::count(1, $year),
                'critical'     => BaseStockSearch::count(2, $year),
                'exceed'       => BaseStockSearch::count(3, $year),
            ],
            'year' => $year,
            'date_range' => date('Y-m-d', strtotime($year . '-01-31')) . ' - ' . date('Y-m-d', strtotime($year . '-12-31'))
        ];


        return $this->render('index', $data);
    }


    public function actionChart($year='')
    {
        $year = ($year) ? $year: date('Y');

    	$labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];


        $data = [];

        for ($month=1; $month <= 12 ; $month++) { 

            $data['q_data'][] = Quotation::find()
                ->alias('q')
                ->where(Yii::$app->permission->filter())
                ->andWhere(['MONTH(q.created_at)' => $month])
                ->andWhere(['YEAR(q.created_at)' => $year])
                ->andWhere(['q.status' => 1])
                ->joinWith('user u')
                ->count();

            $data['po_data'][] = PurchaseOrder::find()
                ->alias('pu')
                ->where(Yii::$app->permission->filter())
                ->andWhere(['MONTH(pu.created_at)' => $month])
                ->andWhere(['YEAR(pu.created_at)' => $year])
                ->andWhere(['pu.status' => 1])
                ->joinWith('user u')
                ->count();

            $data['jo_data'][] = JobOrder::find()
                ->alias('jo')
                ->where(Yii::$app->permission->filter())
                ->andWhere(['MONTH(jo.created_at)' => $month])
                ->andWhere(['YEAR(jo.created_at)' => $year])
                ->andWhere(['jo.status' => 1])
                ->joinWith('user u')
                ->count();

            $data['stock_data'][] = BaseStock::find()
                ->andWhere(['MONTH(created_at)' => $month])
                ->andWhere(['YEAR(created_at)' => $year])
                ->andWhere(['status' => 1])
                ->count();
        }
 

    	return json_encode([
    		'labels' => $labels,
    		'data' => $data
    	]);
    }

}

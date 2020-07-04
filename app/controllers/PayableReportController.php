<?php
namespace app\controllers;

use Yii;
use app\models\Payable;
use app\models\OfficialReceipt;
use yii\helpers\ArrayHelper;

class PayableReportController extends \yii\web\Controller
{
	/**
     * {@inheritdoc}
     */
        
    public function behaviors()
    {
        return Yii::$app->permission->behaviors();
    }

    protected function data($date_range='')
    {
        $start = '';
        $end = '';

        if ($date_range) {
            $_date_range = explode(" - ", $date_range);
            $start = date('Y-m-d', strtotime($_date_range[0]));
            $end = date('Y-m-d', strtotime($_date_range[1]));
        }

        $payables = Payable::find()
            ->where(['status' => 1])
            ->andFilterWhere(['BETWEEN', 'date_paid', $start, $end])
            ->orderBy(['date_paid' => SORT_ASC])
            ->asArray()
            ->all();

        $total_payables = round(array_sum(array_values(ArrayHelper::map($payables, 'id', 'amount'))), 2);


        $receivables = OfficialReceipt::find()
            ->alias('or')
            ->select(['or.*', 'si.total AS total', 'si.no AS si_no'])
            ->where(['si.payment_status' => 1, 'or.status' => 1])
            ->andFilterWhere(['BETWEEN', 'or.date', $start, $end])
            ->joinWith('salesInvoice si')
            ->orderBy(['or.date' => SORT_ASC])
            ->asArray()
            ->all();

        $total_receivables = round(array_sum(array_values(ArrayHelper::map($receivables, 'id', 'total'))), 2);

        $income = round($total_receivables - $total_payables, 2);

        return [
            'income'            => $income,
            'start'             => $start,
            'end'               => $end,
            'date_range'        => $date_range,
            'payables'          => $payables,
            'total_payables'    => $total_payables,
            'receivables'       => $receivables,
            'total_receivables' => $total_receivables,
        ];
    }

    public function actionIndex($date_range='')
    {
        if ($date_range == '') {
            $date = Yii::$app->general->date_timezone(date('Y-m-d H:i:s'), 'm/d/Y');
            $date_range = $date . ' - ' . $date;

            return $this->redirect(['index', 'date_range' => $date_range]);
        }
        return $this->render('index', $this->data($date_range));
    }

    public function actionPrint($date_range='')
    {
        $this->layout = 'print';
        
        return $this->render('print', $this->data($date_range));
    }

   
}

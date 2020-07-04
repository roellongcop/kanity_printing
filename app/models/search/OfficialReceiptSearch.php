<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\OfficialReceipt;
use yii\helpers\ArrayHelper;

/**
 * OfficialReceiptSearch represents the model behind the search form of `app\models\OfficialReceipt`.
 */
class OfficialReceiptSearch extends OfficialReceipt
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $salesInvoiceNo;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'sales_invoice_id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['no', 'created_at', 'updated_at', 'date', 'received_from', 'tin', 'address', 'business_style', 'sum_of', 'payment_for', 'cashier'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'salesInvoiceNo'], 'safe'],

        ];
    }

    public function init()
    {
        $this->status = 1;
        $this->pagination = Yii::$app->general->setting('pagination');
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }



    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = OfficialReceipt::find()
            ->alias('or');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);

        $dataProvider->sort->attributes['salesInvoiceNo'] = [
            'asc' => ['si.no' => SORT_ASC],
            'desc' => ['si.no' => SORT_DESC],
        ];


        Yii::$app->permission->filter($query);



        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'or.id' => $this->id,
            'or.sales_invoice_id' => $this->sales_invoice_id,
            'or.created_by' => $this->created_by,
            'or.updated_by' => $this->updated_by,
            'or.status' => $this->status,
            'or.created_at' => $this->created_at,
            'or.updated_at' => $this->updated_at,
            'or.date' => $this->date,
        ]);
        
        $query->andFilterWhere(['like', 'or.no', $this->no])
            ->andFilterWhere(['like', 'or.received_from', $this->received_from])
            ->andFilterWhere(['like', 'or.tin', $this->tin])
            ->andFilterWhere(['like', 'or.address', $this->address])
            ->andFilterWhere(['like', 'or.business_style', $this->business_style])
            ->andFilterWhere(['like', 'or.sum_of', $this->sum_of])
            ->andFilterWhere(['like', 'or.payment_for', $this->payment_for])
            ->andFilterWhere(['like', 'or.cashier', $this->cashier]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'or.no', $this->keywords],  
                ['like', 'or.received_from', $this->keywords],  
                ['like', 'or.tin', $this->keywords],  
                ['like', 'or.address', $this->keywords],  
                ['like', 'or.business_style', $this->keywords],  
                ['like', 'or.sum_of', $this->keywords],  
                ['like', 'or.payment_for', $this->keywords],  
                ['like', 'or.cashier', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(or.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('salesInvoice si');
        $query->joinWith('user u');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = OfficialReceipt::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }


    public static function dropdown($key='id', $value='id', $andFilterWhere=[], $map=true)
    {
        $models = OfficialReceipt::find()
            ->where(['status' => 1])
            ->andFilterWhere($andFilterWhere)
            ->orderBy(['name' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, $key, $value);
        }

        return $models;
    }


    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = OfficialReceipt::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

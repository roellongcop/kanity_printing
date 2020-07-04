<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\SalesInvoice;
use yii\helpers\ArrayHelper;

/**
 * SalesInvoiceSearch represents the model behind the search form of `app\models\SalesInvoice`.
 */
class SalesInvoiceSearch extends SalesInvoice
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $purchaseOrderNo;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'purchase_order_id', 'created_by', 'updated_by', 'status', 'payment_status'], 'integer'],
            [['created_at', 'updated_at', 'no', 'pickup_date', 'prepared_by', 'noted_by', 'company_name', 'company_address', 'contact_person'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'purchaseOrderNo'], 'safe'],

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
        $query = SalesInvoice::find()
            ->alias('si');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);

        $dataProvider->sort->attributes['purchaseOrderNo'] = [
            'asc' => ['pu.po_no' => SORT_ASC],
            'desc' => ['pu.po_no' => SORT_DESC],
        ];


        Yii::$app->permission->filter($query);



        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'si.id' => $this->id,
            'si.purchase_order_id' => $this->purchase_order_id,
            'si.created_by' => $this->created_by,
            'si.updated_by' => $this->updated_by,
            'si.status' => $this->status,
            'si.created_at' => $this->created_at,
            'si.updated_at' => $this->updated_at,
            'si.pickup_date' => $this->pickup_date,
            'si.payment_status' => $this->payment_status,
        ]);
        
        $query->andFilterWhere(['like', 'si.no', $this->no])
            ->andFilterWhere(['like', 'si.prepared_by', $this->prepared_by])
            ->andFilterWhere(['like', 'si.noted_by', $this->noted_by])
            ->andFilterWhere(['like', 'si.company_name', $this->company_name])
            ->andFilterWhere(['like', 'si.company_address', $this->company_address])
            ->andFilterWhere(['like', 'si.company_address', $this->company_address])
            ->andFilterWhere(['like', 'pu.po_no', $this->purchaseOrderNo]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'pu.po_no', $this->keywords],  
                ['like', 'si.no', $this->keywords],  
                ['like', 'si.pickup_date', $this->keywords],  
                ['like', 'si.prepared_by', $this->keywords],  
                ['like', 'si.noted_by', $this->keywords],  
                ['like', 'si.company_name', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(si.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('purchaseOrder pu');
        $query->joinWith('user u');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = SalesInvoice::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }


    public static function dropdown($key='id', $value='no', $andFilterWhere=[], $map=true)
    {
        $models = SalesInvoice::find()
            ->where(['status' => 1])
            ->andFilterWhere($andFilterWhere)
            ->orderBy(['no' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, $key, $value);
        }

        return $models;
    }



    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = SalesInvoice::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

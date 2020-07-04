<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\PurchaseOrder;
use yii\helpers\ArrayHelper;

/**
 * PurchaseOrderSearch represents the model behind the search form of `app\models\PurchaseOrder`.
 */
class PurchaseOrderSearch extends PurchaseOrder
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $quotationNo;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'quotation_id', 'created_by', 'updated_by', 'status', 'quantity', ], 'integer'],
            [['po_no', 'customer_note', 'created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'quotationNo', 'process_status','served_quantity' ,'pending_quantity'], 'safe'],

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
        $query = PurchaseOrder::find()
            ->alias('pu');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);


        $dataProvider->sort->attributes['quotationNo'] = [
            'asc' => ['q.quotation_no' => SORT_ASC],
            'desc' => ['q.quotation_no' => SORT_DESC],
        ];

        Yii::$app->permission->filter($query);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'pu.id' => $this->id,
            'pu.quantity' => $this->quantity,
            'pu.served_quantity' => $this->served_quantity,
            'pu.pending_quantity' => $this->pending_quantity,
            'pu.process_status' => $this->process_status,
            'pu.quotation_id' => $this->quotation_id,
            'pu.created_by' => $this->created_by,
            'pu.updated_by' => $this->updated_by,
            'pu.status' => $this->status,
            'pu.created_at' => $this->created_at,
            'pu.updated_at' => $this->updated_at,
        ]);
        
        $query->andFilterWhere(['like', 'pu.po_no', $this->po_no])
            ->andFilterWhere(['like', 'pu.customer_note', $this->customer_note]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'q.quotation_no', $this->keywords],  
                ['like', 'pu.po_no', $this->keywords],  
                ['like', 'pu.customer_note', $this->keywords],  
                ['like', 'pu.quantity', $this->keywords],  
                ['like', 'pu.served_quantity', $this->keywords],  
                ['like', 'pu.pending_quantity', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(pu.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('quotation q');
        $query->joinWith('user u');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = PurchaseOrder::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }


    public static function dropdown($andFilterWhere=[], $map=true)
    {
        $models = PurchaseOrder::find()
            ->where(['status' => 1])
            ->andFilterWhere($andFilterWhere)
            ->orderBy(['po_no' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'po_no');
        }

        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = PurchaseOrder::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }


    public static function count($process_status, $year='')
    {
        $model = PurchaseOrder::find()
            ->alias('pu')
            ->where(Yii::$app->permission->filter())
            ->andWhere(['pu.process_status' => $process_status])
            ->andWhere(['pu.status' => 1])
            ->andFilterWhere(['YEAR(pu.created_at)' => $year])
            ->joinWith('user u')
            ->count();

        return $model;
    }
}

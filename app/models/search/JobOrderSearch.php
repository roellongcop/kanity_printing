<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\JobOrder;
use yii\helpers\ArrayHelper;

/**
 * JobOrderSearch represents the model behind the search form of `app\models\JobOrder`.
 */
class JobOrderSearch extends JobOrder
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $purchaseOrderNo;
    public $quotationNo;



    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'purchase_order_id', 'created_by', 'updated_by', 'process_status', 'status'], 'integer'],
            [['jo_no', 'note', 'created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'purchaseOrderNo', 'quotationNo', 'served_quantity' ,'pending_quantity'], 'safe'],

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
        $query = JobOrder::find()
            ->alias('jo');

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
            'jo.id' => $this->id,
            'jo.served_quantity' => $this->served_quantity,
            'jo.pending_quantity' => $this->pending_quantity,
            'jo.purchase_order_id' => $this->purchase_order_id,
            'jo.created_by' => $this->created_by,
            'jo.updated_by' => $this->updated_by,
            'jo.process_status' => $this->process_status,
            'jo.status' => $this->status,
            'jo.created_at' => $this->created_at,
            'jo.updated_at' => $this->updated_at,
        ]);
        
        $query->andFilterWhere(['like', 'jo.jo_no', $this->jo_no])
            ->andFilterWhere(['like', 'jo.note', $this->note]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'q.quotation_no', $this->keywords],  
                ['like', 'pu.po_no', $this->keywords],  
                ['like', 'jo.jo_no', $this->keywords],  
                ['like', 'jo.note', $this->keywords],  
                ['like', 'jo.served_quantity', $this->keywords],  
                ['like', 'jo.pending_quantity', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(jo.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('purchaseOrder pu');
        $query->joinWith('quotation q');
        $query->joinWith('user u');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = JobOrder::find()
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
        $models = JobOrder::find()
            ->where(['status' => 1])
            ->andFilterWhere($andFilterWhere)
            ->orderBy(['jo_no' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'jo_no');
        }

        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = JobOrder::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }

    public static function count($process_status, $year='')
    {
        $model = JobOrder::find()
            ->alias('jo')
            ->where(Yii::$app->permission->filter())
            ->andWhere(['jo.process_status' => $process_status])
            ->andWhere(['jo.status' => 1])
            ->andFilterWhere(['YEAR(jo.created_at)' => $year])
            ->joinWith('user u')
            ->count();

        return $model;
    }
}

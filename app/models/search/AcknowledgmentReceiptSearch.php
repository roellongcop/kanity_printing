<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\AcknowledgmentReceipt;
use yii\helpers\ArrayHelper;

/**
 * AcknowledgmentReceiptSearch represents the model behind the search form of `app\models\AcknowledgmentReceipt`.
 */
class AcknowledgmentReceiptSearch extends AcknowledgmentReceipt
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
            [['id', 'purchase_order_id', 'quantity', 'delivery_status', 'created_by', 'updated_by', 'status'], 'integer'],
            [['delivery_date', 'particular', 'created_at', 'updated_at'], 'safe'],
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
        $query = AcknowledgmentReceipt::find()
            ->alias('ar');

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
            'ar.id' => $this->id,
            'ar.purchase_order_id' => $this->purchase_order_id,
            'ar.quantity' => $this->quantity,
            'ar.delivery_date' => $this->delivery_date,
            'ar.delivery_status' => $this->delivery_status,
            'ar.created_by' => $this->created_by,
            'ar.updated_by' => $this->updated_by,
            'ar.status' => $this->status,
            'ar.created_at' => $this->created_at,
            'ar.updated_at' => $this->updated_at,
        ]);
        
        $query->andFilterWhere(['like', 'ar.particular', $this->particular]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'pu.po_no', $this->keywords],  
                ['like', 'ar.particular', $this->keywords],  
                ['like', 'ar.quantity', $this->keywords],  
                ['like', 'ar.delivery_date', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(ar.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
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
        $model = AcknowledgmentReceipt::find()
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
        $models = AcknowledgmentReceipt::find()
            ->where(['status' => 1])
            ->andFilterWhere($andFilterWhere)
            ->orderBy(['name' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'name');
        }

        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = AcknowledgmentReceipt::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

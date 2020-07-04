<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\BaseStockIssue;
use yii\helpers\ArrayHelper;

/**
 * BaseStockIssueSearch represents the model behind the search form of `app\models\BaseStockIssue`.
 */
class BaseStockIssueSearch extends BaseStockIssue
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $stockName;
    public $username;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'base_stock_id', 'user_id', 'created_by', 'updated_by', 'status', 'quantity'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'stockName', 'username'], 'safe'],

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
        $query = BaseStockIssue::find()
            ->alias('bi');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);


        $dataProvider->sort->attributes['stockName'] = [
            'asc' => ['b.name' => SORT_ASC],
            'desc' => ['b.name' => SORT_DESC],
        ];

        $dataProvider->sort->attributes['username'] = [
            'asc' => ['u.username' => SORT_ASC],
            'desc' => ['u.username' => SORT_DESC],
        ];


        //Yii::$app->permission->filter($query);



        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'bi.id' => $this->id,
            'bi.base_stock_id' => $this->base_stock_id,
            'bi.user_id' => $this->user_id,
            'bi.created_by' => $this->created_by,
            'bi.updated_by' => $this->updated_by,
            'bi.status' => $this->status,
            'bi.created_at' => $this->created_at,
            'bi.updated_at' => $this->updated_at,
            'bi.quantity' => $this->quantity,
        ]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'u.username', $this->keywords],  
                ['like', 'b.name', $this->keywords],  
                ['like', 'bi.quantity', $this->keywords],  
                ['like', 'bi.created_at', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(bi.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }


        $query->joinWith('baseStock b');
        $query->joinWith('user u');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = BaseStockIssue::find()
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
        $models = BaseStockIssue::find()
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
        $models = BaseStockIssue::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\BaseStock;
use yii\helpers\ArrayHelper;

/**
 * BaseStockSearch represents the model behind the search form of `app\models\BaseStock`.
 */
class BaseStockSearch extends BaseStock
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $categoryName;
    public $unit;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'base_stock_category_id', 'base_stock_unit_id', 'created_by', 'updated_by', 'status', 'max_stock', 'min_stock', 'current_stock'], 'integer'],
            [['created_at', 'updated_at', 'name', 'description'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'categoryName', 'unit', 'stock_status'], 'safe'],

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
        $query = BaseStock::find()
            ->alias('b');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);


        $dataProvider->sort->attributes['categoryName'] = [
            'asc' => ['bc.name' => SORT_ASC],
            'desc' => ['bc.name' => SORT_DESC],
        ];

        $dataProvider->sort->attributes['unit'] = [
            'asc' => ['bu.name' => SORT_ASC],
            'desc' => ['bu.name' => SORT_DESC],
        ];


        //Yii::$app->permission->filter($query);



        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'b.id' => $this->id,
            'b.base_stock_category_id' => $this->base_stock_category_id,
            'b.base_stock_unit_id' => $this->base_stock_unit_id,
            'b.created_by' => $this->created_by,
            'b.updated_by' => $this->updated_by,
            'b.status' => $this->status,
            'b.created_at' => $this->created_at,
            'b.updated_at' => $this->updated_at,
            'b.max_stock' => $this->max_stock,
            'b.min_stock' => $this->min_stock,
            'b.current_stock' => $this->current_stock,
            'b.stock_status' => $this->stock_status,
        ]);
        
        $query->andFilterWhere(['like', 'b.name', $this->name])
            ->andFilterWhere(['like', 'b.description', $this->description]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'b.name', $this->keywords],  
                ['like', 'b.description', $this->keywords],  
                ['like', 'b.current_stock', $this->keywords],  
                ['like', 'bc.name', $this->keywords],  
                ['like', 'bu.name', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(b.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('baseStockCategory bc');
        $query->joinWith('baseStockUnit bu');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = BaseStock::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }


    public static function dropdown($key='id', $value='name', $andFilterWhere=[], $map=true)
    {
        $models = BaseStock::find()
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
        $models = BaseStock::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }

    public static function count($stock_status, $year='')
    {
        $model = BaseStock::find()
            ->alias('bs')
            ->where(['bs.stock_status' => $stock_status])
            ->andWhere(['bs.status' => 1])
            ->andFilterWhere(['YEAR(bs.created_at)' => $year])
            ->count();

        return $model;
    }
}

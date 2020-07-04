<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Product;
use yii\helpers\ArrayHelper;

/**
 * ProductSearch represents the model behind the search form of `app\models\Product`.
 */
class ProductSearch extends Product
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $serviceName;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'service_id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['name', 'tag_line', 'description', 'image', 'created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'serviceName'], 'safe'],

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
        $query = Product::find()
            ->alias('pr');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);


        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $dataProvider->sort->attributes['serviceName'] = [
            'asc' => ['sv.name' => SORT_ASC],
            'desc' => ['sv.name' => SORT_DESC],
        ];

        // grid filtering conditions
        $query->andFilterWhere([
            'pr.id' => $this->id,
            'pr.service_id' => $this->service_id,
            'pr.created_by' => $this->created_by,
            'pr.updated_by' => $this->updated_by,
            'pr.status' => $this->status,
            'pr.created_at' => $this->created_at,
            'pr.updated_at' => $this->updated_at,
        ]);
        
        $query->andFilterWhere(['like', 'pr.name', $this->name])
            ->andFilterWhere(['like', 'pr.tag_line', $this->tag_line])
            ->andFilterWhere(['like', 'pr.description', $this->description]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'sv.name', $this->keywords],  
                ['like', 'pr.name', $this->keywords],  
                ['like', 'pr.tag_line', $this->keywords],  
                ['like', 'pr.description', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(pr.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('service sv');


        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = Product::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }


    public static function dropdown($map=true, $limit='')
    {
        $models = Product::find()
            ->where(['status' => 1])
            ->orderBy(['name' => SORT_ASC])
            ->limit($limit)
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'name');
        }

        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = Product::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

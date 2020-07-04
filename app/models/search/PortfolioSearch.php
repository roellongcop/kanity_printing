<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Portfolio;

/**
 * PortfolioSearch represents the model behind the search form of `app\models\Portfolio`.
 */
class PortfolioSearch extends Portfolio
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $categoryName;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['name', 'description', 'created_at', 'updated_at', 'image'], 'safe'],
            [['keywords', 'categoryName', 'portfolio_category_id', 'pagination', 'date_range'], 'safe'],
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
        $query = Portfolio::find()
            ->alias('po');

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

        $dataProvider->sort->attributes['categoryName'] = [
            'asc' => ['pc.name' => SORT_ASC],
            'desc' => ['pc.name' => SORT_DESC],
        ];

        // grid filtering conditions
        $query->andFilterWhere([
            'po.id' => $this->id,
            'po.portfolio_category_id' => $this->portfolio_category_id,
            'po.created_by' => $this->created_by,
            'po.updated_by' => $this->updated_by,
            'po.status' => $this->status,
            'po.created_at' => $this->created_at,
            'po.updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'po.name', $this->name])
            ->andFilterWhere(['like', 'po.description', $this->description])
            ->andFilterWhere(['like', 'po.image', $this->image]);

        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'po.name', $this->keywords],  
                ['like', 'po.description', $this->keywords],  
                ['like', 'pc.name', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(po.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

 
        $query->joinWith('portfolioCategory pc');

        return $dataProvider;
    }

    public static function one($value, $attr='id', $array=false)
    {
        $model = Portfolio::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }

    public static function dropdown($map=true)
    {
        $models = Portfolio::find()
            ->where(['status' => 1])
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
        $models = Portfolio::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

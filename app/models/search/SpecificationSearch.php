<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Specification;
use yii\helpers\ArrayHelper;

/**
 * SpecificationSearch represents the model behind the search form of `app\models\Specification`.
 */
class SpecificationSearch extends Specification
{
    public $keywords;
    public $date_range;
    public $pagination;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'watermark', 'created_by', 'updated_by', 'status'], 'integer'],
            [['name', 'paper', 'description', 'created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range'], 'safe'],

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
        $query = Specification::find();

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

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'watermark' => $this->watermark,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);
        
        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'paper', $this->paper])
            ->andFilterWhere(['like', 'description', $this->description]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'name', $this->keywords],  
                ['like', 'paper', $this->keywords],  
                ['like', 'description', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = Specification::find()
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
        $models = Specification::find()
            ->where(['status' => 1])
            ->orderBy(['name' => SORT_ASC])
            ->asArray()
            ->all();

        foreach ($models as &$model) {
            $model['name'] = $model['name'] . " - " . $model['paper'] . " (" . Yii::$app->params['watermark'][$model['watermark']] . ")";
        }

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'name');
        }

        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = Specification::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

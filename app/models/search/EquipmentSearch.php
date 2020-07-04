<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Equipment;
use yii\helpers\ArrayHelper;

/**
 * EquipmentSearch represents the model behind the search form of `app\models\Equipment`.
 */
class EquipmentSearch extends Equipment
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
            [['id', 'equipment_category_id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['name', 'tag_line', 'description', 'image', 'created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'categoryName'], 'safe'],

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
        $query = Equipment::find()
            ->alias('e');

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
            'asc' => ['ec.name' => SORT_ASC],
            'desc' => ['ec.name' => SORT_DESC],
        ];


        //Yii::$app->permission->filter($query);



        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'e.id' => $this->id,
            'e.equipment_category_id' => $this->equipment_category_id,
            'e.created_by' => $this->created_by,
            'e.updated_by' => $this->updated_by,
            'e.status' => $this->status,
            'e.created_at' => $this->created_at,
            'e.updated_at' => $this->updated_at,
        ]);
        
        $query->andFilterWhere(['like', 'e.name', $this->name])
            ->andFilterWhere(['like', 'ec.name', $this->tag_line])
            ->andFilterWhere(['like', 'e.tag_line', $this->tag_line])
            ->andFilterWhere(['like', 'e.description', $this->description])
            ->andFilterWhere(['like', 'e.image', $this->image]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'ec.name', $this->keywords],  
                ['like', 'e.name', $this->keywords],  
                ['like', 'e.tag_line', $this->keywords],  
                ['like', 'e.description', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(e.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }
        $query->joinWith('equipmentCategory ec');

        return $dataProvider;
    }

    public static function one($value, $attr='id', $array=false)
    {
        $model = Equipment::find()
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
        $models = Equipment::find()
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
        $models = Equipment::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

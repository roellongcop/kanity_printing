<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Profile;

/**
 * ProfileSearch represents the model behind the search form of `app\models\Profile`.
 */
class ProfileSearch extends Profile
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $fullname;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'status', 'user_id'], 'integer'],
            [['first_name', 'middle_name', 'last_name', 'position', 'company_name', 'company_address', 'tin', 'email', 'contact_number', 'created_at', 'updated_at', 'fullname'], 'safe'],
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
        $query = Profile::find()
            ->alias('p');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);


        $dataProvider->sort->attributes['fullname'] = [
            'asc' => ['p.first_name' => SORT_ASC],
            'desc' => ['p.first_name' => SORT_DESC],
        ];

        Yii::$app->permission->filter($query);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        

        // grid filtering conditions
        $query->andFilterWhere([
            'p.id' => $this->id,
            'p.user_id' => $this->user_id,
            'p.status' => $this->status,
            'p.created_at' => $this->created_at,
            'p.updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'p.first_name', $this->first_name])
            ->andFilterWhere(['like', 'p.middle_name', $this->middle_name])
            ->andFilterWhere(['like', 'p.last_name', $this->last_name])
            ->andFilterWhere(['like', 'p.position', $this->position])
            ->andFilterWhere(['like', 'p.company_name', $this->company_name])
            ->andFilterWhere(['like', 'p.company_address', $this->company_address])
            ->andFilterWhere(['like', 'p.tin', $this->tin])
            ->andFilterWhere(['like', 'p.email', $this->email])
            ->andFilterWhere(['like', 'p.contact_number', $this->contact_number]);

        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'p.first_name', $this->keywords],
                ['like', 'p.middle_name', $this->keywords],
                ['like', 'p.last_name', $this->keywords],
                ['like', 'p.position', $this->keywords],
                ['like', 'p.company_name', $this->keywords],
                ['like', 'p.email', $this->keywords],
                ['like', 'p.contact_number', $this->keywords],
            ]);
        } 

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(p.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('user u');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = Profile::find()
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
        $models = Profile::find()
            ->where(['status' => 1])
            ->orderBy(['first_name' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'first_name');
        }

        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = Profile::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

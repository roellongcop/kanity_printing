<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Log;
use yii\helpers\ArrayHelper;

/**
 * LogSearch represents the model behind the search form of `app\models\Log`.
 */
class LogSearch extends Log
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $username;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'ref_id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['action', 'controller', 'model', 'user_agent', 'ip', 'browser', 'os', 'device', 'created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'username'], 'safe'],

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
        $query = Log::find()
            ->alias('l');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);

        $dataProvider->sort->attributes['username'] = [
            'asc' => ['u.username' => SORT_ASC],
            'desc' => ['u.username' => SORT_DESC],
        ];

        Yii::$app->permission->filter($query);
        


        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        

        // grid filtering conditions
        $query->andFilterWhere([
            'l.id' => $this->id,
            'l.user_id' => $this->user_id,
            'l.ref_id' => $this->ref_id,
            'l.created_by' => $this->created_by,
            'l.updated_by' => $this->updated_by,
            'l.status' => $this->status,
            'l.created_at' => $this->created_at,
            'l.updated_at' => $this->updated_at,
        ]);
        
        $query->andFilterWhere(['like', 'l.action', $this->action])
            ->andFilterWhere(['like', 'l.controller', $this->controller])
            ->andFilterWhere(['like', 'l.model', $this->model])
            ->andFilterWhere(['like', 'l.user_agent', $this->user_agent])
            ->andFilterWhere(['like', 'l.ip', $this->ip])
            ->andFilterWhere(['like', 'l.browser', $this->browser])
            ->andFilterWhere(['like', 'l.os', $this->os])
            ->andFilterWhere(['like', 'l.device', $this->device]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'u.username', $this->keywords],
                ['like', 'l.action', $this->keywords],
                ['like', 'l.controller', $this->keywords],
                ['like', 'l.model', $this->keywords],
                ['like', 'l.user_agent', $this->keywords],
                ['like', 'l.ip', $this->keywords],
                ['like', 'l.browser', $this->keywords],
                ['like', 'l.os', $this->os],
                ['like', 'l.device', $this->keywords], 
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(null,date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(l.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
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
        $model = Log::find()
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
        $models = Log::find()
            ->where(['status' => 1])
            ->orderBy(['id' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'id');
        }

        return $models;
    }



    public static function filterBy($attr)
    {
        $models = Log::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $attr);

        return $models;
    }
}

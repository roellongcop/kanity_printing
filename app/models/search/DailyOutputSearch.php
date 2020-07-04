<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\DailyOutput;
use yii\helpers\ArrayHelper;

/**
 * DailyOutputSearch represents the model behind the search form of `app\models\DailyOutput`.
 */
class DailyOutputSearch extends DailyOutput
{
    public $keywords;
    public $date_range;
    public $pagination;
    public $jobOrderNo;


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'job_order_id', 'quantity', 'created_by', 'updated_by', 'status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['keywords', 'pagination', 'date_range', 'jobOrderNo'], 'safe'],

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
        $query = DailyOutput::find()
            ->alias('do');

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);

        $dataProvider->sort->attributes['jobOrderNo'] = [
            'asc' => ['jo.jo_no' => SORT_ASC],
            'desc' => ['jo.jo_no' => SORT_DESC],
        ];



        Yii::$app->permission->filter($query);



        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'do.id' => $this->id,
            'do.job_order_id' => $this->job_order_id,
            'do.quantity' => $this->quantity,
            'do.created_by' => $this->created_by,
            'do.updated_by' => $this->updated_by,
            'do.status' => $this->status,
            'do.created_at' => $this->created_at,
            'do.updated_at' => $this->updated_at,
        ]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'jo.jo_no', $this->keywords],  
                ['like', 'do.quantity', $this->keywords],  
                ['like', 'do.created_at', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(do.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }

        $query->joinWith('jobOrder jo');
        $query->joinWith('user u');

        return $dataProvider;
    }

    public static function one($value, $attr='id', $array=false)
    {
        $model = DailyOutput::find()
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
        $models = DailyOutput::find()
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
        $models = DailyOutput::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

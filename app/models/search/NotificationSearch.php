<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Notification;
use yii\helpers\ArrayHelper;

/**
 * NotificationSearch represents the model behind the search form of `app\models\Notification`.
 */
class NotificationSearch extends Notification
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
            [['id', 'user_id', 'ref_id', 'read_status', 'created_by', 'updated_by', 'status'], 'integer'],
            [['message', 'controller', 'action', 'created_at', 'updated_at'], 'safe'],
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
        $query = Notification::find();

        // add conditions that should always apply here

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC, 'read_status' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);


        //Yii::$app->permission->filter($query);



        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => Yii::$app->user->identity->id,
            'ref_id' => $this->ref_id,
            'read_status' => $this->read_status,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'controller' => $this->controller,
        ]);
        
        $query->andFilterWhere(['like', 'message', $this->message])
            ->andFilterWhere(['like', 'controller', $this->controller])
            ->andFilterWhere(['like', 'action', $this->action]);
        
        
        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'message', $this->keywords],  
                ['like', 'controller', $this->keywords],  
                ['like', 'action', $this->keywords],  
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
        $model = Notification::find()
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
        $models = Notification::find()
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
        $models = Notification::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }

    public static function fetch()
    {
        $pages = Yii::$app->params['notification_pages'];
        $return = [];
        $grand_total = 0;

        foreach ($pages as $key => $page) {
            $total = Notification::find()
                ->where(['user_id' => Yii::$app->user->identity->id])
                ->andWhere(['read_status' => 0])
                ->andWhere(['status' => 1])
                ->andWhere(['controller' => $page['controller']])
                ->count();

            if ($total) {
                $grand_total += $total;
                $return[$key]['controller'] = $page['controller'];
                $return[$key]['title']      = $page['title'];
                $return[$key]['icon']       = $page['icon'];
                $return[$key]['total']      = $total;
            }
        }

        return [
            'data' => $return,
            'grand_total' => $grand_total
        ];
    }
}

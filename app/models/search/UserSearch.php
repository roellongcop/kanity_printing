<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\User;
use yii\helpers\ArrayHelper;

/**
 * UserSearch represents the model behind the search form of `app\models\User`.
 */
class UserSearch extends User
{
    public $roleName;
    public $keywords;
    public $date_range;
    public $pagination;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'role_id', 'status'], 'integer'],
            [['username', 'password', 'authkey', 'access_token', 'created_at', 'updated_at', 'roleName', ], 'safe'],
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
        $query = User::find()
            ->alias('u');

        $this->load($params);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['created_at' => SORT_DESC]],
            'pagination' => [
                'pageSize' => $this->pagination
            ]
        ]);

        $dataProvider->sort->attributes['roleName'] = [
            'asc' => ['r.name' => SORT_ASC],
            'desc' => ['r.name' => SORT_DESC],
        ]; 

        Yii::$app->permission->filter($query);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'u.id' => $this->id,
            'u.role_id' => $this->role_id,
            'u.status' => $this->status,
            'u.created_at' => $this->created_at,
            'u.updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'u.username', $this->username])
            ->andFilterWhere(['like', 'u.password', $this->password])
            ->andFilterWhere(['like', 'u.authkey', $this->authkey])
            ->andFilterWhere(['like', 'u.access_token', $this->access_token]);


        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'r.name', $this->keywords], 
                ['like', 'u.username', $this->keywords], 
                ['like', 'u.authkey', $this->keywords], 
                ['like', 'u.access_token', $this->keywords], 
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(u.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }
        
        $query->joinWith('role r');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = User::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }

    public static function myAccess($key='id', $value='username', $andFilterWhere=[], $map=true)
    {
        $models = User::find()
            ->where(['role_id' => Yii::$app->user->identity->roleAccess])
            ->andWhere(['status' => 1])
            ->andFilterWhere($andFilterWhere)
            ->orderBy(['username' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, $key, $value);
        }
        
        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = User::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }
}

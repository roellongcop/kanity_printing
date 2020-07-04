<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Quotation;
use yii\helpers\ArrayHelper;

/**
 * QuotationSearch represents the model behind the search form of `app\models\Quotation`.
 */
class QuotationSearch extends Quotation
{
    public $keywords;
    public $username;
    public $date_range;
    public $pagination;
    public $typeOfServiceName;
    public $fullname;
    public $companyName;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'process_by', 'quantity', 'mode_of_payment_id'], 'integer'],
            [['specs', 'description', 'images', 'status', 'created_at', 'updated_at', 'quotation_no'], 'safe'],
            [['keywords', 'username', 'process_status', 'date_range', 'pagination', 'typeOfServiceName', 'type_of_service_id', 'fullname', 'companyName'], 'safe'],

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
        $query = Quotation::find()
            ->alias('q');

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

        $dataProvider->sort->attributes['username'] = [
            'asc' => ['u.username' => SORT_ASC],
            'desc' => ['u.username' => SORT_DESC],
        ];


        $dataProvider->sort->attributes['typeOfServiceName'] = [
            'asc' => ['tos.name' => SORT_ASC],
            'desc' => ['tos.name' => SORT_DESC],
        ];

        $dataProvider->sort->attributes['fullname'] = [
            'asc' => ['p.first_name' => SORT_ASC],
            'desc' => ['p.first_name' => SORT_DESC],
        ];

        $dataProvider->sort->attributes['companyName'] = [
            'asc' => ['p.company_name' => SORT_ASC],
            'desc' => ['p.company_name' => SORT_DESC],
        ];


        Yii::$app->permission->filter($query);


        // grid filtering conditions
        $query->andFilterWhere([
            'q.id' => $this->id,
            'q.type_of_service_id' => $this->type_of_service_id,
            'q.user_id' => $this->user_id,
            'q.process_status' => $this->process_status,
            'q.process_by' => $this->process_by,
            'q.quantity' => $this->quantity,
            'q.mode_of_payment_id' => $this->mode_of_payment_id,
            'q.created_at' => $this->created_at,
            'q.updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'q.specs', $this->specs])
            ->andFilterWhere(['like', 'q.description', $this->description])
            ->andFilterWhere(['like', 'q.images', $this->images])
            ->andFilterWhere(['like', 'q.status', $this->status]);

        if ($this->keywords) {
            $query->andFilterWhere(['or', 
                ['like', 'u.username', $this->keywords],  
                ['like', 'q.quotation_no', $this->keywords],  
                ['like', 'tos.name', $this->keywords],  
                ['like', 'p.first_name', $this->keywords],  
                ['like', 'p.company_name', $this->keywords],  
            ]);
        }

        if ($this->date_range) {
            $hours = Yii::$app->general->date_timezone(date("Y-m-d H:i:s"),"P");
            $datesearch = " DATE_ADD(q.created_at,INTERVAL '$hours' HOUR_MINUTE) ";
            $dates = explode( ' - ', $this->date_range);
            $start = date("Y-m-d", strtotime($dates[0]) ); 
            $end = date("Y-m-d", strtotime($dates[1]) ); 
            $query->andFilterWhere(['between', "date($datesearch)", $start, $end]);
        }
 
        $query->joinWith('user u');
        $query->joinWith('typeOfService tos');
        $query->joinWith('profile p');

        return $dataProvider;
    }


    public static function one($value, $attr='id', $array=false)
    {
        $model = Quotation::find()
            ->where([$attr => $value])
            ->andWhere(['status' => 1]);

        $model = ($array) ? $model->asArray()->one(): $model->one();

        if ($model) {
            return $model;
        }

        throw new \yii\web\NotFoundHttpException('The requested page does not exist.');
    }

    public static function dropdown($andFilterWhere, $map=true)
    {
        $models = Quotation::find()
            ->where(['status' => 1])
            ->andFilterWhere($andFilterWhere)
            ->orderBy(['id' => SORT_ASC])
            ->all();

        if ($map == true) {
            $models = ArrayHelper::map($models, 'id', 'quotation_no');
        }

        return $models;
    }

    public static function filter($attr='id', $value='')
    {
        $value = ($value) ? $value: $attr;
        $models = BaseStockCategory::find()
            ->where(['status' => 1])
            ->orderBy([$attr => SORT_ASC])
            ->groupBy($attr)
            ->all();

        $models = ArrayHelper::map($models, $attr, $value);

        return $models;
    }



    public static function count($process_status, $year='')
    {
        $model = Quotation::find()
            ->alias('q')
            ->where(Yii::$app->permission->filter())
            ->andWhere(['q.process_status' => $process_status])
            ->andWhere(['q.status' => 1])
            ->andFilterWhere(['YEAR(q.created_at)' => $year])
            ->joinWith('user u')
            ->count();

        return $model;
    }


}

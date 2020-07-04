<?php

namespace app\models;

use Yii;
use yii\helpers\Url;
use yii\helpers\Html;

/**
 * This is the model class for table "{{%log}}".
 *
 * @property int $id
 * @property int $user_id
 * @property int $ref_id
 * @property string $action
 * @property string $controller
 * @property string $model
 * @property int $created_by
 * @property int $updated_by
 * @property string $user_agent
 * @property string $ip
 * @property string $browser
 * @property string $os
 * @property string $device
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class Log extends \yii\db\ActiveRecord
{
    public $arrayAttr = ['request_data', 'change_attribute'];
    public $relatedModels = [];
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%log}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'ref_id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['action', 'controller', 'model', 'user_agent', 'ip', 'browser', 'os', 'device'], 'required'],
            [['user_agent'], 'string'],
            [['created_at', 'updated_at', 'request_data', 'method', 'url', 'change_attribute'], 'safe'],

            [['action', 'controller', 'model', 'browser', 'os', 'device'], 'string', 'max' => 64],
            [['ip'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'ref_id' => 'Ref ID',
            'action' => 'Action',
            'controller' => 'Page',
            'model' => 'Table',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'user_agent' => 'User Agent',
            'ip' => 'Ip',
            'browser' => 'Browser',
            'os' => 'Os',
            'device' => 'Device',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }


    public function getUser($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'user_id'])
            ->alias('u')
            ->onCondition(['u.status' => $status]);
    }

    public function getUsername()
    {
        if (($user = $this->user) != null) {
            return $user->username;
        }
    }


    public function getCreatedBy($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'created_by'])
            ->alias('u')
            ->onCondition(['u.status' => $status]);
    }

    public function getUpdatedBy($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'updated_by'])
            ->alias('u')
            ->onCondition(['u.status' => $status]);
    }

    public function getCreatedByName()
    {
        if (($model = $this->createdBy) != null) {
            return $model->username;
        }
    }

    public function getUpdatedByName()
    {
        if (($model = $this->updatedBy) != null) {
            return $model->username;
        }
    }




    public function getStatusTitle()
    {
        return Yii::$app->params['record_status'][$this->status];
    }

    public function afterFind()
    {
        foreach ($this->arrayAttr as $e) {
            $this->$e = $this->$e? json_decode($this->$e, TRUE): [];
        }

        $this->lastUpdated = Yii::$app->general->ago($this->updated_at);
        $this->createdAt = Yii::$app->general->date_timezone($this->created_at, 'F d, Y h:i:s A');
        $this->updatedAt = Yii::$app->general->date_timezone($this->updated_at, 'F d, Y h:i:s A');

        parent::afterFind();
    }

    public function get_request_data()
    {
        return Yii::$app->controller->renderPartial('/log/_request_data', [
            'model' => $this
        ]);
    }

    public function get_change_attribute()
    {
        return Yii::$app->controller->renderPartial('/log/_change_attribute', [
            'model' => $this
        ]);
    }


    public function beforeSave($insert)
    {
        $user = Yii::$app->user->identity;

        if (parent::beforeSave($insert)) { 
            foreach ($this->arrayAttr as $e) {
                if (is_array($this->$e)) {
                    $this->$e = json_encode($this->$e);
                }
            }

            if ($this->isNewRecord) {
                $this->created_at = new \yii\db\Expression('UTC_TIMESTAMP');
            }
            $this->updated_at = new \yii\db\Expression('UTC_TIMESTAMP');

            if (!Yii::$app->user->isGuest) {
                if ($this->isNewRecord) {
                    $this->created_by = $user->id;
                }
                $this->updated_by = $user->id;
            }
                
            
            return true;
        }
        return false;
    }

    public function getCanDelete($status = 1)
    {
        $res = [];

        foreach ($this->relatedModels as $model) {
            $mod = "\app\\models\\". $model;
            
            $_model = $mod::find()
                ->where(['id' => $this->id])
                ->andWhere(['status' => $status])
                ->one();

            if ($_model) {
                $res[] = $model;
            }
        }

        return ($res) ? false: true;
    }

    public function getLink()
    {
        if ($this->action == 'delete') {
            $url = Url::to([$this->controller . '/index'], true);
        }
        else {
            $url = Url::to([$this->controller . '/view', 'id' => $this->ref_id], true);
        }

        return Html::a($url, $url);
    }

    public function getCanUpdate()
    {
        return true;
    }


    public function getCanView()
    {
        return true;
    }
}

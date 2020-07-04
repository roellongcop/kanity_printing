<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%notification}}".
 *
 * @property string $id
 * @property string $user_id
 * @property string $message
 * @property string $controller
 * @property string $action
 * @property string $ref_id
 * @property int $read_status
 * @property string $created_by
 * @property string $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class Notification extends \yii\db\ActiveRecord
{
    public $arrayAttr = [];
    public $relatedModels = [];
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;

    
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%notification}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'ref_id', 'read_status', 'created_by', 'updated_by', 'status'], 'integer'],
            [['message', 'controller', 'action'], 'required'],
            [['message'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['controller', 'action'], 'string', 'max' => 64],
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
            'message' => 'Message',
            'controller' => 'Controller',
            'action' => 'Action',
            'ref_id' => 'Ref ID',
            'read_status' => 'Read Status',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }


    public function getRedirect()
    {
        return [$this->controller . '/' . $this->action, 'id' => $this->ref_id];
    }

    public function getReadStatus()
    {
        $status = Yii::$app->params['notification_status'][$this->read_status];
        return '<label class="badge badge-'.$status['class'].'">' . $status['title'] . '</label>';
    }

    public function getReadStatusTitle()
    {
        $status = Yii::$app->params['notification_status'][$this->read_status];
        return $status['title'];
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


    public function afterSave($insert, $attr)
    {
        Yii::$app->general->log($this, $attr);

        return parent::afterSave($insert, $attr);
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

    public function getCanUpdate()
    {
        return true;
    }


    public function getCanView()
    {
        return true;
    }
}

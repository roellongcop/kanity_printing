<?php

namespace app\models;

use Yii;
use app\models\search\BaseStockSearch;

/**
 * This is the model class for table "{{%base_stock_issue}}".
 *
 * @property string $id
 * @property string $base_stock_id
 * @property string $user_id
 * @property string $created_by
 * @property string $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 * @property int $quantity
 */
class BaseStockIssue extends \yii\db\ActiveRecord
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
        return '{{%base_stock_issue}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['base_stock_id', 'user_id', 'created_by', 'updated_by', 'status', 'quantity'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['quantity'], 'required'],
            [['quantity'], 'validateQuantity'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'base_stock_id' => 'Base Stock ',
            'user_id' => 'User ',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'quantity' => 'Quantity',
        ];
    }

    public function validateQuantity($attr, $params)
    {
        $baseStock = BaseStockSearch::one($this->base_stock_id);
        if ($this->isNewRecord) {
            if ($this->quantity > $baseStock->current_stock) {
                $this->addError($attr, 'Quantity must less than or equal to Base Stock quantity.');
            }
        }
    }


    public function getBaseStock($status = 1)
    {
        return $this->hasOne(BaseStock::className(), ['id' => 'base_stock_id'])
            ->alias('b')
            ->onCondition(['b.status' => $status]);
    }

    public function getStockName()
    {
        if (($model = $this->baseStock) != null) {
            return $model->name;
        }
    }

    public function getUsername()
    {
        if (($model = $this->user) != null) {
            return $model->username;
        }
    }


    public function getUser($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'user_id'])
            ->alias('u')
            ->onCondition(['u.status' => $status]);
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

        if ($insert) {
            if (($baseStock = $this->baseStock) != null) {
                $baseStock->current_stock = $baseStock->current_stock - $this->quantity;
                $baseStock->save();
            }
        }


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
        
        return false;
        return ($res) ? false: true;
    }

    public function getCanUpdate()
    {
        return false;
    }


    public function getCanView()
    {
        return true;
    }
}

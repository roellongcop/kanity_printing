<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%base_stock}}".
 *
 * @property string $id
 * @property string $base_stock_category_id
 * @property string $base_stock_unit_id
 * @property string $created_by
 * @property string $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 * @property string $name
 * @property string $description
 * @property int $max_stock
 * @property int $min_stock
 * @property int $current_stock
 */
class BaseStock extends \yii\db\ActiveRecord
{
    public $arrayAttr = [];
    public $relatedModels = ['BaseStockIssue'];
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%base_stock}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['base_stock_category_id', 'base_stock_unit_id', 'created_by', 'updated_by', 'status', 'max_stock', 'min_stock', 'current_stock'], 'integer'],

            [['created_at', 'updated_at', 'stock_status'], 'safe'],
            [['name', 'description', 'max_stock', 'min_stock', 'current_stock', 'base_stock_category_id', 'base_stock_unit_id',], 'required'],
            [['description'], 'string'],
            [['name'], 'string', 'max' => 256],
            [['max_stock', 'min_stock'], 'validateMaxStock', ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'base_stock_category_id' => 'Base Stock Category',
            'base_stock_unit_id' => 'Base Stock Unit',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'name' => 'Name',
            'description' => 'Description',
            'max_stock' => 'Maximum Stock',
            'min_stock' => 'Minimum Stock',
            'current_stock' => 'Current Stock',
        ];
    }

    public function getStockStatus()
    {
        return Yii::$app->params['inventory_status'][$this->stock_status]['title'];
    }

    public function validateMaxStock($attr, $params)
    {
        if ($this->max_stock <= $this->min_stock) {
            $this->addError($attr, 'Max stock must greater than Minimum stock.');
        }
    }


    public function getBaseStockCategory($status = 1)
    {
        return $this->hasOne(BaseStockCategory::className(), ['id' => 'base_stock_category_id'])
            ->alias('bc')
            ->onCondition(['bc.status' => $status]);
    }

    public function getCategoryName()
    {
        if (($model = $this->baseStockCategory) != null) {
            return $model->name;
        }
    }


    public function getBaseStockUnit($status = 1)
    {
        return $this->hasOne(BaseStockUnit::className(), ['id' => 'base_stock_unit_id'])
            ->alias('bu')
            ->onCondition(['bu.status' => $status]);
    }


    public function getUnit()
    {
        if (($model = $this->baseStockUnit) != null) {
            return $model->name;
        }
    }



    public function getBaseStockIssue($status = 1)
    {
        return $this->hasMany(BaseStockIssue::className(), ['base_stock_id' => 'id'])
            ->alias('bi')
            ->onCondition(['bi.status' => $status]);
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

        parent::afterSave($insert, $attr);
    }

    public function beforeSave($insert)
    {
        $user = Yii::$app->user->identity;

        if (parent::beforeSave($insert)) { 

            if ($this->current_stock == 0) {
                $this->stock_status = 0;
            }
            elseif ($this->current_stock > $this->max_stock) {
                $this->stock_status = 3;
            }
            elseif ($this->current_stock <= $this->min_stock) {
                $this->stock_status = 2;
            }
            else {
                $this->stock_status = 1;
            }


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
                ->where(['base_stock_id' => $this->id])
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

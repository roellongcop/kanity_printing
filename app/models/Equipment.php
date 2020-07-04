<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%equipment}}".
 *
 * @property int $id
 * @property int $equipment_category_id
 * @property string $name
 * @property string $tag_line
 * @property string $description
 * @property int $created_by
 * @property int $updated_by
 * @property int $status
 * @property string $image
 * @property string $created_at
 * @property string $updated_at
 */
class Equipment extends \yii\db\ActiveRecord
{
    public $arrayAttr = [];
    public $relatedModels = [];
    public $image_input;
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%equipment}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['equipment_category_id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['name', 'tag_line', 'description'], 'required'],
            [['description', 'image'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'tag_line'], 'string', 'max' => 256],
            [['image_input'], 'file', 'skipOnEmpty' => true, 'extensions' => 'jpg, jpeg, png'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'equipment_category_id' => 'Service ID',
            'name' => 'Name',
            'tag_line' => 'Tag Line',
            'description' => 'Description',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'image' => 'Image',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
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


    public function getEquipmentCategory($status = 1)
    {
        return $this->hasOne(EquipmentCategory::className(), ['id' => 'equipment_category_id'])
            ->alias('ec')
            ->onCondition(['ec.status' => $status]);
    }

    public function getCategoryName()
    {
        if (($service = $this->equipmentCategory) != null) {
            return $service->name;
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

    public function upload()
    {
        $uploadPath = Yii::$app->general->createFolder(['uploads', 'equipments', $this->categoryName]); 

        if ($this->validate() && $this->image_input) { 
            

            $path = $uploadPath .
                $this->image_input->baseName . '.' . 
                $this->image_input->extension;

            $this->image_input->saveAs($path, false);

            $this->image = $path;

            return true;
        }
        return false;
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

<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%profile}}".
 *
 * @property int $id
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $position
 * @property string $company_name
 * @property string $company_address
 * @property string $tin
 * @property string $email
 * @property string $contact_number
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class Profile extends \yii\db\ActiveRecord
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
        return '{{%profile}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['first_name', 'last_name', 'position', 'company_name', 'company_address', 'tin', 'email', 'contact_number',], 'required'],
            [['company_address'], 'string'],
            [['status'], 'default', 'value' => 1],
            [['user_id'], 'required', 'on' => 'admin'],
            [['email'], 'email'],
            [['email'], 'unique'],
            [['status'], 'integer'],
            [['created_at', 'updated_at', 'created_by', 'updated_by', 'image'], 'safe'],
            [['first_name', 'middle_name', 'last_name', 'position', 'tin'], 'string', 'max' => 128],
            [['company_name', 'email'], 'string', 'max' => 256],
            [['contact_number'], 'string', 'max' => 32],
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
            'user_id' => 'User',
            'first_name' => 'First Name',
            'middle_name' => 'Middle Name',
            'last_name' => 'Last Name',
            'position' => 'Position',
            'company_name' => 'Company Name',
            'company_address' => 'Company Address',
            'tin' => 'Tin',
            'email' => 'Email',
            'contact_number' => 'Contact Number',
            'status' => 'Status',
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

    public function getFullname()
    {
        return ucwords($this->first_name . ' ' . $this->last_name);
    }

    public function getUser($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'user_id'])
            ->alias('u')
            ->onCondition(['u.status' => $status]);
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
        $uploadPath = Yii::$app->general->createFolder(['uploads', 'profile', $this->fullname]); 

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

    public function getProfile_path()
    {
       $image = ($this->image) ? $this->image : Yii::$app->params['default_profile'];

        $src = Yii::$app->urlManager->baseUrl . '/' . $image;

        return $src;
    }

    public function getProfile_picture()
    {
        return '<img class="img-circle" src="'.$this->profile_path.'" alt="img" style="height: 35px">';
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

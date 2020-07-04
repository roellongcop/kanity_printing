<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%setting}}".
 *
 * @property int $id
 * @property int $created_by
 * @property int $updated_by
 * @property int $default_role
 * @property int $pagination
 * @property string $timezone
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class Setting extends \yii\db\ActiveRecord
{
    public $arrayAttr = ['notification_pages', 'menu'];
    public $relatedModels = [];
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;
    public $image_input;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%setting}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['created_by', 'updated_by', 'default_role', 'pagination', 'status'], 'integer'],
            [['default_role', 'pagination', 'timezone', 'quotation_no_padding', 'jo_no_padding', 'company_name', 'company_tag_line', 'company_description', 'company_address', 'si_no_padding', 'ar_no_padding', 'or_no_padding'], 'required'],

            [['created_at', 'updated_at', 'form_of_business', 'line_of_business', 'tin', 'reg_no', 'company_phone_no', 'company_fax_no', 'twitter', 'facebook', 'google', 'email', 'notification_pages', 'si_no_prefix', 'jo_no_prefix', 'quotation_no_prefix', 'ar_no_prefix', 'company_logo', 'menu', 'or_no_prefix', 'maximum_request_amount_restriction', 'terms_and_condition', 'privacy_policy'], 'safe'],


            [['timezone'], 'string', 'max' => 64],
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
            'ar_no_padding' => 'No Padding',
            'ar_no_prefix' => 'No Prefix',

            'si_no_padding' => 'No Padding',
            'si_no_prefix' => 'No Prefix',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'default_role' => 'Default Role (on signup)',
            'pagination' => 'Pagination',
            'timezone' => 'Timezone',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'roleName' => 'Default Role (on signup)',
            'maximum_request_amount_restriction' => 'Credit Amount Restriction'
        ];
    }


    public function getRole($status = 1)
    {
        return $this->hasOne(Role::className(), ['id' => 'default_role'])
            ->alias('r')
            ->onCondition(['r.status' => $status]);
    }

    public function getRoleName()
    {
        if (($role = $this->role) != null) {
            return ucwords($role->name);
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

    public function afterSave($insert, $attr)
    {
        Yii::$app->general->log($this, $attr);

        return parent::afterSave($insert, $attr);
    }

    public function beforeSave($insert)
    {
        $user = Yii::$app->user->identity;

        if (parent::beforeSave($insert)) { 
            
            if ($this->isNewRecord) {
                $this->created_at = new \yii\db\Expression('UTC_TIMESTAMP');
            }
            $this->updated_at = new \yii\db\Expression('UTC_TIMESTAMP');

            
            $menus = [];


            foreach ($this->menu as $menu) {
                if ($menu['controller']) {
                    $menus[$menu['controller']]['title'] = $menu['title'];
                    $menus[$menu['controller']]['icon'] = $menu['icon'];

                    if (isset($menu['sub'])) {
                        foreach ($menu['sub'] as $key => $sub) {
                            if ($sub['controller']) {
                                $menus[$menu['controller']]['sub'][$sub['controller']]['title'] = $sub['title'];
                                $menus[$menu['controller']]['sub'][$sub['controller']]['icon'] = $sub['icon'];
                            }
                        }
                    }
                }
            }

            $this->menu = $menus;

            if (!Yii::$app->user->isGuest) {
                if ($this->isNewRecord) {
                    $this->created_by = $user->id;
                }
                $this->updated_by = $user->id;
            }


            foreach ($this->arrayAttr as $e) {
                if (is_array($this->$e)) {
                    $this->$e = json_encode($this->$e);
                }
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


    public function upload()
    {
        $uploadPath = Yii::$app->general->createFolder(['uploads', 'setting', 'company_logo']); 

        if ($this->validate() && $this->image_input) { 
            

            $path = $uploadPath .
                $this->image_input->baseName . '.' . 
                $this->image_input->extension;

            $this->image_input->saveAs($path, false);

            $this->company_logo = $path;

            return true;
        }
        return false;
    }

    public function getLogo()
    {
        return '<img class="img-circle" src="'.Yii::$app->general->logo().'" alt="img" style="height: 35px">';
    }
}

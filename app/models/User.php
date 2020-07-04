<?php

namespace app\models;

use Yii;
use app\models\search\UserSearch;
/**
 * This is the model class for table "{{%user}}".
 *
 * @property int $id
 * @property string $fullname
 * @property int $gender
 * @property int $age
 * @property string $birthday
 * @property string $address
 * @property int $educational_attainment
 * @property int $employment_status
 * @property int $civil_status
 * @property string $dswd_nhtsmember
 * @property int $family_household_number
 * @property string $username
 * @property string $password
 * @property string $authkey
 * @property string $access_token
 * @property int $user_type
 * @property int $status
 */
class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    public $password_confirm;
    public $verification = false;
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;
    public $arrayAttr = [];
    public $relatedModels = ['Quotation', 'Profile', 'Log'];
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password', 'password_confirm'], 'required'],
            [['role_id', 'status'], 'integer'],
            [['username'], 'unique'],
            [['status'], 'default', 'value' => 1],
            [['created_at', 'updated_at', 'verification', 'created_by', 'updated_by', 'super_admin'], 'safe'],
            [['username', 'password', 'authkey', 'access_token', 'password_confirm'], 'string', 'max' => 256],

            [['password_confirm'], 'validatePasswordConfirm'],
            [['password_confirm', 'password'], 'string', 'min' => 4],
        ];
    }


    public function validatePasswordConfirm($attribute, $params)
    {
        if ($this->password_confirm != $this->password) {
            $this->addError($attribute, 'Password Mismatch');
        }
    }


    /**
     * @inheritdoc
     */


     /**
     * {@inheritdoc}
     */
    public static function findIdentity($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        }
        return null;
        // return isset(self::$users[$id]) ? new static(self::$users[$id]) : null;
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        if (($model = User::findOne(['accessToken' => $token])) !== null) {
            return $model;
        }
        return null;
    }

     

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return User::findOne(['username' => $username]);
    }


    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsernameAndStatus($username, $status)
    {
        return User::findOne(['username' => $username, 'status' => $status]);
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->authkey;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password);
    }


    /**
     * Set password
     *
     */
    public function setPassword()
    {
        $this->password = Yii::$app->security->generatePasswordHash($this->password);
    }

    public function setAuthkey()
    {
        $authkey = strtoupper(Yii::$app->security->generateRandomString(10));
        $authkey = str_replace('-', '', $authkey);

        $user = User::findOne(['authkey' => $authkey]);

        if ($user) {
            $this->setAuthkey();
        }
        else {
            $this->authkey = $authkey;
        }
    }

    public function setAccess_token()
    {
        $token = strtoupper(Yii::$app->security->generateRandomString(10));
        $token = str_replace('-', '', $token);

        $user = User::findOne(['access_token' => $token]);

        if ($user) {
            $this->setAccess_token();
        }
        else {
            $this->access_token = $token;
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

    public function getRole($status = 1)
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id'])
            ->alias('r')
            ->onCondition(['r.status' => $status]);
    }

    public function getRoleName()
    {
        if (($role = $this->role) != null) {
            return ucwords($role->name);
        }
    }

    public function getProfile($status = 1)
    {
        return $this->hasOne(Profile::className(), ['user_id' => 'id'])
            ->alias('p')
            ->onCondition(['p.status' => $status]);
    }

    

    public function createString($range = 10)
    {
        return Yii::$app->security->generateRandomString($range);
    }


    public function getRoleAccess()
    {
        if (($role = $this->role) != NULL) {
            return $role->role_access;
        }
        return '';
    }


    public function getModuleAccess()
    {
        if (($role = $this->role) != NULL) {
            return $role->module_access;
        }
        return '';
    }

    public function getUserAccess()
    {
        $models = array_keys(UserSearch::myAccess());

        if ($models) {
            return $models;
        }

        return Yii::$app->user->identity->id;
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
                
            if ($this->verification == false) {
                $this->setPassword();
                $this->setAuthkey();
                $this->setAccess_token();
            }

            
            return true;
        }
        return false;
    }


    public function getProfile_path()
    {
        if (($profile = $this->profile) != null) {
            return $profile->profile_path;
        }

        $src = Yii::$app->urlManager->baseUrl . '/' . Yii::$app->params['default_profile'];

        return $src;
    }
    

    public function getProfile_picture()
    {

        if (($profile = $this->profile) != null) {
            return $profile->profile_picture;
        }

        return '<img class="img-circle" src="'.$this->profile_path.'" alt="img" style="height: 35px">';
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

    public function getBalance()
    {
        $model = SalesInvoice::find()
            ->select(['SUM(total) as total'])
            ->where(['status' => 1, 'payment_status' => 0, 'user_id' => $this->id])
            ->asArray()
            ->one();

        return $model['total'];
    }


    public function getName()
    {
        if (($profile = $this->profile) != null) {
            return $profile->fullname;
        }

        return $this->username;
    }

}

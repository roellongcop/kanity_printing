<?php

namespace app\models;

use Yii;
use app\models\search\UserSearch;

/**
 * This is the model class for table "{{%quotation}}".
 *
 * @property int $id
 * @property int $user_id
 * @property int $process_by
 * @property string $specs
 * @property string $description
 * @property int $quantity
 * @property int $mode_of_payment_id
 * @property string $images
 * @property string $status
 * @property string $created_at
 * @property string $updated_at
 */
class Quotation extends \yii\db\ActiveRecord
{
    public $arrayAttr = ['images'];
    public $relatedModels = ['PurchaseOrder'];
    public $imageFiles = [];
    public $lastUpdated;
    public $createdAt;
    public $updatedAt; 
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%quotation}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'specs', 'description', 'quantity', 'mode_of_payment_id'], 'required'],
            [['price_per_piece', 'type_of_service_id', ], 'required', 'on' => 'set_quotation'],
            [['reason', ], 'required', 'on' => 'no_bid'],

            [['status'], 'default', 'value' => 1],
            [['quantity', 'price_per_piece', 'pending_quantity'], 'number'],
            [['user_id', 'process_by', 'quantity', 'mode_of_payment_id', 'type_of_service_id'], 'integer'],
            [['description', 'reason'], 'string'],
            [['created_at', 'updated_at', 'created_by', 'updated_by', 'process_status', 'images', 'quotation_no', 'note', 'pending_quantity'], 'safe'],
            [['specs'], 'string', 'max' => 250],
            [['status'], 'integer',],
            [['imageFiles'], 'file', 'skipOnEmpty' => true, 'extensions' => 'jpg, jpeg, png', 'maxFiles' => 4],

            [['user_id'], 'validateUserID',],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'quotation_no' => 'Quotation Number',
            'typeOfServiceName' => 'Type of Service',
            'type_of_service_id' => 'Type of Service',
            'user_id' => 'User ID',
            'process_by' => 'Process By',
            'specs' => 'Specification',
            'description' => 'Description',
            'quantity' => 'Quantity (Pcs)',
            'mode_of_payment_id' => 'Mode Of Payment',
            'images' => 'Images',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'note' => 'Note',
            'reason' => 'No Bid Reason',

        ];
    }

    public function getTotalPrice()
    {
        $total_price = $this->quantity * $this->price_per_piece;

        return round($total_price, 2);
    }

    public function validateUserID($attr, $params)
    {
        $user = Yii::$app->user->identity;
        $_user = UserSearch::one($this->user_id);
        $setting = Yii::$app->general->setting();

        if ($_user->balance >= $setting['maximum_request_amount_restriction']) {
            $this->addError($attr, 'User has pending Unpaid Balance of ' . number_format($_user->balance, 2));
        }

        if ($user->roleAccess) {

            if (!in_array($_user->role_id, $user->roleAccess)) {
                $this->addError($attr, 'You dont have access to this user');
            }
        }
        else {
            if ($this->user_id != $user->id) {
                $this->addError($attr, 'You dont have access to this user');
            }
        }
    }

    public function getPaymentType()
    {
        return Yii::$app->params['payment_type_id'][$this->typeOfService->payment_type_id];
    }


    public function getTypeOfService($status = 1)
    {
        return $this->hasOne(TypeOfService::className(), ['id' => 'type_of_service_id'])
            ->alias('tos')
            ->onCondition(['tos.status' => $status]);
    }

    public function getTypeOfServiceName()
    {
        if (($model = $this->typeOfService) != null) {
            return $model->name;
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


    public function getUser($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'user_id'])
            ->alias('u')
            ->onCondition(['u.status' => $status]);
    }

    public function getUsername()
    {
        if (($user = $this->user) != NULL) {
            return $user->username;
        }
        return 'N/A';
    }


    public function getProfile($status = 1)
    {
        return $this->hasOne(Profile::className(), ['user_id' => 'id'])
            ->alias('p')
            ->onCondition(['p.status' => $status])
            ->via('user');
    }

    public function getProcessBy($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'process_by'])
            ->alias('u')
            ->onCondition(['u.status' => $status]);
    }

    public function getPurchaseOrder($status = 1)
    {
        return $this->hasOne(PurchaseOrder::className(), ['quotation_id' => 'id'])
            ->alias('pu')
            ->onCondition(['pu.status' => $status]);
    }

    public function getJobOrder($status = 1)
    {
        return $this->hasOne(JobOrder::className(), ['purchase_order_id' => 'id'])
            ->alias('jo')
            ->onCondition(['jo.status' => $status])
            ->via('purchaseOrder');
    }


    public function getProcessByUsername()
    {
        if (($processBy = $this->processBy) != NULL) {
            return $processBy->username;
        }
        return 'N/A';
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

    public function getFullname()
    {
        if (($profile = $this->profile) != null) {
            return $profile->fullname;
        }
    }

    public function getCompanyName()
    {
        if (($profile = $this->profile) != null) {
            return $profile->company_name;
        }
    }


    public function afterSave($insert, $attr)
    {
        Yii::$app->general->log($this, $attr); 

        return parent::afterSave($insert, $attr);
    }

    public function getModeOfPayment($status = 1)
    {
        return $this->hasOne(ModeOfPayment::className(), ['id' => 'mode_of_payment_id'])
            ->alias('mop')
            ->onCondition(['mop.status' => $status]);
    }


    public function getMop()
    {
        if (($mop = $this->modeOfPayment) != null) {
            return $mop->name;
        }
    }

    public function getCurrentStatusTitle()
    {
        return Yii::$app->params['process_status'][$this->process_status]['title'];
    }

    public function getCurrentStatusClass()
    {
        $class = Yii::$app->params['process_status'][$this->process_status]['class'];
        return '<label class="badge badge-'.$class.'">'.$this->currentStatusTitle.'</label>';
    }


    public function getStatusTitle()
    {
        return Yii::$app->params['record_status'][$this->status];
    }

    public function beforeSave($insert)
    {
        $user = Yii::$app->user->identity;
        $general = Yii::$app->general;

        if (parent::beforeSave($insert)) { 

            


            foreach ($this->arrayAttr as $e) {
                if (is_array($this->$e)) {
                    $this->$e = json_encode($this->$e);
                }
            }
            
            if ($this->isNewRecord) {
                $this->created_at = new \yii\db\Expression('UTC_TIMESTAMP');


                $max_id = Quotation::find()->max('id');
                $setting = $general->setting();
                
                $this->quotation_no = $general->invoice_num(
                    ($max_id + 1), 
                    $setting['quotation_no_padding'], 
                    $setting['quotation_no_prefix']
                );


                $this->pending_quantity = $this->quantity;
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
                ->where(['quotation_id' => $this->id])
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
        $uploadPath = Yii::$app->general->createFolder(['uploads', 'quotation']); 

        if ($this->validate() && $this->imageFiles) { 
            $images = [];
            foreach ($this->imageFiles as $image_input) {
                $path = $uploadPath . $image_input->baseName . '.' . $image_input->extension;
                $image_input->saveAs($path, false);

                $images[] = $path;
            }

            $this->images = $images;

            return true;
        }
        return false;
    }

    public function getCanUpdate()
    {
        if ($this->process_status == 0) {
            return true;
        }

        return false;
    }

 

    public function getCanView()
    {
        return true;
    }

    public function getCanSendPo()
    {
        if ($this->process_status == 1) {
            return true;
        }
        
        return false;
    }
}

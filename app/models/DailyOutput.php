<?php

namespace app\models;

use Yii;
use app\models\search\JobOrderSearch;

/**
 * This is the model class for table "{{%daily_output}}".
 *
 * @property int $id
 * @property int $job_order_id
 * @property int $quantity
 * @property int $created_by
 * @property int $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class DailyOutput extends \yii\db\ActiveRecord
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
        return '{{%daily_output}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['job_order_id', 'quantity'], 'required'],
            [['job_order_id', 'quantity', 'created_by', 'updated_by', 'status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['quantity', ], 'validateQuantity'],
            [['job_order_id', ], 'validateJobOrderID'],
        ];
    }



    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'job_order_id' => 'Job Order No',
            'quantity' => 'Quantity',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }


    public function validateJobOrderID($attr, $params)
    {
        $user = Yii::$app->user->identity;
        $jo = JobOrderSearch::one($this->job_order_id);

        if ($this->isNewRecord) {
            if (!in_array($jo->process_status, [1, 2])) {
                $this->addError($attr, 'Job Order Current Status is invalid');
            }

            if ($user->roleAccess) {
                if (!in_array($jo->user->role_id, $user->roleAccess)) {
                    $this->addError($attr, 'You dont have access to this JO');
                }
            }
            else {
                if ($jo->user->id != $user->id) {
                    $this->addError($attr, 'You dont have access to this JO');
                }
            }
        }
    }


    
    

    public function validateQuantity($attribute, $params)
    {
        // 'payment_type_id' => [
        //     0 => 'Complete Payment',
        //     1 => 'Partial Payment',
        // ],
        $jobOrder = JobOrderSearch::one($this->job_order_id);

        if ($this->isNewRecord) {
            $payment_type = $this->jobOrder->quotation->typeOfService->payment_type_id; //1
            $pending_quantity = $jobOrder->pending_quantity; 

            if ($this->quantity > $pending_quantity) {
                $this->addError($attribute, 'Quantity input is greater than the Quotation pending quantity.');
            }


            if ($payment_type == 0 && $this->quantity < $pending_quantity) {
                $this->addError($attribute, 'Payment Type is Complete Payment. Quantity must equal to the pending quantity ('.$pending_quantity.')');
            }
        }

    }



    public function getJobOrder($status = 1)
    {
        return $this->hasOne(JobOrder::className(), ['id' => 'job_order_id'])
            ->alias('jo')
            ->onCondition(['jo.status' => $status]);
    }


    public function getJobOrderNo()
    {
        if (($model = $this->jobOrder) != null) {
            return $model->jo_no;
        }
    }

    public function getPurchaseOrder($status = 1)
    {
        return $this->hasOne(PurchaseOrder::className(), ['id' => 'purchase_order_id'])
            ->alias('pu')
            ->onCondition(['pu.status' => $status])
            ->via('jobOrder');
    }

    public function getPurchaseOrderNo()
    {
        if (($model = $this->purchaseOrder) != null) {
            return $model->po_no;
        }
    }


    public function getQuotation($status = 1)
    {
        return $this->hasOne(Quotation::className(), ['id' => 'quotation_id'])
            ->alias('q')
            ->onCondition(['q.status' => $status])
            ->via('purchaseOrder');
    }


    public function getUser($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'user_id'])
            ->alias('u')
            ->onCondition(['u.status' => $status])
            ->via('quotation');
    }

    public function getQuotationNo()
    {
        if (($model = $this->quotation) != null) {
            return $model->quotation_no;
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

        if ($insert) {
            if (($jo = $this->jobOrder) != null) {
                $jo->served_quantity = $jo->served_quantity  + $this->quantity;
                $jo->pending_quantity = $jo->pending_quantity - $this->quantity;
           
                if ($jo->pending_quantity == 0) {
                    $jo->process_status = 3; //complete served
                }
                elseif ($jo->served_quantity == 0) {
                    $jo->process_status = 1; //Unserved served
                }
                else {
                    $jo->process_status = 2; //partial served
                }
                $jo->save();
            }
        }
        else {
            if ($this->status == 0) {
                if (($jo = $this->jobOrder) != null) {
                    $jo->served_quantity = $jo->served_quantity  - $this->quantity;
                    $jo->pending_quantity = $jo->pending_quantity + $this->quantity;
               
                    if ($jo->pending_quantity == 0) {
                        $jo->process_status = 3; //complete served
                    }
                    elseif ($jo->served_quantity == 0) {
                        $jo->process_status = 1; //Unserved served
                    }
                    else {
                        $jo->process_status = 2; //partial served
                    }
                    $jo->save();
                }
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

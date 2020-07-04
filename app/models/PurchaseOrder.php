<?php

namespace app\models;

use Yii;
use app\models\search\QuotationSearch;

/**
 * This is the model class for table "{{%purchase_order}}".
 *
 * @property int $id
 * @property int $quotation_id
 * @property string $po_no
 * @property string $customer_note
 * @property int $created_by
 * @property int $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class PurchaseOrder extends \yii\db\ActiveRecord
{
    public $arrayAttr = [];
    public $relatedModels = ['JobOrder', 'AcknowledgmentReceipt', 'SalesInvoice'];
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%purchase_order}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['quotation_id', 'created_by', 'updated_by', 'status', 'quantity', 'served_quantity' ,'pending_quantity', 'ar_status'], 'integer'],
            [['po_no', 'customer_note', 'quotation_id'], 'required'],
            [['customer_note'], 'string'],
            [['created_at', 'updated_at', 'process_status', 'served_quantity' ,'pending_quantity', 'ar_status'], 'safe'],
            [['po_no'], 'string', 'max' => 64],

            [['quotation_id'], 'validateQuotationID'],
        ];

    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'served_quantity' => 'Served',
            'pending_quantity' => 'Pending',
            'quotation_id' => 'Quotation Number',
            'quotationNo' => 'Quotation Number',
            'po_no' => 'Po No',
            'customer_note' => 'Customer Note',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }


    public function validateQuotationID($attr, $params)
    {
        $user = Yii::$app->user->identity;
        $quotation = QuotationSearch::one($this->quotation_id);

        if ($user->roleAccess) {

            if (!in_array($quotation->user->role_id, $user->roleAccess)) {
                $this->addError($attr, 'You dont have access to this quotation');
            }
        }
        else {
            if ($quotation->user_id != $user->id) {
                $this->addError($attr, 'You dont have access to this quotation');
            }
        }
    }


    public function getParticulars()
    {
        $particulars = [];
        if (($ars = $this->acknowledgmentReceipt) != null) {
            foreach ($ars as $ar) {
                $particulars[] = $ar->particular;
            }
        }

        return implode(', ', $particulars);
    }


    public function getAcknowledgmentReceipt($status = 1)
    {
        return $this->hasMany(AcknowledgmentReceipt::className(), ['purchase_order_id' => 'id'])
            ->alias('ar')
            ->onCondition(['ar.status' => $status]);
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

    public function getPaymentType()
    {
        return Yii::$app->params['payment_type_id'][$this->quotation->typeOfService->payment_type_id];
    }


    public function getQuotation($status = 1)
    {
        return $this->hasOne(Quotation::className(), ['id' => 'quotation_id'])
            ->alias('q')
            ->onCondition(['q.status' => $status]);
    }


    public function getUser($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'user_id'])
            ->alias('u')
            ->onCondition(['u.status' => $status])
            ->via('quotation');
    }

    public function getJobOrder($status = 1)
    {
        return $this->hasOne(JobOrder::className(), ['purchase_order_id' => 'id'])
            ->alias('jo')
            ->onCondition(['jo.status' => $status]);
    }


    public function getQuotationNo()
    {
        if (($model = $this->quotation) != null) {
            return $model->quotation_no;
        }
    }


    public function getCurrentStatusTitle()
    {
        return Yii::$app->params['po_process_status'][$this->process_status]['title'];
    }

    public function getCurrentStatusClass()
    {
        $class = Yii::$app->params['po_process_status'][$this->process_status]['class'];
        return '<label class="badge badge-'.$class.'">'.$this->currentStatusTitle.'</label>';
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
            if (($quotation = $this->quotation) != null) {
                $quotation->process_status = 4;
                $quotation->save();
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
                $quotation = QuotationSearch::one($this->quotation_id);
                $this->quantity = $this->quotation->quantity;
                $this->served_quantity = 0;
                $this->pending_quantity = $this->quantity;
                
                $this->created_at = new \yii\db\Expression('UTC_TIMESTAMP');
            }
            $this->updated_at = new \yii\db\Expression('UTC_TIMESTAMP');

            if (!Yii::$app->user->isGuest) {
                if ($this->isNewRecord) {
                    $this->created_by = $user->id;
                }
                $this->updated_by = $user->id;
            }

            if ($this->pending_quantity == 0) {
                $this->ar_status = 2;      
            }
            elseif ($this->served_quantity == 0) {
                $this->ar_status = 0;      
            }
            elseif ($this->acknowledgmentReceipt) {
                $this->ar_status = 1;      
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
                ->where(['purchase_order_id' => $this->id])
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

        if ($this->acknowledgmentReceipt) {
            return false;
        }


        if ($this->process_status != 0) {
            return false;
        }

        return true;
    }


    public function getCanView()
    {
        return true;
    }

    public function getCanAcknowledgeReceipt()
    {
        if ($this->pending_quantity == 0) {
            return false;
        }

        return true;
    }

    public function getArStatus()
    {
        return Yii::$app->params['ar_status'][$this->ar_status]['title']; 
    }


    public function getCanCreateJobOrder()
    {
        if ($this->jobOrder) {
            return false;
        }

        return true;
    }
}

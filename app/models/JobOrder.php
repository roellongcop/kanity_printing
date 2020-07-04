<?php

namespace app\models;

use Yii;
use app\models\search\PurchaseOrderSearch;
use app\models\search\QuotationSearch;

/**
 * This is the model class for table "{{%job_order}}".
 *
 * @property int $id
 * @property int $purchase_order_id
 * @property string $jo_no
 * @property string $note
 * @property int $created_by
 * @property int $updated_by
 * @property int $process_status
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class JobOrder extends \yii\db\ActiveRecord
{
    public $arrayAttr = [];
    public $relatedModels = ['DailyOutput'];
    public $lastUpdated;
    public $createdAt;
    public $updatedAt;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%job_order}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['purchase_order_id', 'created_by', 'updated_by', 'process_status', 'status', 'served_quantity' ,'pending_quantity'], 'integer'],
            [['note'], 'required'],
            [['note'], 'string'],
            [['created_at', 'updated_at', 'served_quantity' ,'pending_quantity'], 'safe'],
            [['jo_no'], 'string', 'max' => 64],
            [['purchase_order_id'], 'validatePurchaseOrderID'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'purchase_order_id' => 'Purchase Order No',
            'jo_no' => 'Jo No',
            'quotationNo' => 'Quotation Number',
            'note' => 'Note',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'process_status' => 'Process Status',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    public function validatePurchaseOrderID($attr, $params)
    {
        $user = Yii::$app->user->identity;
        $po = PurchaseOrderSearch::one($this->purchase_order_id);

        if ($user->roleAccess) {

            if (!in_array($po->user->role_id, $user->roleAccess)) {
                $this->addError($attr, 'You dont have access to this PO');
            }
        }
        else {
            if ($po->user->id != $user->id) {
                $this->addError($attr, 'You dont have access to this PO');
            }
        }
    }


    public function getPaymentType()
    {
        return Yii::$app->params['payment_type_id'][$this->quotation->typeOfService->payment_type_id];
    }

    public function getDailyOutput($status = 1)
    {
        return $this->hasMany(DailyOutput::className(), ['job_order_id' => 'id'])
            ->alias('do')
            ->onCondition(['do.status' => $status]);
    }

    

    public function getPurchaseOrder($status = 1)
    {
        return $this->hasOne(PurchaseOrder::className(), ['id' => 'purchase_order_id'])
            ->alias('pu')
            ->onCondition(['pu.status' => $status]);
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

    public function getPurchaseOrderNo()
    {
        if (($model = $this->purchaseOrder) != null) {
            return $model->po_no;
        }
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


    public function getCurrentStatusTitle()
    {
        return Yii::$app->params['jo_process_status'][$this->process_status]['title'];
    }

    public function getCurrentStatusClass()
    {
        $class = Yii::$app->params['jo_process_status'][$this->process_status]['class'];
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
            if (($po = $this->purchaseOrder) != null) {
                $po->process_status = 1;
                $po->save();
            }
        }

        return parent::afterSave($insert, $attr);
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
                $purchaseOrder = PurchaseOrderSearch::one($this->purchase_order_id);
                $this->quantity = $this->purchaseOrder->quotation->quantity;
                $this->served_quantity = 0;
                $this->pending_quantity = $this->quantity;


                $max_id = JobOrder::find()->max('id');
                $setting = $general->setting();
                
                $this->jo_no = $general->invoice_num(($max_id + 1), $setting['jo_no_padding'], $setting['jo_no_prefix']);
        
                
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
                ->where(['job_order_id' => $this->id])
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
        if ($this->process_status == 0) {
            return true;
        }

        return false;
    }


    public function getCanView()
    {
        return true;
    }

    public function getCanReceivedScheduled()
    {
        if ($this->process_status == 0) {
            return true;
        }

        return false;
    }

    public function getCanAddDailyOutput()
    {
        if ($this->pending_quantity != 0 && in_array($this->process_status, [1, 2])) {
            return true;
        }

        return false;
    }
}

<?php

namespace app\models;

use Yii;
use app\models\search\PurchaseOrderSearch;


/**
 * This is the model class for table "{{%acknowledgment_receipt}}".
 *
 * @property int $id
 * @property string $purchase_order_id
 * @property int $quantity
 * @property string $delivery_date
 * @property int $delivery_status
 * @property string $particular
 * @property int $created_by
 * @property int $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 */
class AcknowledgmentReceipt extends \yii\db\ActiveRecord
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
        return '{{%acknowledgment_receipt}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['purchase_order_id', 'quantity', 'delivery_status', 'created_by', 'updated_by', 'status'], 'integer'],
            [['quantity', 'particular', 'purchase_order_id', 'received_by', 'company_name'], 'required'],
            [['delivery_date', 'created_at', 'updated_at', 'no', 'note'], 'safe'],
            [['particular', 'company_name'], 'string'],
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
            'purchase_order_id' => 'Purchase Order No',
            'quantity' => 'Quantity',
            'delivery_date' => 'Delivery Date',
            'delivery_status' => 'Delivery Status',
            'particular' => 'Particular',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    public function getTotalPrice()
    {
        return $this->quantity * $this->quotation->price_per_piece;
    }

    public function validateQuantity($attribute, $params)
    {
        // 'payment_type_id' => [
        //     0 => 'Complete Payment',
        //     1 => 'Partial Payment',
        // ],

        $purchaseOrder = PurchaseOrderSearch::one($this->purchase_order_id);

        
        if ($this->isNewRecord) {

            $payment_type = $purchaseOrder->quotation->typeOfService->payment_type_id; //1
            $pending_quantity = $purchaseOrder->pending_quantity;

            if ($this->quantity > $pending_quantity) {
                $this->addError($attribute, 'Quantity input is greater than pending quantity.s' . $pending_quantity . ' - ' . $this->purchase_order_id);
            }


            if ($payment_type == 0 && $this->quantity < $pending_quantity) {
                $this->addError($attribute, 'Payment Type is Complete Payment. Quantity must equal to the pending quantity ('.$pending_quantity.')');
            }
        }

    }

    public function getDeliveryStatus()
    {
        return Yii::$app->params['delivery_status'][$this->delivery_status];
    }

    public function getPurchaseOrder($status = 1)
    {
        return $this->hasOne(PurchaseOrder::className(), ['id' => 'purchase_order_id'])
            ->alias('pu')
            ->onCondition(['pu.status' => $status]);
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
            if (($po = $this->purchaseOrder) != null) {
                $po->served_quantity = $po->served_quantity  + $this->quantity;
                $po->pending_quantity = $po->pending_quantity - $this->quantity;


                if ($po->pending_quantity == 0) {
                    $po->process_status = 3; //complete served
                }
                elseif ($po->served_quantity == 0) {
                    $po->process_status = 1; //Unserved served
                }
                else {
                    $po->process_status = 2; //partial served
                }

                $po->save();
            }
        }
        else {
            if ($this->status == 0) {
                if (($po = $this->purchaseOrder) != null) {
                    $po->served_quantity = $po->served_quantity  - $this->quantity;
                    $po->pending_quantity = $po->pending_quantity + $this->quantity;

                    if ($po->pending_quantity == 0) {
                        $po->process_status = 3; //complete served
                    }
                    elseif ($po->served_quantity == 0) {
                        $po->process_status = 1; //Unserved served
                    }
                    else {
                        $po->process_status = 2; //partial served
                    }
                    
                    $po->save();
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
                $general = Yii::$app->general;
                $max_id = AcknowledgmentReceipt::find()->max('id');
                $setting = $general->setting();
                
                $this->no = $general->invoice_num(
                    ($max_id + 1), 
                    $setting['ar_no_padding'], 
                    $setting['ar_no_prefix']
                );

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

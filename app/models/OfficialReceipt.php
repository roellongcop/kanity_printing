<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%official_receipt}}".
 *
 * @property string $id
 * @property string $sales_invoice_id
 * @property string $no
 * @property string $created_by
 * @property string $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 * @property string $date
 * @property string $received_from
 * @property string $tin
 * @property string $address
 * @property string $business_style
 * @property string $sum_of
 * @property string $payment_for
 * @property string $cashier
 */
class OfficialReceipt extends \yii\db\ActiveRecord
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
        return '{{%official_receipt}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sales_invoice_id', 'created_by', 'updated_by', 'status'], 'integer'],

            [['date', 'received_from', 'tin', 'address', 'business_style', 'sum_of', 'payment_for', 'cashier'], 'required'],

            [['created_at', 'updated_at', 'date'], 'safe'],
            [['address'], 'string'],
            [['no'], 'string', 'max' => 128],
            [['received_from', 'business_style', 'sum_of', 'payment_for', 'cashier'], 'string', 'max' => 256],
            [['tin'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sales_invoice_id' => 'Sales Invoice',
            'no' => 'No',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'date' => 'Date',
            'received_from' => 'Received From',
            'tin' => 'Tin',
            'address' => 'Address',
            'business_style' => 'Business Style',
            'sum_of' => 'Sum Of',
            'payment_for' => 'Payment For',
            'cashier' => 'Cashier',
        ];
    }


    public function getSalesInvoice($status = 1)
    {
        return $this->hasOne(SalesInvoice::className(), ['id' => 'sales_invoice_id'])
            ->alias('si')
            ->onCondition(['si.status' => $status]);
    }


    public function getUser($status = 1)
    {
        return $this->hasOne(User::className(), ['id' => 'user_id'])
            ->alias('u')
            ->onCondition(['u.status' => $status])
            ->via('quotation');
    }

    public function getQuotation($status = 1)
    {
        return $this->hasOne(Quotation::className(), ['id' => 'quotation_id'])
            ->alias('q')
            ->onCondition(['q.status' => $status])
            ->via('purchaseOrder');
    }

    public function getPurchaseOrder($status = 1)
    {
        return $this->hasOne(PurchaseOrder::className(), ['id' => 'purchase_order_id'])
            ->alias('pu')
            ->onCondition(['pu.status' => $status])
            ->via('salesInvoice');
    }

    public function getSalesInvoiceNo()
    {
        if (($model = $this->salesInvoice) != null) {
            return $model->no;
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
            foreach ($this->arrayAttr as $e) {
                if (is_array($this->$e)) {
                    $this->$e = json_encode($this->$e);
                }
            }

            if ($this->isNewRecord) {
                $general = Yii::$app->general;
                $max_id = OfficialReceipt::find()->max('id');
                $setting = $general->setting();
                
                $this->no = $general->invoice_num(
                    ($max_id + 1), 
                    $setting['or_no_padding'], 
                    $setting['or_no_prefix']
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

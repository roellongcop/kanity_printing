<?php

namespace app\models;

use Yii;
use app\models\search\PurchaseOrderSearch;
use app\models\search\QuotationSearch;


/**
 * This is the model class for table "{{%sales_invoice}}".
 *
 * @property string $id
 * @property string $purchase_order_id
 * @property string $created_by
 * @property string $updated_by
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 * @property string $no
 * @property string $pickup_date
 * @property string $prepared_by
 * @property string $noted_by
 * @property int $payment_status
 * @property string $company_name
 * @property string $company_address
 * @property string $contact_person
 */
class SalesInvoice extends \yii\db\ActiveRecord
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
        return '{{%sales_invoice}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['purchase_order_id', 'created_by', 'updated_by', 'status', 'payment_status'], 'integer'],
            [['created_at', 'updated_at', 'pickup_date', 'total', 'user_id', 'reason'], 'safe'],
            [[ 'prepared_by', 'noted_by', 'payment_status', 'company_name', 'company_address', 'contact_person'], 'required'],
            [['company_address'], 'string'],
            [['no'], 'string', 'max' => 128],
            [['prepared_by', 'noted_by', 'company_name', 'contact_person'], 'string', 'max' => 256],
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
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'no' => 'No',
            'reason' => 'Reason (applicable if "Unpaid")',
            'pickup_date' => 'Pickup Date',
            'prepared_by' => 'Prepared By',
            'noted_by' => 'Noted By',
            'payment_status' => 'Payment Status',
            'company_name' => 'Company Name',
            'company_address' => 'Company Address',
            'contact_person' => 'Contact Person',
        ];
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
            ->onCondition(['pu.status' => $status]);
    }

    public function getPurchaseOrderNo()
    {
        if (($model = $this->purchaseOrder) != null) {
            return $model->po_no;
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
            $_po = PurchaseOrderSearch::one($this->purchase_order_id);
            $_quotation = QuotationSearch::one($_po->quotation_id);
            $this->total = $_quotation->totalPrice;
            $this->user_id = $_quotation->user_id;


            foreach ($this->arrayAttr as $e) {
                if (is_array($this->$e)) {
                    $this->$e = json_encode($this->$e);
                }
            }

            if ($this->isNewRecord) {
                $general = Yii::$app->general;
                $max_id = SalesInvoice::find()->max('id');
                $setting = $general->setting();
                
                $this->no = $general->invoice_num(
                    ($max_id + 1), 
                    $setting['si_no_padding'], 
                    $setting['si_no_prefix']
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


    public function getPaymentStatus()
    {
        return Yii::$app->params['payment_status'][$this->payment_status];
    }
}

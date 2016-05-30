<?php

class BillSaleDetail extends CActiveRecord {

  public static function model($name = __CLASS__) {
    return parent::model($name);
  }

  public function tableName() {
    return 'bill_sale_detail';
  }
}

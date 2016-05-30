<?php

class PosController extends Controller {

  var $rows = 10;

  public function actionIndex() {
    echo 'Ready OK';
  }

  public function actionFormCompany() {
    $company = Company::model()->find();
    $this->renderPartial("//Pos/FormCompany", array(
      "company" => $company
    ));
  }

  public function actionSaveCompany() {
    $id = $_POST['id'];

    if (empty($id)) {
      // ถ้า id ว่าง ถือว่าเป็นการเพิ่มใหม่
      $company = new Company();
    } else {
      // ถ้า id ไม่ว่างให้ทำการแก้ไข
      $company = Company::model()->find();
    }

    $company->name = $_POST['name'];
    $company->tel = $_POST['tel'];
    $company->tax_code = $_POST['tax_code'];
    $company->address = $_POST['address'];
    $company->save();
  }

  public function actionFormProduct() {
    $this->renderPartial("//Pos/FormProduct");
  }

  public function actionSaveProduct() {
    $id = $_POST['id'];

    if (empty($id)) {
      $product = new Product();
    } else {
      $product = Product::model()->findByPk($id);
    }

    $product->barcode = $_POST['barcode'];
    $product->name = $_POST['name'];
    $product->price_get = $_POST['price_get'];
    $product->price_sale = $_POST['price_sale'];
    $product->qty = $_POST['qty'];
    $product->save();
  }

  public function actionDataProduct() {
    $page = isset($_POST['page']) ? intval($_POST['page']) : 1;
    $rows = isset($_POST['rows']) ? intval($_POST['rows']) :
      $this->rows;
    $offset = ($page - 1) * $rows;

    $products = Product::model()->findAll(array(
      "order" => "id DESC",
      "limit" => $rows,
      "offset" => $offset
    ));

    // format row
    foreach ($products as $p) {
      $p->price_get = number_format($p->price_get, 2);
      $p->price_sale = number_format($p->price_sale, 2);
      $p->qty = number_format($p->qty);
    }

    $arr['rows'] = $products;
    $arr['total'] = Product::model()->count();

    echo CJSON::encode($arr);
  }

  public function actionDialogProduct($id = null) {
    $product = new Product();

    if (!empty($id)) {
      if ($id != "undefined") {
        $product = Product::model()->findByPk($id);
      }
    }

    $this->renderPartial("//Pos/DialogProduct", array(
      'product' => $product
    ));
  }

  public function actionDeleteProduct($id) {
    Product::model()->deleteByPk($id);
  }

  public function actionSearchProduct() {
    $search = $_POST['search'];
    $products = Product::model()->findAll(array(
        'condition' => "
          barcode LIKE(:search)
          OR name LIKE(:search)
          OR price_get LIKE(:search)
          OR price_sale LIKE(:search)
        ",
        'params' => array(
          'search' => "%".$search."%"
        )
    ));

    echo CJSON::encode($products);
  }

  public function actionSale() {
    $this->renderPartial("//Pos/Sale");
  }

  public function actionDoSale() {
    $barcode = $_POST['barcode'];
    $qty = $_POST['qty'];

    if (!empty($barcode)) {
      $product = Product::model()->findByAttributes(array(
        'barcode' => $barcode
      ));

      // เก็บค่าลง session
      if (Yii::app()->session['dataSale'] == null) {
        $dataSale = array();
      } else {
        $dataSale = Yii::app()->session['dataSale'];
      }

      $arr_product = array(
        "total_row" => ($product->price_sale * $qty),
        "barcode" => $barcode,
        "qty" => $qty,
        "name" => $product->name,
        "price_sale" => $product->price_sale,
        "id" => $product->id,
        "price_get" => $product->price_get
      );

      $dataSale[] = $arr_product;
      Yii::app()->session['dataSale'] = $dataSale;
    }
  }

  public function actionResetSale() {
    Yii::app()->session['dataSale'] = null;
  }

  public function actionDataSale() {
    $dataSale = Yii::app()->session['dataSale'];

    if (!empty($dataSale)) {
      echo CJSON::encode($dataSale);
    }
  }

  public function actionSumSale() {
    $dataSale = Yii::app()->session['dataSale'];

    if (!empty($dataSale)) {
      $sum = 0;

      foreach ($dataSale as $row) {
        $sum += $row['total_row'];
      }

      echo number_format($sum, 2);
    } else {
      echo 0;
    }
  }

  public function actionEndSale() {
    $dataSale = Yii::app()->session['dataSale'];

    if (!empty($dataSale)) {
      // บันทึกบิลขาย
      $billSale = new BillSale();
      $billSale->created_date = new CDbExpression("NOW()");
      $billSale->save();

      // บันทึกรายละเอียดการขาย
      foreach ($dataSale as $row) {
        $billSaleDetail = new BillSaleDetail();
        $billSaleDetail->bill_sale_id = $billSale->id;
        $billSaleDetail->product_id = $row['id'];
        $billSaleDetail->price_get = $row['price_get'];
        $billSaleDetail->price_sale = $row['price_sale'];
        $billSaleDetail->save();
      }
    }
  }

}








// end

<form id="formProduct">
  <div>
    <label>บาร์โค้ด</label>
    <input type="text" name="barcode"
      value="<?php echo $product->barcode; ?>" />

    <label>ชื่อสินค้า</label>
    <input type="text" name="name"
      value="<?php echo $product->name; ?>" />
  </div>
  <div>
    <label>ราคาซื้อมา</label>
    <input type="text" name="price_get"
      value="<?php echo $product->price_get; ?>" />

    <label>ราคาจำหน่าย</label>
    <input type="text" name="price_sale"
      value="<?php echo $product->price_sale; ?>" />

    <label>จำนวน</label>
    <input type="text" name="qty"
      value="<?php echo $product->qty; ?>" />
  </div>

  <input type="hidden" name="id"
    value="<?php echo $product->id; ?>" />

</form>

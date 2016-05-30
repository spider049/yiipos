<form id="formSale">
  <div>
    <strong>บาร์โค้ด</strong>
    <input type="text" name="barcode"
      onkeyup="barcodeEnter(event)" />

    <label>จำนวน</label>
    <input type="text" name="qty" value="1" />
  </div>
</form>

<style>
  .sum {
    font-size: 25px;
    background: #f9f8f7;
    color: red;
    padding: 10px;
    display: inline-block;
    border: red 3px solid;
  }
</style>
<div style="text-align: right; margin-bottom: 3px;">
  <span class="sum" id="sum">5,000</span>
</div>
<table id="gridSale">
  <thead>
    <tr>
      <th field="barcode">บาร์โค้ด</th>
      <th field="name">สินค้า</th>
      <th field="price_sale" align="right">ราคาต่อหน่วย</th>
      <th field="qty" align="right">จำนวน</th>
      <th field="total_row" align="right">รวมเป็นเงิน</th>
    </tr>
  </thead>
</table>

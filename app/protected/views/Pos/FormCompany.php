<form id="formCompany">
  <div>
    <label>ชื่อ</label>
    <input type="text" name="name"
      value="<?php echo $company->name; ?>" />
  </div>
  <div>
    <label>เบอร์โทร</label>
    <input type="text" name="tel"
      value="<?php echo $company->tel; ?>" />
  </div>
  <div>
    <label>เลขประจำตัวผู้เสียภาษี</label>
    <input type="text" name="tax_code"
      value="<?php echo $company->tax_code; ?>" />
  </div>
  <div>
    <label>ที่อยู่</label>
    <input type="text" name="address"
      value="<?php echo $company->address; ?>" />
  </div>
  <div>
    <input type="hidden" name="id"
      value="<?php echo $company->id; ?>" />
    <label></label>
    <a href="#" class="easyui-linkbutton" onclick="saveCompany()">
      บันทึกรายการ
    </a>
  </div>
</form>

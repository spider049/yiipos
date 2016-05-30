
function formCompany() {
  $.ajax({
    url: 'index.php?r=Pos/FormCompany',
    success: function(data) {
      $(".layout-panel-center .panel-title").text("ฟอร์มข้อมูลร้าน");
      $("#content").html(data);
      $(".easyui-linkbutton").linkbutton();
    }
  });
}

function saveCompany() {
  $.ajax({
    url: 'index.php?r=Pos/SaveCompany',
    data: $("#formCompany").serialize(),
    type: 'POST',
    success: function(data) {
      alert("บันทึกรายการแล้ว");
    }
  });
}

function formProduct() {
  $.ajax({
    url: 'index.php?r=Pos/FormProduct',
    success: function(data) {
      $(".layout-panel-center .panel-title").text("ฟอร์มสินค้า");
      $("#content").html(data);
      $(".easyui-linkbutton").linkbutton();

      renderGridProduct('index.php?r=Pos/DataProduct', null);
    }
  });
}

function renderGridProduct(url, data) {
  $("#gridProduct").datagrid({
    fit: true,
    pagination: true,
    rownumbers: true,
    url: url,
    data: data,
    toolbar: [{
      iconCls: 'icon-remove',
      text: 'หน้าหลัก',
      handler: function() {
        renderGridProduct('index.php?r=Pos/DataProduct');
      }
    },{
      iconCls: 'icon-add',
      text: 'เพิ่มรายการ',
      handler: function() {
        dialogProduct();
      }
    }, {
      iconCls: 'icon-edit',
      text: 'แก้ไขรายการ',
      handler: function() {
        editProduct();
      }
    }, {
      iconCls: 'icon-search',
      text: 'ค้นหารายการ',
      handler: function() {
        dialogSearch();
      }
    }, {
      iconCls: 'icon-cancel',
      text: 'ลบรายการ',
      handler: function() {
        deleteProduct();
      }
    }]
  });
}

function saveProduct() {
  $.ajax({
    url: 'index.php?r=Pos/SaveProduct',
    data: $("#formProduct").serialize(),
    type: 'POST',
    success: function(data) {
      alert("บันทึกรายการแล้ว");
      $("#gridProduct").datagrid("reload");
    }
  });
}

function dialogProduct(id) {
  var d = $("<div style='padding: 10px'></div>").dialog({
    title: 'บันทึกข้อมูลสินค้า',
    width: 600,
    height: 200,
    href: 'index.php?r=Pos/DialogProduct&id=' + id,
    modal: true,
    buttons: [{
      text: 'บันทึกรายการ',
      iconCls: 'icon-save',
      handler: function() {
        saveProduct();
        d.dialog("destroy");
      }
    }, {
      text: 'ยกเลิก',
      iconCls: 'icon-cancel',
      handler: function() {
        d.dialog('destroy');
      }
    }]
  });
}

function deleteProduct() {
  var row = $("#gridProduct").datagrid("getSelected");
  var id = row.id;

  if (confirm("ต้องการลบรายการสินค้า " + row.name)) {
    $.ajax({
      url: 'index.php?r=Pos/DeleteProduct',
      data: {id: id},
      success: function() {
        renderGridProduct('index.php?r=Pos/DataProduct');
      }
    });
  }
}

function dialogSearch() {
  var html = "<input type='text' id='search' />";
  var d = $("<div style='padding: 10px'>"+html+"</div>").dialog({
    modal: true,
    iconCls: 'icon-search',
    draggable: false,
    width: 400,
    height: 120,
    title: 'ค้นหาข้อมูล',
    buttons: [{
      text: 'แสดง',
      iconCls: 'icon-ok',
      handler: function() {
        search();
        d.dialog("destroy");
      }
    }, {
      text: 'ยกเลิก',
      iconCls: 'icon-cancel',
      handler: function() {
        d.dialog("destroy");
      }
    }]
  });
}

function search() {
  $.ajax({
    url: 'index.php?r=Pos/SearchProduct',
    data: {
      'search': $("#search").val()
    },
    type: 'POST',
    dataType: 'json',
    success: function(data) {
      renderGridProduct(null, data);
    }
  });
}

function editProduct() {
  var row = $("#gridProduct").datagrid("getSelected");
  dialogProduct(row.id);
}

function formSale() {
  $.ajax({
    url: 'index.php?r=Pos/Sale',
    success: function(data) {
      $("#content").html(data);

      sumRow();

      $("#gridSale").datagrid({
        fit: true,
        url: 'index.php?r=Pos/DataSale',
        rownumbers: true,
        toolbar: [{
          text: 'เริ่มการขายใหม่',
          iconCls: 'icon-reload',
          handler: function() {
            $.ajax({
              url: 'index.php?r=Pos/ResetSale',
              success: function() {
                $("#cmdSale").trigger("click");
              }
            });
          }
        }, {
          text: 'จบการขาย',
          iconCls: 'icon-ok',
          handler: function() {
            $.ajax({
              url: 'index.php?r=Pos/EndSale',
              success: function() {
                resetSale();
              }
            });
          }
        }]
      });
    }
  });
}

function resetSale() {
  $.ajax({
    url: 'index.php?r=Pos/ResetSale',
    success: function() {
      $("#cmdSale").trigger("click");
    }
  });
}

// ดักการทำงานของเครื่องยิงบาร์โค้ด
function barcodeEnter(e) {
  if (e.keyCode == 13) {
    // ENTER
    doSale();
  }
}

function doSale() {
  $.ajax({
    url: 'index.php?r=Pos/DoSale',
    data: $("#formSale").serialize(),
    type: 'POST',
    success: function() {
      $("#gridSale").datagrid("reload");
      sumRow();
    }
  });
}

function sumRow() {
  $("#sum").load("index.php?r=Pos/SumSale");
}


// end

<html>
	<head>
		<meta charset="utf-8" />
		<title>โปรแกรมร้านค้า</title>

		<link rel="stylesheet"
			href="easyui/themes/icon.css" />
		<link rel="stylesheet"
			href="easyui/themes/black/easyui.css" />

		<script type="text/javascript"
			src="easyui/jquery.min.js">
		</script>
		<script type="text/javascript"
			src="easyui/jquery.easyui.min.js">
		</script>
		<script type="text/javascript"
			src="script.js">
		</script>

		<style>
			form div label {
				width: 120px;
				display: inline-block;
			}
		</style>

	</head>
	<body style="margin: 0px">
		<div class="easyui-layout" data-options="fit: true">
		    <div data-options="region:'north',title:'โปรแกรมร้านค้า version 1',split:false, collapsible: false" style="height:100px;"></div>
		    <div data-options="region:'west',title:'เมนูหลัก',split:true" style="width:150px;">
					<div class="easyui-accordion">
						<div title="บันทึกประจำวัน" iconCls="icon-tip">
							<div style="padding: 5px">
								<a onclick="formSale()"
									class="easyui-linkbutton"
									data-options="plain: true"
									iconCls="icon-ok"
									id="cmdSale">
									ขายสินค้า
								</a>
							</div>
						</div>
						<div title="รายงาน" iconCls="icon-tip"></div>
						<div title="ตั้งค่าระบบ" iconCls="icon-tip" style="padding: 10px">
							<div><a onclick="formProduct()" class="easyui-linkbutton" data-options="iconCls: 'icon-ok', plain: true">ข้อมูลสินค้า</a></div>
							<div><a onclick="formCompany()" class="easyui-linkbutton" data-options="iconCls: 'icon-ok', plain: true">ข้อมูลร้าน</a></div>
						</div>
					</div>
				</div>
		    <div id="content" data-options="region:'center',title:'center title'" style="padding:5px;"></div>
		</div>
	</body>
</html>

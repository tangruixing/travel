<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Roomstyle管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="roomstyle_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="roomstyle_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="roomstyle_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="roomstyle_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="roomstyle_grid" data-options="fit:true,border:false"></table>
	</div>
</body>


<script type="text/javascript">
        $(function () {
        	var gdOptions={
        			columns:[[{
                        title : '编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true
	                    },{
						title : '名字',
						field : 'realName',
						width : 100,
						sortable : true
						},{
						title : '床型',
						field : 'bedStyle',
						width : 100,
						sortable : true,
					  	formatter: function (value, row, index) {
					  		switch(row.bedStyle)
							{
							case 1:
								return "大床";
							  break;
							case 2:
								return "双人床";
							  break;
							case 3:
								return "单床";
							  break;
							case 4:
								return "多人床";
							  break;
							}
                        }
						},{
						title : '最多可入住人数',
						field : 'limitPerson',
						width : 100,
						sortable : true
						},{
						title : '早餐',
						field : 'breakfast',
						width : 100,
						sortable : true,
						formatter: function (value, row, index) {
					  		switch(row.breakfast)
							{
							case 1:
								return "双份";
							  break;
							case 2:
								return "多份";
							  break;
							case 3:
								return "不含";
							  break;
							case 4:
								return "单份";
							  break;
							}
                        }
						},{
						title : '宽带',
						field : 'broadband',
						width : 100,
						sortable : true,
						formatter: function (value, row, index) {
					  		switch(row.broadband)
							{
							case 1:
								return "无线免费";
							  break;
							case 2:
								return "有线免费";
							  break;
							}
                        }
						},{
						title : '取消政策',
						field : 'cancel',
						width : 100,
						sortable : true,
						formatter: function (value, row, index) {
					  		switch(row.cancel)
							{
							case 1:
								return "可取消";
							  break;
							case 2:
								return "不可取消";
							  break;
							}
                        }
						},{
						title : '价格',
						field : 'price',
						width : 100,
						sortable : true
						},{
						title : '数量',
						field : 'number',
						width : 100,
						sortable : true
						},{
						title : '图片',
						field : 'picture',
						width : 100,
						sortable : true
						},{
						title : '介绍',
						field : 'introduce',
						width : 100,
						sortable : true
						}]]		
        	};
        	var dlgOptions={
            		title: '房型',
          		    width: '80%',
          		    height: '60%',
          			onClose:function(){
        		  		parent.UE.getEditor('roomstyle_content').destroy();
        		  		parent.mainDlg.parentDlg.dialog('destroy');
        		    },
        	}         
        	var roomstyle=new Base("roomstyle",gdOptions,dlgOptions,parent.mainDlg);
            roomstyle.setUrlParam("hotId","${hotId}");
            roomstyle.setUrlParam("hotname","${hotname}");
            roomstyle.loadGrid();
        });
    </script>
</html>

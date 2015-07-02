<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Travels管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="travels_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="travels_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="travels_grid" data-options="fit:true,border:false"></table>
	</div>
</body>

<script type="text/javascript">
        $(function () {
        	
        	 var gdOptions={
        			 columns:[[{
                         title : '用户编号',
                         field : 'id',// 绑定属性名字,后台返回的json数据
                         width : 100,// 必须要给，大于50
                         sortable : true,// 鼠标点击可以升序/降序切换
                         checkbox : true

                     },{
 					title : '发表游记',
 					field : 'userName',
 					width : 100,
 					sortable : true
 					},{
 					title : '标题',
 					field : 'title',
 					width : 100,
 					sortable : true
 					},{
 					title : '发布时间',
 					field : 'publicTime',
 					width : 100,
 					sortable : true
 					},{
 					title : '浏览量',
 					field : 'click',
 					width : 100,
 					sortable : true
 					}]]	 
        	 };
        	 var dlgOptions={
             		title: '游记',
           		    width: '60%',
           		    height: '80%',
           			onClose:function(){
         		  		parent.UE.getEditor('travels_content').destroy();
         		  		parent.mainDlg.parentDlg.dialog('destroy');
         		    },
         	}  
            var travels=new Base("travels",gdOptions,dlgOptions,parent.mainDlg);
            travels.loadGrid();
        });
    </script>
</html>

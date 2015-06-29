<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<%@ include file="/WEB-INF/pub/webuploader.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Friendlink管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="friendlink_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="friendlink_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="friendlink_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="friendlink_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="friendlink_grid" data-options="fit:true,border:false"></table>
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
				title : '合作伙伴',
				field : 'realName',
				width : 100,
				sortable : true
				},{
				title : '合作伙伴链接',
				field : 'url',
				width : 100,
				sortable : true
				},{
				title : 'logo',
				field : 'logo',
				width : 100,
				sortable : true,
				formatter: function (value, row, index) {
             	   var str="";
                   str+=sy.fs('<img   src="{0}"  style="width:50px;height:50px"/>','<%=contextPath%>/'+row.logo);
                   return str;
             		 }
				},{
				title : '友好程度',
				field : 'grade',
				width : 100,
				sortable : true
				}]]
        	};
        	var dlgOptions={
            		title: '友情链接',
          		    width: '80%',
          		    height: '60%',
          		    onClose:function(){
          		  		parent.mainDlg.parentDlg.dialog('destroy');
          		    }
        	}  
                    
        	var friendlink=new Base("friendlink",gdOptions,dlgOptions,parent.mainDlg);
            friendlink.loadGrid();
        });
        
    	
    </script>
</html>

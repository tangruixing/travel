<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<%@ include file="/WEB-INF/pub/markMap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Hotel管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="hotel_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="hotel_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="hotel_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="hotel_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="hotel_grid" data-options="fit:true,border:false"></table>
	</div>
	
<!-- 地图显示-->
<div id="mapDlg" class="easyui-dialog dis" style="width:80%;height:60%;"
     closed="true" buttons="#dlg-map-buttons"  modal="true">
    <div id="show-map" style="width:100%;height:100%"></div>
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
				title : 'logo',
				field : 'logo',
				width : 100,
				formatter: function (value, row, index) {
	             	   var str="";
	                   str+=sy.fs('<img   src="{0}"  style="width:50px;height:50px"/>','<%=contextPath%>/'+row.logo);
	                   return str;
	            }
				},{
				title : '名称',
				field : 'realName',
				width : 100,
				sortable : true
				},{
				title : '地址',
				field : 'address',
				width : 100,
				sortable : true
				},{
				title : '酒店级别',
				field : 'grade',
				width : 100,
				sortable : true,
				  formatter: function (value, row, index) {
                       return row.grade+"星级";
                 }
				},{
				title : '酒店电话',
				field : 'telphone',
				width : 100,
				sortable : true
				},{
                    title : '操作',
                    field : 'action',
                    width : 100,
                    formatter: function (value, row, index) {
                    	 var str="";
                          str+=sy.fs('<a class="easyui-linkbutton" href="{0}?hotId={1}&hotname={2}">房型</a>',"<%=contextPath%>/roomstyle_toIndex.do",row.id,row.realName);
                          str+="&nbsp"
                          str+=sy.fs('<input  type="button" onclick="showMap(\'{0}\',\'{1}\')" class="easyui-linkbutton" value="地图" />',row.longitude,row.latitude);
                          return str;
                    }
                }]]	
        	};
                    
        	var dlgOptions={
            		title: '酒店',
          		    width: '80%',
          		    height: '80%',
          		    onClose:function(){
          		  		parent.UE.getEditor('hotel_content').destroy();
          		  		parent.mainDlg.parentDlg.dialog('destroy');
          		    }
        	}  
            var hotel=new Base("hotel",gdOptions,dlgOptions,parent.mainDlg);
            hotel.loadGrid();
            Location.showLocation();
        });
        
        function showMap(lg,lz){
        	Location.showDlgMap(lg,lz,18);
        }
    </script>
    
</html>

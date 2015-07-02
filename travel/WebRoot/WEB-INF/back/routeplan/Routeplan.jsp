<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Routeplan管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="routeplan_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="routeplan_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="routeplan_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="routeplan_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false,title:'<${rname}>',">
		<table id="routeplan_grid" data-options="fit:true,border:false"></table>
	</div>
</body>

<script type="text/javascript">
        $(function () {
        	var gdOptions={
        			 columns:[[{
                         title : '途径地点编号',
                         field : 'id',// 绑定属性名字,后台返回的json数据
                         width : 100,// 必须要给，大于50
                         sortable : true,// 鼠标点击可以升序/降序切换
                         checkbox : true
                     	},{
 						title : '风景',
 						field : 'sceId',
 						width : 100,
 						sortable : true,
 						 formatter: function (value, row, index) {
 	                          return row.sceneryName;
 	                        }
 						},{
 						title : '步骤',
 						field : 'step',
 						width : 100,
 						sortable : true
 						},{
 						title : '停留天数',
 						field : 'day',
 						width : 100,
 						sortable : true
 						},{
 						title : '描述',
 						field : 'description',
 						width : 100,
 						sortable : true
 						},{
                         title : '操作',
                         field : 'action',
                         width : 100,
                         formatter: function (value, row, index) {
                            /*  var str="";
                              str+=sy.fs('<img   src="{0}"  onclick="demo1(\'{1}\')"  title="1" />',"../style/images/myIcons/key_add.png",row.id);
                              str+="&nbsp"
                              str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/routeplan_delete.png",row.id);
                              return str;*/
                         }
                     }]]	
        	}
                    
        	var dlgOptions={
            		title: '线路',
          		    width: '80%',
          		    height: '80%',
        	}  
            var routeplan=new Base("routeplan",gdOptions,dlgOptions,parent.mainDlg);
        	routeplan.setUrlParam("rouId","${rouId}");
        	routeplan.setUrlParam("rname","${rname}");
            routeplan.loadGrid();
          
        });
        
        
       
    </script>
</html>

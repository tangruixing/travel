<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>User管理</title>
    
    <script type="text/javascript" src="<%=contextPath%>/back/style/js/UniqueCheck.js"></script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="user_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="user_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="user_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="user_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="user_grid" data-options="fit:true,border:false"></table>
	</div>
</body>
<script type="text/javascript">
        $(function () {
            var gdOptions={
            		columns:[[{
                        title : '用户编号',
                        field : '"id"',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true

                    },{
					title : '手机号',
					field : 'mobile',
					width : 100,
					sortable : true
					},{
					title : '密码',
					field : 'pwd',
					width : 100,
					sortable : true
					},{
					title : '角色',
					field : 'role',
					width : 100,
					sortable : true,
					formatter : function(value, row, index) {
						
						switch(row.role)
						{
						case 1:
							return "管理员";
						  break;
						case 2:
							return "普通用户";
						  break;
						}
					}
					},{
					title : '邮箱',
					field : 'email',
					width : 100,
					sortable : true
					},{
					title : '名字',
					field : 'realName',
					width : 100,
					sortable : true
					},{
					title : '性别',
					field : 'sex',
					width : 100,
					sortable : true,
					formatter : function(value, row, index) {
						
						switch(row.sex)
						{
						case 1:
							return "男";
						  break;
						case 2:
							return "女";
						  break;
						default:
							return "保密";
						}
					
					}
					},{
					title : '出生日期',
					field : 'birth',
					width : 100,
					sortable : true
					},{
                        title : '操作',
                        field : 'action',
                        width : 100,
                        formatter: function (value, row, index) {
                        }
                    }]]
            }
                    
        	var dlgOptions={
            		title: '用户',
          		    width: '80%',
          		    height: '60%',
        	}  
            var user=new Base("user",gdOptions,dlgOptions,parent.mainDlg);
            user.loadGrid();
        });
        
        
    </script>
</html>

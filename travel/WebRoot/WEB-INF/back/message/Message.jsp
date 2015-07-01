<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Message管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="message_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="message_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="message_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="message_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="message_grid" data-options="fit:true,border:false"></table>
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
 						title : '用户编号id',
 						field : 'userId',
 						width : 100,
 						sortable : true
 						},{
 						title : '用户编号id',
 						field : 'adminId',
 						width : 100,
 						sortable : true
 						},{
 						title : '内容',
 						field : 'content',
 						width : 100,
 						sortable : true
 						},{
 						title : '状态',
 						field : 'stats',
 						width : 100,
 						sortable : true
 						},{
 						title : '回复时间',
 						field : 'createDate',
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
                              str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/message_delete.png",row.id);
                              return str;*/
                         }
                     }]]
        	}
           
        		var dlgOptions={
            		title: '回复',
          		    width: '80%',
          		    height: '60%',
          			onClose:function(){
        		  		parent.mainDlg.parentDlg.dialog('destroy');
        		    },
        	}  
            var message=new Base("message",gdOptions,dlgOptions,parent.mainDlg);
            message.loadGrid();         
        });
    </script>
</html>

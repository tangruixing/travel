<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Roombook管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="roombook_deleteBtn">取消</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="roombook_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="roombook_grid" data-options="fit:true,border:false"></table>
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
					 field : 'useid',
					 width : 100,
					 sortable : true
					 },{
					 title : '房型ID',
					 field : 'rooId',
					 width : 100,
					 sortable : true
					 },{
					 title : '预定时间',
					 field : 'creatDate',
					 width : 100,
					 sortable : true
					 },{
					 title : '入住日期',
					 field : 'enterDate',
					 width : 100,
					 sortable : true
					 },{
					 title : '离开日期',
					 field : 'leaveDate',
					 width : 100,
					 sortable : true
					 },{
					 title : '名字',
					 field : 'realName',
					 width : 100,
					 sortable : true
					 },{
					 title : '房间数量',
					 field : 'roomNum',
					 width : 100,
					 sortable : true
					 },{
					 title : '手机号',
					 field : 'telphone',
					 width : 100,
					 sortable : true
					 },{
					 title : '邮箱',
					 field : 'email',
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
                              str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/roombook_delete.png",row.id);
                              return str;*/
                         }
                     }]]	 
        	 }; 
        	 var dlgOptions={
             		title: '酒店预订',
           		    width: '80%',
           		    height: '60%',
           			onClose:function(){
         		  		parent.mainDlg.parentDlg.dialog('destroy');
         		    },
         	}  
            var roombook=new Base("roombook",gdOptions,dlgOptions,parent.mainDlg);
            roombook.loadGrid();
        });
    </script>
</html>

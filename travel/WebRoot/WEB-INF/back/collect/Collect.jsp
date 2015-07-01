<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Collect管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="collect_deleteBtn">取消</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="collect_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="collect_grid" data-options="fit:true,border:false"></table>
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
					title : '用户姓名',
					field : 'userName',
					width : 100,
					sortable : true
					},{
					title : '线路名称',
					field : 'rouName',
					width : 100,
					sortable : true
					},{
					title : '收藏时间',
					field : 'creatDate',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/collect_delete.png",row.id);
                             return str;*/
                        }
                    }]]		
        	}
           
        	var dlgOptions={
            		title: '收藏',
          		    width: '80%',
          		    height: '60%',
          			onClose:function(){
        		  		parent.UE.getEditor('collect_content').destroy();
        		  		parent.mainDlg.parentDlg.dialog('destroy');
        		    },
        	}  
        	var collect=new Base("collect",gdOptions,dlgOptions,parent.mainDlg);
            collect.loadGrid();
        
        });
    </script>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Scenery管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="scenery_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="scenery_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="scenery_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="scenery_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="scenery_grid" data-options="fit:true,border:false"></table>
	</div>
</body>

<script type="text/javascript">
        $(function () {
        	var parent_gdOptions={
        			columns:[[{
                        title : '景区编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true
                    },{
					title : '景区名称',
					field : 'realName',
					width : 100,
					sortable : true
					},{
					title : '地址',
					field : 'address',
					width : 100,
					sortable : true
					},{
					title : '经度',
					field : 'longitude',
					width : 100,
					sortable : true
					},{
					title : '纬度',
					field : 'latitude',
					width : 100,
					sortable : true
					},{
					title : 'logo',
					field : 'logo',
					width : 100,
					sortable : true
					},{
					title : '网址',
					field : 'url',
					width : 100,
					sortable : true
					},{
					title : '开放时间',
					field : 'openDime',
					width : 100,
					sortable : true,
					 formatter: function (value, row, index) {
						   
                       	return row.startTime+"-"+row.endTime;
                      }
					},{
					title : '景区级别',
					field : 'grade',
					width : 100,
					sortable : true
					},{
					title : '景区联系电话',
					field : 'telphone',
					width : 100,
					sortable : true
					},{
					title : '轮播',
					field : 'viwepager',
					width : 100,
					sortable : true
					},{
					title : '推荐',
					field : 'suggest',
					width : 100,
					sortable : true
					},{
                        title : '操作',
                        field : 'action',
                        width : 100,
                        formatter: function (value, row, index) {
                        }
                    }]]	
        	};
        	var child_gdOptions={
        			columns:[[{
                        title : '景点编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true
                    },{
					title : '景点名称',
					field : 'realName',
					width : 100,
					sortable : true
					},{
						title : '景区名称',
						field : 'parentName',
						width : 100,
						sortable : true
					},{
					title : '地址',
					field : 'address',
					width : 100,
					sortable : true
					},{
					title : '经度',
					field : 'longitude',
					width : 100,
					sortable : true
					},{
					title : '纬度',
					field : 'latitude',
					width : 100,
					sortable : true
					},{
					title : 'logo',
					field : 'logo',
					width : 100,
					sortable : true
					},{
					title : '联系电话',
					field : 'telphone',
					width : 100,
					sortable : true
					},{
					title : '推荐',
					field : 'suggest',
					width : 100,
					sortable : true
					}]]	
        	};
        	var dlgOptions={
            		title: '风景',
          		    width: '80%',
          		    height: '60%',
          		    onClose:function(){
          		  		parent.UE.getEditor('scenery_content').destroy();
          		  		parent.mainDlg.parentDlg.dialog('destroy');
          		    },
        	};
        	
        	var gdOptions=null;
        	if(${type}==1){//景区
        		gdOptions=parent_gdOptions;
        	}
        	if(${type}==2){//景点
        		gdOptions=child_gdOptions;
        	}
        	
        	
            var scenery=new Base("scenery",gdOptions,dlgOptions,parent.mainDlg);
        	scenery.setUrlParam("type","${type}");
            scenery.loadGrid();
        });
    </script>
</html>

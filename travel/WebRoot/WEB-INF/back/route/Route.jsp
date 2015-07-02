<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>Route管理</title>
    <style type="text/css">
        body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #show-map{height:450px;width:750px;}
        #r-result{width:100%; font-size:14px;line-height:20px;}
        .mapLable{height:100px;}
    </style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CA3NlRi4BRVc5elDe4l0tXnu"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
<script type="text/javascript"	src="<%=contextPath%>/back/style/js/line.js"	charset="utf-8"></script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="route_saveBtn">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="route_updateBtn">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="route_deleteBtn">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="route_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="route_grid" data-options="fit:true,border:false"></table>
	</div>
	
	<!-- 地图连线-->
<div id="mapDlg" class="easyui-dialog dis" style="width:80%;height:60%;"
     closed="true" buttons="#dlg-map-buttons"  modal="true">
    <div id="show-map" style="width:100%;height:100%"></div>
</div>	

</body>


<script type="text/javascript">
        $(function () {
        	var pay_gdOptions={
        			columns:[[{
                        title : '用户编号',
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
						title : 'logo',
						field : 'logo',
						width : 100,
						sortable : true,
						formatter: function (value, row, index) {
							console.info(sy.contextPath+"/"+row.logo);
							var path=sy.contextPath+"/"+row.logo;
                      		var str="";
                            str+=sy.fs('<img   src="{0}"  style="width:50px;height:50px"/>',path);
                            return str;
                       }
						},{
						title : '报名截止',
						field : 'regDate',
						width : 100,
						sortable : true
						},{
						title : '出发时间',
						field : 'startDate',
						width : 100,
						sortable : true
						},{
						title : '结束时间',
						field : 'endDate',
						width : 100,
						sortable : true
						},{
						title : '类型(测试看)',
						field : 'routeType',
						width : 100,
						sortable : true
						},{
						title : '价钱',
						field : 'money',
						width : 100,
						sortable : true
						},{
						title : '总人数',
						field : 'numPeople',
						width : 100,
						sortable : true
						},{
                        title : '操作',
                        field : 'action',
                        width : 200,
                        formatter: function (value, row, index) {
                        	
                       		 var str="";
                             str+=sy.fs('<a href="{0}?rouId={1}&rname={2}">地点</a>',"<%=contextPath%>/routeplan_toIndex.do",row.id,row.realName);
                             str+="&nbsp"
                             str+=sy.fs('<input  type="button" onclick="showMap(\'{0}\')" class="easyui-linkbutton" value="地图" />',row.id);
                             return str;
                        }
                    }]]
        	};
        	
        	var free_gdOptions={
        			columns:[[{
                        title : '用户编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true
                    	},{
						title : '名称',
						field : 'realName',
						width : 100,
						sortable : true
						},{
						title : 'logo',
						field : 'logo',
						width : 100,
						sortable : true,
						formatter: function (value, row, index) {
							console.info(sy.contextPath+"/"+row.logo);
							var path=sy.contextPath+"/"+row.logo;
                      		var str="";
                            str+=sy.fs('<img   src="{0}"  style="width:50px;height:50px"/>',path);
                            return str;
                       }
						},{
						title : '预计人均消费',
						field : 'money',
						width : 100,
						sortable : true
						},{
                        title : '操作',
                        field : 'action',
                        width : 200,
                        formatter: function (value, row, index) {
                        	
                       		 var str="";
                             str+=sy.fs('<a href="{0}?rouId={1}&rname={2}">地点</a>',"<%=contextPath%>/routeplan_toIndex.do",row.id,row.realName);
                             str+="&nbsp"
                             str+=sy.fs('<input  type="button" onclick="showMap(\'{0}\')" class="easyui-linkbutton" value="地图" />',row.id);
                             return str;
                        }
                    }]]
        	};
                    
        	var pay_dlgOptions={
            		title: '旅游线路',
          		    width: '80%',
          		    height: '60%',
          		  	onClose:function(){
          		  		parent.UE.getEditor('router_content').destroy();
        		  		 parent.mainDlg.parentDlg.dialog('destroy');
        		    },
        	};
        	var free_dlgOptions={
            		title: '自由行',
          		    width: '80%',
          		    height: '60%',
          		  	onClose:function(){
        		  		parent.UE.getEditor('router_content').destroy();
        		  	/* 	parent.UE.getEditor('router_suggest').destroy(); */
        		  		parent.mainDlg.parentDlg.dialog('destroy');
        		    },
        	};
        	var dlgOptions=null;
        	var gdOptions=null;
        	if(${routeType}==0){//旅游线路
        		gdOptions=pay_gdOptions;
        		dlgOptions=pay_dlgOptions;
        	}
        	if(${routeType}==1){//自由行
        		gdOptions=free_gdOptions;
        		dlgOptions=free_dlgOptions;
        	}
        	
            var route=new Base("route",gdOptions,dlgOptions,parent.mainDlg);
        	route.setUrlParam("routeType","${routeType}");
            route.loadGrid();
        });
       
        var url=sy.contextPath + '/routeplan_loadRouteplanWithRid.do';
     	
        var line=new myLine();
      	function showMap(id){
      		
			var value={
				rid:id	
			}
			line.lineDlgMap(url,value);
      	}
      	
      	line.closeDlg();
      
    </script>
</html>

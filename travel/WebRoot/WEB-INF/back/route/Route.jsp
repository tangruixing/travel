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
<body>
<!-- 地图连线-->
<div id="mapDlg" class="easyui-dialog dis" style="width:80%;height:60%;"
     closed="true" buttons="#dlg-map-buttons"  modal="true">
    <div id="show-map" style="width:100%;height:100%"></div>
</div>	

	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="route_search_fm">
				<table id="route_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="route_search" class="easyui-linkbutton">查询</a> 
							<a id="route_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="route_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="route_dg"></table>
		</div>

</div>



</body>

<script type="text/javascript">
        $(function () {
            var columns=[[{
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
                        	
                      		 var str="";
                            str+=sy.fs('<img   src="{0}"  style="width:50px;height:50px"/>','<%=contextPath%>/'+row.logo);
                          
   
                            
                            return str;
                       }
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
						title : '类型',
						field : 'routeType',
						width : 100,
						sortable : true
						},{
						title : '价钱',
						field : 'money',
						width : 100,
						sortable : true
						},{
						title : '报名人数',
						field : 'numPeople',
						width : 100,
						sortable : true
						},{
						title : '推荐',
						field : 'suggest',
						width : 100,
						sortable : true
						},{
						title : '行程建议',
						field : 'content',
						width : 100,
						sortable : true
						},{
                        title : '操作',
                        field : 'action',
                        width : 200,
                        formatter: function (value, row, index) {
                        	
                       		 var str="";
                            /*  str+=sy.fs('<img   src="{0}"  onclick="demo1(\'{1}\')"  title="1" />',"../style/images/myIcons/key_add.png",row.id);
                             str+="&nbsp" */
                             str+=sy.fs('<a href="{0}?rouId={1}&rname={2}">添加</a>',"<%=contextPath%>/routeplan_toIndex.do",row.id,row.realName);
                             str+="&nbsp"
                             str+=sy.fs('<input  type="button" onclick="showMap(\'{0}\')" class="easyui-linkbutton" value="地图" />',row.id);
                         
                             
                             
                             
                             return str;
                        }
                    }]];
                    
            var route=new Curd("<%=contextPath%>","route",columns);
            route.useCommon();
            route.init();
            
        	
          
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

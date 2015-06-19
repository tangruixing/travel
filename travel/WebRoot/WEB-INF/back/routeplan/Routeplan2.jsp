<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Routeplan管理</title>
</head>

<script type="text/javascript" src="<%=contextPath %>/jslib/easyui-1.4.2/datagrid-dnd.js"></script>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout" data-options="title:'${rname}线路'">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="routeplan_search_fm">
				<table id="routeplan_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="routeplan_search" class="easyui-linkbutton">查询</a> 
							<a id="routeplan_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="routeplan_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="routeplan_dg"></table>
		</div>

</div>

<!--form-->
<div id="routeplan_dlg" class="easyui-dialog"
     closed="true" buttons="#routeplan_dlg-buttons" modal="true" style="width:50%;height:80%;padding:10px 20px">
    <div class="ftitle"><${rname}>线路信息</div>
    <form id="routeplan_fm" method="post">
   
	<s:hidden name="rouId" />
	<s:hidden name="id" />

        <table>
			
		
		
		<tr>	
			<td>
				景点
			</td>	
			<td><!-- class="easyui-validatebox" required="true"  missingMessage="景点不能为空" -->
				<input id="sceId" name="sceId"  >
			</td>
		</tr>
	
	
		
		
		<tr>	
			<td>
				步骤
			</td>	
			<td>
			<input name="step" class="easyui-validatebox textbox" required="true"  missingMessage="步骤不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				停留天数
			</td>	
			<td>
			<input name="day" class="easyui-validatebox textbox" required="true"  missingMessage="停留天数不能为空">
			</td>
		</tr>
	
		
		<tr>	
			<td>
				描述
			</td>	
			<td>
				<input class="easyui-textbox easyui-validatebox" name="description" data-options="multiline:true" style="height:60px"></input>
			</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="routeplan_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="routeplan_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="routeplan_close" style="width:90px">取消</a>
</div>
</body>

<script type="text/javascript">
        $(function () {
        	
            var columns=[[{
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
                    }]];
                    
            var routeplan=new Curd("<%=contextPath%>","routeplan",columns);
            routeplan.setUrlParam("rouId","${rouId}");
            routeplan.openDnd();
            routeplan.init();
        	routeplan.dg.datagrid({
        		onDrop:function(){
        			
        		}
        	});
            
            $('#sceId').combogrid({ 
            	panelWidth:450,
                idField:'id', //ID字段  
                textField:'realName', //显示的字段  
                url:"<%=contextPath%>/scenery_doList.do",  
                fitColumns: true,  
                striped: true,  
                editable:true,  
                pagination : true,//是否分页  
                rownumbers:true,//序号  
                collapsible:false,//是否可折叠的  
                fit: true,//自动大小  
                pageSize: 10,//每页显示的记录条数，默认为10  
                pageList: [10],//可以设置每页记录条数的列表  
                method:'post',  
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
    				title : '开放时间',
    				field : 'openDime',
    				width : 100,
    				sortable : true
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
    				}]]
            });  
        });
        
        
       
    </script>
</html>

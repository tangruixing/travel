<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Route管理</title>
</head>
<body>
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

<!--form-->
<div id="route_dlg" class="easyui-dialog"
     closed="true" buttons="#route_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="route_fm" method="post">
	<input type="hidden"  name="id" />

        <table>
			
		
			<tr>	
				<td>
					用户编号id
				</td>	
				<td>
					<input name="useid" >
				</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>名字
			</td>	
			<td>
			<input name="realName" class="easyui-validatebox textbox" required="true"  missingMessage="名字不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>logo
			</td>	
			<td>
			<input name="logo" class="easyui-validatebox textbox" required="true"  missingMessage="logo不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>出发时间
			</td>	
			<td>
			<input name="startDate" class="easyui-validatebox textbox" required="true"  missingMessage="出发时间不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>结束时间
			</td>	
			<td>
			<input name="endDate" class="easyui-validatebox textbox" required="true"  missingMessage="结束时间不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>类型
			</td>	
			<td>
			<input name="routeType" class="easyui-validatebox textbox" required="true"  missingMessage="类型不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>价钱
			</td>	
			<td>
			<input name="money" class="easyui-validatebox textbox" required="true"  missingMessage="价钱不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>描述
			</td>	
			<td>
			<input name="description" class="easyui-validatebox textbox" required="true"  missingMessage="描述不能为空">
			</td>
		</tr>
	
		
			<tr>	
				<td>
					报名人数
				</td>	
				<td>
					<input name="numPeople" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					推荐
				</td>	
				<td>
					<input name="suggest" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					行程建议
				</td>	
				<td>
					<input name="content" >
				</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="route_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="route_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="route_close" style="width:90px">取消</a>
</div>
</body>

<script type="text/javascript">
        $(function () {
            var columns=[[{
                        title : '用户编号',
                        field : '"id"',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true

                    },
								{
title : '用户编号id',
field : 'useid',
width : 100,
sortable : true
},								{
title : '名字',
field : 'realName',
width : 100,
sortable : true
},								{
title : 'logo',
field : 'logo',
width : 100,
sortable : true
},								{
title : '出发时间',
field : 'startDate',
width : 100,
sortable : true
},								{
title : '结束时间',
field : 'endDate',
width : 100,
sortable : true
},								{
title : '类型',
field : 'routeType',
width : 100,
sortable : true
},								{
title : '价钱',
field : 'money',
width : 100,
sortable : true
},								{
title : '描述',
field : 'description',
width : 100,
sortable : true
},								{
title : '报名人数',
field : 'numPeople',
width : 100,
sortable : true
},								{
title : '推荐',
field : 'suggest',
width : 100,
sortable : true
},								{
title : '行程建议',
field : 'content',
width : 100,
sortable : true
},								{
                        title : '操作',
                        field : 'action',
                        width : 100,
                        formatter: function (value, row, index) {
                           /*  var str="";
                             str+=sy.fs('<img   src="{0}"  onclick="demo1(\'{1}\')"  title="1" />',"../style/images/myIcons/key_add.png",row.id);
                             str+="&nbsp"
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/route_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var route=new Curd("<%=contextPath%>","route",columns);
            route.init();
        });
    </script>
</html>

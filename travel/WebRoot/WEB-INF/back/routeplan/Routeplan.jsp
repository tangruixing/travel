<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Routeplan管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
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
     closed="true" buttons="#routeplan_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="routeplan_fm" method="post">
	<input type="hidden"  name="id" />

        <table>
			
		
		
		<tr>	
			<td>
				<span class="required">*</span>风景ID
			</td>	
			<td>
			<input name="sceId" class="easyui-validatebox textbox" required="true"  missingMessage="风景ID不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>线路ID
			</td>	
			<td>
			<input name="rouId" class="easyui-validatebox textbox" required="true"  missingMessage="线路ID不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>步骤
			</td>	
			<td>
			<input name="step" class="easyui-validatebox textbox" required="true"  missingMessage="步骤不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>停留天数
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
					<input name="description" >
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
                        title : '用户编号',
                        field : '"id"',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true

                    },
								{
title : '风景ID',
field : 'sceId',
width : 100,
sortable : true
},								{
title : '线路ID',
field : 'rouId',
width : 100,
sortable : true
},								{
title : '步骤',
field : 'step',
width : 100,
sortable : true
},								{
title : '停留天数',
field : 'day',
width : 100,
sortable : true
},								{
title : '描述',
field : 'description',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/routeplan_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var routeplan=new Curd("<%=contextPath%>","routeplan",columns);
            routeplan.init();
        });
    </script>
</html>

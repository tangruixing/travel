<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Travels管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="travels_search_fm">
				<table id="travels_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="travels_search" class="easyui-linkbutton">查询</a> 
							<a id="travels_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="travels_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="travels_dg"></table>
		</div>

</div>

<!--form-->
<div id="travels_dlg" class="easyui-dialog"
     closed="true" buttons="#travels_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="travels_fm" method="post">
	<input type="hidden"  name="id" />

        <table>
			
		
		
		<tr>	
			<td>
				<span class="required">*</span>用户编号id
			</td>	
			<td>
			<input name="useid" class="easyui-validatebox textbox" required="true"  missingMessage="用户编号id不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>标题
			</td>	
			<td>
			<input name="title" class="easyui-validatebox textbox" required="true"  missingMessage="标题不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>内容
			</td>	
			<td>
			<input name="content" class="easyui-validatebox textbox" required="true"  missingMessage="内容不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>发布时间
			</td>	
			<td>
			<input name="publicTime" class="easyui-validatebox textbox" required="true"  missingMessage="发布时间不能为空">
			</td>
		</tr>
	
		
			<tr>	
				<td>
					浏览量
				</td>	
				<td>
					<input name="click" >
				</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="travels_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="travels_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="travels_close" style="width:90px">取消</a>
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
title : '标题',
field : 'title',
width : 100,
sortable : true
},								{
title : '内容',
field : 'content',
width : 100,
sortable : true
},								{
title : '发布时间',
field : 'publicTime',
width : 100,
sortable : true
},								{
title : '浏览量',
field : 'click',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/travels_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var travels=new Curd("<%=contextPath%>","travels",columns);
            travels.init();
        });
    </script>
</html>

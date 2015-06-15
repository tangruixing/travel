<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Friendlink管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="friendlink_search_fm">
				<table id="friendlink_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="friendlink_search" class="easyui-linkbutton">查询</a> 
							<a id="friendlink_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="friendlink_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="friendlink_dg"></table>
		</div>

</div>

<!--form-->
<div id="friendlink_dlg" class="easyui-dialog"
     closed="true" buttons="#friendlink_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="friendlink_fm" method="post">
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
				<span class="required">*</span>友情链接URL
			</td>	
			<td>
			<input name="url" class="easyui-validatebox textbox" required="true"  missingMessage="友情链接URL不能为空">
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
					简介
				</td>	
				<td>
					<input name="summary" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					友好程度
				</td>	
				<td>
					<input name="grade" >
				</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="friendlink_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="friendlink_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="friendlink_close" style="width:90px">取消</a>
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
title : '友情链接URL',
field : 'url',
width : 100,
sortable : true
},								{
title : 'logo',
field : 'logo',
width : 100,
sortable : true
},								{
title : '简介',
field : 'summary',
width : 100,
sortable : true
},								{
title : '友好程度',
field : 'grade',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/friendlink_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var friendlink=new Curd("<%=contextPath%>","friendlink",columns);
            friendlink.init();
        });
    </script>
</html>

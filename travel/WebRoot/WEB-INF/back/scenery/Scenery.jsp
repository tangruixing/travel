<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Scenery管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="scenery_search_fm">
				<table id="scenery_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="scenery_search" class="easyui-linkbutton">查询</a> 
							<a id="scenery_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="scenery_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="scenery_dg"></table>
		</div>

</div>

<!--form-->
<div id="scenery_dlg" class="easyui-dialog"
     closed="true" buttons="#scenery_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="scenery_fm" method="post">
	<input type="hidden"  name="id" />

        <table>
			
		
			<tr>	
				<td>
					风景ID
				</td>	
				<td>
					<input name="sceId" >
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
				<span class="required">*</span>名字
			</td>	
			<td>
			<input name="address" class="easyui-validatebox textbox" required="true"  missingMessage="名字不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>经度
			</td>	
			<td>
			<input name="longitude" class="easyui-validatebox textbox" required="true"  missingMessage="经度不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>纬度
			</td>	
			<td>
			<input name="latitude" class="easyui-validatebox textbox" required="true"  missingMessage="纬度不能为空">
			</td>
		</tr>
	
		
			<tr>	
				<td>
					logo
				</td>	
				<td>
					<input name="logo" >
				</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>介绍
			</td>	
			<td>
			<input name="introduction" class="easyui-validatebox textbox" required="true"  missingMessage="介绍不能为空">
			</td>
		</tr>
	
		
			<tr>	
				<td>
					网址
				</td>	
				<td>
					<input name="url" >
				</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>开放时间
			</td>	
			<td>
			<input name="openDime" class="easyui-validatebox textbox" required="true"  missingMessage="开放时间不能为空">
			</td>
		</tr>
	
		
			<tr>	
				<td>
					景区级别
				</td>	
				<td>
					<input name="grade" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					景区联系电话
				</td>	
				<td>
					<input name="telphone" >
				</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>轮播
			</td>	
			<td>
			<input name="viwepager" class="easyui-validatebox textbox" required="true"  missingMessage="轮播不能为空">
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
	
		
        </table>

    </form>
</div>
<div id="scenery_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="scenery_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="scenery_close" style="width:90px">取消</a>
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
title : '名字',
field : 'realName',
width : 100,
sortable : true
},								{
title : '名字',
field : 'address',
width : 100,
sortable : true
},								{
title : '经度',
field : 'longitude',
width : 100,
sortable : true
},								{
title : '纬度',
field : 'latitude',
width : 100,
sortable : true
},								{
title : 'logo',
field : 'logo',
width : 100,
sortable : true
},								{
title : '介绍',
field : 'introduction',
width : 100,
sortable : true
},								{
title : '网址',
field : 'url',
width : 100,
sortable : true
},								{
title : '开放时间',
field : 'openDime',
width : 100,
sortable : true
},								{
title : '景区级别',
field : 'grade',
width : 100,
sortable : true
},								{
title : '景区联系电话',
field : 'telphone',
width : 100,
sortable : true
},								{
title : '轮播',
field : 'viwepager',
width : 100,
sortable : true
},								{
title : '推荐',
field : 'suggest',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/scenery_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var scenery=new Curd("<%=contextPath%>","scenery",columns);
            scenery.init();
        });
    </script>
</html>

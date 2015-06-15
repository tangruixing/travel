<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Hotel管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="hotel_search_fm">
				<table id="hotel_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="hotel_search" class="easyui-linkbutton">查询</a> 
							<a id="hotel_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="hotel_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="hotel_dg"></table>
		</div>

</div>

<!--form-->
<div id="hotel_dlg" class="easyui-dialog"
     closed="true" buttons="#hotel_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="hotel_fm" method="post">
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
					logo
				</td>	
				<td>
					<input name="logo" >
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
				<span class="required">*</span>地址
			</td>	
			<td>
			<input name="address" class="easyui-validatebox textbox" required="true"  missingMessage="地址不能为空">
			</td>
		</tr>
	
		
			<tr>	
				<td>
					经度
				</td>	
				<td>
					<input name="longitude" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					纬度
				</td>	
				<td>
					<input name="latitude" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					酒店级别
				</td>	
				<td>
					<input name="grade" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					图片
				</td>	
				<td>
					<input name="picture" >
				</td>
		</tr>
	
		
			<tr>	
				<td>
					酒店电话
				</td>	
				<td>
					<input name="telphone" >
				</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="hotel_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="hotel_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="hotel_close" style="width:90px">取消</a>
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
title : 'logo',
field : 'logo',
width : 100,
sortable : true
},								{
title : '名字',
field : 'realName',
width : 100,
sortable : true
},								{
title : '地址',
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
title : '酒店级别',
field : 'grade',
width : 100,
sortable : true
},								{
title : '图片',
field : 'picture',
width : 100,
sortable : true
},								{
title : '酒店电话',
field : 'telphone',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/hotel_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var hotel=new Curd("<%=contextPath%>","hotel",columns);
            hotel.init();
        });
    </script>
</html>

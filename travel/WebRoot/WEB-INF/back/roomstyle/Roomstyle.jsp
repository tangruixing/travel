<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Roomstyle管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="roomstyle_search_fm">
				<table id="roomstyle_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="roomstyle_search" class="easyui-linkbutton">查询</a> 
							<a id="roomstyle_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="roomstyle_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="roomstyle_dg"></table>
		</div>

</div>

<!--form-->
<div id="roomstyle_dlg" class="easyui-dialog"
     closed="true" buttons="#roomstyle_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="roomstyle_fm" method="post">
	<input type="hidden"  name="id" />

        <table>
			
		
		
		<tr>	
			<td>
				<span class="required">*</span>酒店ID
			</td>	
			<td>
			<input name="hotId" class="easyui-validatebox textbox" required="true"  missingMessage="酒店ID不能为空">
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
				<span class="required">*</span>名称
			</td>	
			<td>
			<input name="bedStyle" class="easyui-validatebox textbox" required="true"  missingMessage="名称不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>床型
			</td>	
			<td>
			<input name="limitPerson" class="easyui-validatebox textbox" required="true"  missingMessage="床型不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>最多可入住人数
			</td>	
			<td>
			<input name="breakfast" class="easyui-validatebox textbox" required="true"  missingMessage="最多可入住人数不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>早餐
			</td>	
			<td>
			<input name="broadband" class="easyui-validatebox textbox" required="true"  missingMessage="早餐不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>宽带
			</td>	
			<td>
			<input name="cancel" class="easyui-validatebox textbox" required="true"  missingMessage="宽带不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>价格
			</td>	
			<td>
			<input name="price" class="easyui-validatebox textbox" required="true"  missingMessage="价格不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>数量
			</td>	
			<td>
			<input name="number" class="easyui-validatebox textbox" required="true"  missingMessage="数量不能为空">
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
					介绍
				</td>	
				<td>
					<input name="introduce" >
				</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="roomstyle_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="roomstyle_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="roomstyle_close" style="width:90px">取消</a>
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
title : '酒店ID',
field : 'hotId',
width : 100,
sortable : true
},								{
title : '名字',
field : 'realName',
width : 100,
sortable : true
},								{
title : '名称',
field : 'bedStyle',
width : 100,
sortable : true
},								{
title : '床型',
field : 'limitPerson',
width : 100,
sortable : true
},								{
title : '最多可入住人数',
field : 'breakfast',
width : 100,
sortable : true
},								{
title : '早餐',
field : 'broadband',
width : 100,
sortable : true
},								{
title : '宽带',
field : 'cancel',
width : 100,
sortable : true
},								{
title : '价格',
field : 'price',
width : 100,
sortable : true
},								{
title : '数量',
field : 'number',
width : 100,
sortable : true
},								{
title : '图片',
field : 'picture',
width : 100,
sortable : true
},								{
title : '介绍',
field : 'introduce',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/roomstyle_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var roomstyle=new Curd("<%=contextPath%>","roomstyle",columns);
            roomstyle.init();
        });
    </script>
</html>

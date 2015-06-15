<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Roombook管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="roombook_search_fm">
				<table id="roombook_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="roombook_search" class="easyui-linkbutton">查询</a> 
							<a id="roombook_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="roombook_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="roombook_dg"></table>
		</div>

</div>

<!--form-->
<div id="roombook_dlg" class="easyui-dialog"
     closed="true" buttons="#roombook_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="roombook_fm" method="post">
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
				<span class="required">*</span>房型ID
			</td>	
			<td>
			<input name="rooId" class="easyui-validatebox textbox" required="true"  missingMessage="房型ID不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>预定时间
			</td>	
			<td>
			<input name="creatDate" class="easyui-validatebox textbox" required="true"  missingMessage="预定时间不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>入住日期
			</td>	
			<td>
			<input name="enterDate" class="easyui-validatebox textbox" required="true"  missingMessage="入住日期不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>离开日期
			</td>	
			<td>
			<input name="leaveDate" class="easyui-validatebox textbox" required="true"  missingMessage="离开日期不能为空">
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
				<span class="required">*</span>房间数量
			</td>	
			<td>
			<input name="roomNum" class="easyui-validatebox textbox" required="true"  missingMessage="房间数量不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>手机号
			</td>	
			<td>
			<input name="telphone" class="easyui-validatebox textbox" required="true"  missingMessage="手机号不能为空">
			</td>
		</tr>
	
		
			<tr>	
				<td>
					邮箱
				</td>	
				<td>
					<input name="email" >
				</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="roombook_dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="roombook_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="roombook_close" style="width:90px">取消</a>
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
title : '房型ID',
field : 'rooId',
width : 100,
sortable : true
},								{
title : '预定时间',
field : 'creatDate',
width : 100,
sortable : true
},								{
title : '入住日期',
field : 'enterDate',
width : 100,
sortable : true
},								{
title : '离开日期',
field : 'leaveDate',
width : 100,
sortable : true
},								{
title : '名字',
field : 'realName',
width : 100,
sortable : true
},								{
title : '房间数量',
field : 'roomNum',
width : 100,
sortable : true
},								{
title : '手机号',
field : 'telphone',
width : 100,
sortable : true
},								{
title : '邮箱',
field : 'email',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/roombook_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var roombook=new Curd("<%=contextPath%>","roombook",columns);
            roombook.init();
        });
    </script>
</html>

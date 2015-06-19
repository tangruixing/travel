<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>User管理</title>
    
    <script type="text/javascript" src="<%=contextPath%>/back/style/js/UniqueCheck.js"></script>
</head>
<body>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="user_search_fm">
				<table id="user_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="user_search" class="easyui-linkbutton">查询</a> 
							<a id="user_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="user_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="user_dg"></table>
		</div>

</div>

<!--form-->
<div id="user_dlg" class="easyui-dialog"
     closed="true" buttons="#user_dlg-buttons" modal="true" style="width:500px;height:280px;padding:10px 20px">
    <div class="ftitle">用户信息</div>
    <form id="user_fm" method="post">
	<input type="hidden"  name="id" />

        <table>
			
		
		
		<tr>	
			<td>
				<span class="required">*</span>手机号
			</td>	
			<td>
			<input id="user_mobile" name="mobile" class="easyui-validatebox" required="true"  missingMessage="手机号不能为空" >
		
			</td>
			
			 <td>
                <div id="unique_user_mobile"  style="float:left;display: none"></div>
             </td>
		</tr>
	
		
		<tr>	
			<td>
				<span class="required">*</span>角色
			</td>	
			<td>
			<input name="role" class="easyui-validatebox textbox" required="true"  missingMessage="角色不能为空">
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
					性别
				</td>	
				<td>
					<input name="sex" >
				</td>
		</tr>
	
		
		<tr>	
			<td>
				出生日期
			</td>	
			<td>
				<input name="birth"  required="true"  
				class="Wdate easyui-validatebox textbox" 
				onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" >
			</td>
		</tr>
	
		
        </table>

    </form>
</div>
<div id="user_dlg-buttons">
    <a href="http://www.baidu.com" class="easyui-linkbutton" iconCls="icon-ok" id="user_save"  style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="user_close" style="width:90px">取消</a>
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
title : '手机号',
field : 'mobile',
width : 100,
sortable : true
},								{
title : '密码',
field : 'pwd',
width : 100,
sortable : true
},								{
title : '角色',
field : 'role',
width : 100,
sortable : true,
formatter : function(value, row, index) {
	
	switch(row.role)
	{
	case 1:
		return "普通用户";
	  break;
	case 2:
		return "管理员";
	  break;
	}
}
},								{
title : '邮箱',
field : 'email',
width : 100,
sortable : true
},								{
title : '名字',
field : 'realName',
width : 100,
sortable : true
},								{
title : '性别',
field : 'sex',
width : 100,
sortable : true,
formatter : function(value, row, index) {
	
	switch(row.sex)
	{
	case 1:
		return "男";
	  break;
	case 2:
		return "女";
	  break;
	default:
		return "保密";
	}

}
},								{
title : '出生日期',
field : 'birth',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/user_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var user=new Curd("<%=contextPath%>","user",columns);
            user.init();
            
            <%-- var userCheck= new UniqueCheck("<%=contextPath%>/user_check"); --%>
           
            
            
            
        });
        
        
    </script>
</html>

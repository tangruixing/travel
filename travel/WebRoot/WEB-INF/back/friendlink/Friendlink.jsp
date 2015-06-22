<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<%@ include file="/WEB-INF/pub/webuploader.jspf" %>
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

</body>

<script type="text/javascript">
        $(function () {
            var columns=[[{
                        title : '用户编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true
                    },{
					title : '合作伙伴',
					field : 'realName',
					width : 100,
					sortable : true
					},{
					title : '合作伙伴链接',
					field : 'url',
					width : 100,
					sortable : true
					},{
					title : 'logo',
					field : 'logo',
					width : 100,
					sortable : true,
					formatter: function (value, row, index) {
                 	   var str="";
                       str+=sy.fs('<img   src="{0}"  style="width:50px;height:50px"/>','<%=contextPath%>/'+row.logo);
                       return str;
                 		 }
					},{
					title : '友好程度',
					field : 'grade',
					width : 100,
					sortable : true
					}]];
                    
            var friendlink=new Curd("<%=contextPath%>","friendlink",columns);
            friendlink.useCommon();
            friendlink.init();
            
            new uploadSimpleImage('frinedlink_logo_img','frinedlink_logo_input','frinedlink_logo_picker');
        });
        
    	
    </script>
</html>

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


		<div region="center" border="false" title="${hotname}酒店">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="roomstyle_dg"></table>
		</div>

</div>


</body>

<script type="text/javascript">
        $(function () {
            var columns=[[{
                        title : '编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true
	                    },{
						title : '名字',
						field : 'realName',
						width : 100,
						sortable : true
						},{
						title : '床型',
						field : 'bedStyle',
						width : 100,
						sortable : true
						},{
						title : '最多可入住人数',
						field : 'limitPerson',
						width : 100,
						sortable : true
						},{
						title : '早餐',
						field : 'breakfast',
						width : 100,
						sortable : true
						},{
						title : '宽带',
						field : 'broadband',
						width : 100,
						sortable : true
						},{
						title : '取消政策',
						field : 'cancel',
						width : 100,
						sortable : true
						},{
						title : '价格',
						field : 'price',
						width : 100,
						sortable : true
						},{
						title : '数量',
						field : 'number',
						width : 100,
						sortable : true
						},{
						title : '图片',
						field : 'picture',
						width : 100,
						sortable : true
						},{
						title : '介绍',
						field : 'introduce',
						width : 100,
						sortable : true
						},{
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
            roomstyle.useCommon();
            roomstyle.setUrlParam("hotId","${hotId}");
            roomstyle.setUrlParam("hotname","${hotname}");
            roomstyle.init();
        });
    </script>
</html>

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
			<table id="scenery_dg"></table>
		</div>

</div>

</body>

<script type="text/javascript">
        $(function () {
            var columns=[[{
                        title : '景区编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true
                    },{
					title : '景区名称',
					field : 'realName',
					width : 100,
					sortable : true
					},{
					title : '地址',
					field : 'address',
					width : 100,
					sortable : true
					},{
					title : '经度',
					field : 'longitude',
					width : 100,
					sortable : true
					},{
					title : '纬度',
					field : 'latitude',
					width : 100,
					sortable : true
					},{
					title : 'logo',
					field : 'logo',
					width : 100,
					sortable : true
					},{
					title : '网址',
					field : 'url',
					width : 100,
					sortable : true
					},{
					title : '开放时间',
					field : 'openDime',
					width : 100,
					sortable : true,
					 formatter: function (value, row, index) {
                       	return row.startTime+"-"+row.endTime;
                      }
					},{
					title : '景区级别',
					field : 'grade',
					width : 100,
					sortable : true
					},{
					title : '景区联系电话',
					field : 'telphone',
					width : 100,
					sortable : true
					},{
					title : '轮播',
					field : 'viwepager',
					width : 100,
					sortable : true
					},{
					title : '推荐',
					field : 'suggest',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/scenery_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var scenery=new Curd("<%=contextPath%>","scenery",columns);
            scenery.useCommon();
            scenery.init();
        });
    </script>
</html>

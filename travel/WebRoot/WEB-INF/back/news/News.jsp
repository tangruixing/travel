<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>News管理</title>
</head>
<body>
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="openDlg();">Open</a>
	<div class="easyui-layout" fit="true" id="gridLayout">
		<!--搜索 -->
		<div region="north" border="false" title="过滤" style="height: 130px; overflow: hidden;">
			<form id="news_search_fm">
				<table id="news_search_table" class="dis" style="width: 100%; height: 100%">
					<tr>
						<td >
							例子:<input name="name" type="text" class="textbox"  /> 
						</td>
					
					</tr>
					<tr>
						
						<td>
							<a id="news_search" class="easyui-linkbutton">查询</a> 
							<a id="news_clean" class="easyui-linkbutton">清空数据</a> 
							<a id="news_refresh" class="easyui-linkbutton">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>


		<div region="center" border="false">
			<!-- 这里不要写fit属性，会看不到分页 -->
			<table id="news_dg"></table>
		</div>

</div>


</body>

<script type="text/javascript">

function openDlg(){
	console.info('click');

	gx.parentDialog({
		    title: '添加新闻',
		    width: '80%',
		    height: '60%',
		    closed: false,
		    cache: false,
		    href: '<%=contextPath%>/news_toSave.do',
		    modal: true
	},window);
	console.info(window);
<%-- 	parent.$('#parentDlg').dialog(
	}); --%>
};

        $(function () {
            var columns=[[{
                        title : '用户编号',
                        field : 'id',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true

                    },{
					title : '用户编号id',
					field : 'useid',
					width : 100,
					sortable : true
					},{
					title : '标题',
					field : 'title',
					width : 100,
					sortable : true
					},{
					title : '子标题',
					field : 'subTitle',
					width : 100,
					sortable : true
					},{
					title : '作者',
					field : 'author',
					width : 100,
					sortable : true
					},{
					title : '摘要',
					field : 'summary',
					width : 100,
					sortable : true
					},{
					title : '内容',
					field : 'content',
					width : 100,
					sortable : true
					},{
					title : '发布时间',
					field : 'publicTime',
					width : 100,
					sortable : true
					},{
					title : '浏览量',
					field : 'click',
					width : 100,
					sortable : true
					},{
					title : '热门',
					field : 'hot',
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
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/news_delete.png",row.id);
                             return str;*/
                        }
                    }]];
                    
            var news=new Curd("<%=contextPath%>","news",columns);
            news.useCommon();
            news.init();
        });
    </script>
</html>

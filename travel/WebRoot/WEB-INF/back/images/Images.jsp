<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="<%=contextPath %>/back/style/js/page.js"></script>
</head>
<body>

<div class="container">

	
	<!-- 景点列表 -->
	<div id="scenery_list">

    </div>
    

    

</div>

<script type="text/javascript">
	$(function(){

	<%-- 	$('#sceId').combogrid({ 
	    	panelWidth:450,
	        idField:'realName', //ID字段  
	        textField:'realName', //显示的字段  
	        url:"<%=contextPath%>/scenery_doList.do",  
	        fitColumns: true,  
	        striped: true,  
	        editable:true,  
	        pagination : true,//是否分页  
	        rownumbers:true,//序号  
	        collapsible:false,//是否可折叠的  
	        fit: true,//自动大小  
	        pageSize: 10,//每页显示的记录条数，默认为10  
	        pageList: [10],//可以设置每页记录条数的列表  
	        method:'post',  
	        columns:[[{
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
				title : '开放时间',
				field : 'openDime',
				width : 100,
				sortable : true
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
				}]]
	    });  
		 --%>
		
		
		var url="<%=contextPath%>/images_doSeceryList.do",
		page=new Page(url,"scenery_list");
		page.gotoPage(${page});//风景 LOGO 显示
		
	
	});
</script>
</body>
</html>
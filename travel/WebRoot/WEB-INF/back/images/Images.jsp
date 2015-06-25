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

		var url="<%=contextPath%>/images_doSeceryList.do",
		page=new Page(url,"scenery_list");
		page.gotoPage(${page});//风景 LOGO 显示
		
	
	});
</script>
</body>
</html>
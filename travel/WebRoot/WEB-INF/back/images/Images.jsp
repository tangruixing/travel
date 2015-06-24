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


    <form class="form-inline">
        <div class="form-group">
            <label for="exampleInputName2">景区名</label>
            <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail2">景点名</label>
            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
    </form>

	<!-- 景点列表 -->
	<div id="scenery_list">

    </div>

</div>

<script type="text/javascript">
	$(function(){
		var url="<%=contextPath%>/images_doSeceryList.do";
		var page=new Page(url,"scenery_list");
	})
</script>
</body>
</html>
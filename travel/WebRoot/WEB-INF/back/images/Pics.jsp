<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">图片浏览</h4>


</div>
<div class="modal-body">
    <div  id="pic_list">
        

    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>

</body>

<script type="text/javascript">

	$(function(){
		console.info("he:"+${sceId});
		var url="<%=contextPath%>/images_toListPicBySid.do",
		page=new Page(url,"pic_list");
		page.setParams("sceId","${sceId}");
		page.gotoPage(${page});		
	})


</script>
</html>
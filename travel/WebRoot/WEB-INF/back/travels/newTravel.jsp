<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>编写游记</title>
<link rel="stylesheet" href="<%=contextPath%>/front/lib/style.css">
<script type="text/javascript" charset="utf-8" src="<%=contextPath%>/jslib/ueditor1_4_3-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=contextPath%>/jslib/ueditor1_4_3-utf8-jsp/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=contextPath%>/jslib/ueditor1_4_3-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.form.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
	var options = { 	        
	        success:       showResponse,  //提交之后的回调函数
   	        url: '<%=contextPath%>/travels_doSave.do',       //覆盖了form的action属性
	        type:     'post',        
	        dataType: 'json',     //(依据服务器返回类型进行设置) 
	        clearForm: true ,      //在成功提交后清除所有的表单域内容
	        resetForm: true ,       //在成功提交后重置所有的表单域内容
	        timeout:   3000 ,
	    };
	     //为表单关联Ajax提交方法
	    $('#myform').ajaxForm(options); 
});
function showResponse(responseText, statusText, xhr, $form) {
	if(responseText.success){
		alert("发表成功！");
		 location.reload();
	}else{
		alert("发表失败！");
	}
}
</script>
<style type="text/css">
#third{
	margin-top:70px;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
}
.button{
	background: #006666;
	display: inline-block;
	text-decoration: none;
	border-radius: 5px;
	padding:5px 10px;
	color:#FFF;
}
.button a{
	color:#FFF !important;
	text-decoration:none;
}
input{
	border-radius: 5px;
}
</style>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="third">
	<form action="#" method="post" id="myform" enctype="multipart/form-data">
		标题：<input type="text" name="title"><br><br>
		<textarea name="content" id="myEditor" style="width:100%;height:400px;">
		</textarea><br>
		<script type="text/javascript">
		    UE.getEditor('myEditor');
		</script>
        <center><input type="submit" value="提交" class="button"></center>
	</form>
</div>

<!-- 友情链接 -->
  	<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
	</s:action>
</body>
</html>

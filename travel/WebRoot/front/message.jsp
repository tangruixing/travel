<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>留言</title>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery-1.4.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript">
   $(document).ready(function(e) {
	   $("#addMsg").fancybox({
		'titlePosition'		: 'inside',
		'transitionIn'		: 'none',
		'transitionOut'		: 'none'
	});
});
</script>
<link rel="stylesheet" href="<%=contextPath%>/front/lib/style.css">
<link href="<%=contextPath%>/front/lib/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css">
<style type="text/css">
nav ul li:nth-child(5){
	background-color:#006666;
}
#second{
	margin-top:0px;
}
#third{
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	clear: both;
	-webkit-box-shadow: inset 0px 2px 2px -2px #000000;
	box-shadow: inset 0px 0px 2px 0px #000000;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	overflow:hidden;
}
#third section:nth-child(1){
	width:990px;
	height:40px;
	background:-webkit-gradient(linear,top,bottom,from(#339999),to(#006666));
	background:-moz-linear-gradient(top,#339999,#006666);
	color:#FFF;
	font-size:24px;
	font-family:"幼圆", "宋体";
	padding-top:20px;
	padding-left:10px;	
}
#third section:nth-child(2){
	width:985px;
	height:285px;
	overflow-y:auto;
	padding-top:10px;
	margin-left:10px;
	font-size:18px;
	font-family:"宋体";
	margin-bottom:5px;
}
#third section:nth-child(2) span{
	color:#00F;
	font-size:16px;
	display:inherit;
}
#third section:nth-child(2) article{
	margin-bottom:5px;
}
.article2{
	background-color: #f4f4f4;
	margin-right: 10px;
	padding: 5px 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}
.article2 span{
	text-align:right;
}
.button{
	background: #006666;
	color: #fff;
	display: inline-block;
	text-decoration: none;
	border-radius: 5px;
	border-collapse: collapse;
	padding:5px 10px;
	word-break:break-all;
}
footer{
	width:1000px;
	margin-left: auto;
	margin-right: auto;
	text-align:center;
	margin-top:10px;
}
footer a{
	color:#000;
	text-decoration:none;
}
#inline1{
	width:440px;
	height:250px;
}
a:hover{
	text-decoration:underline;
}
</style>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="third">
	<section>
    	我的留言
    </section>
    <section>
    	<article><span>我&nbsp;2015/06/08&nbsp;16:46:37</span>大家都知道连续的英文或数字能是容器被撑大，不能根据容器的大小自动换行，下面是 CSS如何将他们换行的方法！</article>
        <article  class="article2"><span>管理员&nbsp;2015/06/08&nbsp;16:46:37</span>Firefox浏览器）white-space:normal; word-break:break-all;overflow:hidden;同样的FF下也没有很好的实现方法，只能隐藏或者加滚动条，当然不加滚动条效果更好！ </article>
        <article><span>我&nbsp;2015/06/08&nbsp;16:46:37</span>大家都知道连续的英文或数字能是容器被撑大，不能根据容器的大小自动换行，下面是 CSS如何将他们换行的方法！</article>
        <article  class="article2"><span>管理员&nbsp;2015/06/08&nbsp;16:46:37</span>Firefox浏览器）white-space:normal; word-break:break-all;overflow:hidden;同样的FF下也没有很好的实现方法，只能隐藏或者加滚动条，当然不加滚动条效果更好！ </article>
        <article><span>我&nbsp;2015/06/08&nbsp;16:46:37</span>大家都知道连续的英文或数字能是容器被撑大，不能根据容器的大小自动换行，下面是 CSS如何将他们换行的方法！</article>
        <article  class="article2"><span>管理员&nbsp;2015/06/08&nbsp;16:46:37</span>Firefox浏览器）white-space:normal; word-break:break-all;overflow:hidden;同样的FF下也没有很好的实现方法，只能隐藏或者加滚动条，当然不加滚动条效果更好！ </article>
    </section>
</div>
<footer>
	<a href="#">首页</a>&nbsp;<a href="#">上一页</a>&nbsp;<a href="#">下一页</a>&nbsp;<a href="#">尾页</a>
    <div class="button" style="	margin-left:100px;"><a href="#inline1" id="addMsg">留言</a></div>
</footer>
<div style="display:none">
	<div id="inline1">
    	<form id="msgForm">
        	留言内容：<textarea rows="8" cols="50" name="content"></textarea>
            <center><input type="submit" value="提交留言" class="button" style="margin-top:10px;"></center>
        </form>
    </div>
</div>
<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
</s:action>
</body>
</html>

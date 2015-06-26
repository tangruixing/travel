<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>最新资讯</title>
<link rel="stylesheet" href="lib/style.css">
<style type="text/css">
a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
	color:#000;
}
#second{
	margin-top:-5px;
}
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:100px;
	clear:both;
}
#third aside{
	float:right;
	width:270px;	
}
#third aside h2{
	color:#33cccc;
	margin-top:-10px;
}
#third aside ul{
	margin-left:-20px;
}
#third aside li{
	margin-bottom:5px;
}
#third div{
	border-right: thin solid #33cccc;
	width:715px;
}
#third section{
	width: 700px;
	border-collapse: collapse;
	border-bottom: thin solid #33cccc;
	padding-bottom:10px;
}
#third section:hover{
	background-color:#ecebeb;
}
#third section article{
	display:inline-block;
	margin-bottom:5px;
}
#third section span{
	float:right;
}
footer{
	text-align:center;
	clear:both;
	margin-top:20px;
	width: 700px;
}
footer a{
	color:#000;
	text-decoration:none;
}
</style>
</head>

<body>
<header>
	<img src="images/index_01.jpg">
</header>
<div id="second">
	<nav>
    	<ul>
        	<li><a href="<%=contextPath%>/front_Index_index.do">首页</a></li>
            <li>酒店</li>
            <li><a href="#">旅游路线</a></li>
            <li><a href="#">自由行</a></li>
            <li><a href="<%=contextPath%>/front_Message_index.do">留言</a></li>
            
        </ul>
        <div>
        	尊敬的会员&nbsp;<a href="javascript:logout()">注销</a>
        </div>
	</nav>
</div>
<div id="third">
	<aside>
    	<h2>热门新闻</h2>
    	<ul>
        	<li><a href="#">福州突降暴雨引发山洪 31名游客被困龙潭景</a></li>
            <li>福州突降暴雨引发山洪 31名游客被困龙潭景</li>
            <li>福州突降暴雨引发山洪 31名游客被困龙潭景</li>
            <li>福州突降暴雨引发山洪 31名游客被困龙潭景</li>
            <li>福州突降暴雨引发山洪 31名游客被困龙潭景</li>
        </ul>
    </aside>
    <div>
        <section>
            <h2><a href="#">福州突降暴雨引发山洪 31名游客被困龙潭景</a></h2>
            <article>据欧盟委员会提供给谷歌竞争对手的“异议声明”显示，欧盟计划对谷歌处以重罚，以确保其具有威慑力。[详细]</article>
            发布时间：2015-06-05<span>浏览量：203</span>
        </section>
        <section>
            <h2><a href="#">福州突降暴雨引发山洪 31名游客被困龙潭景</a></h2>
            <article>据欧盟委员会提供给谷歌竞争对手的“异议声明”显示，欧盟计划对谷歌处以重罚，以确保其具有威慑力。[详细]</article>
            发布时间：2015-06-05<span>浏览量：203</span>
        </section>
        <section>
            <h2>福州突降暴雨引发山洪 31名游客被困龙潭景</h2>
            <article>据欧盟委员会提供给谷歌竞争对手的“异议声明”显示，欧盟计划对谷歌处以重罚，以确保其具有威慑力。[详细]</article>
            发布时间：2015-06-05<span>浏览量：203</span>
        </section>
        <section>
            <h2>福州突降暴雨引发山洪 31名游客被困龙潭景</h2>
            <article>据欧盟委员会提供给谷歌竞争对手的“异议声明”显示，欧盟计划对谷歌处以重罚，以确保其具有威慑力。[详细]</article>
            发布时间：2015-06-05<span>浏览量：203</span>
        </section>
    </div>
    <footer>
        <a href="#">首页</a>&nbsp;<a href="#">上一页</a>&nbsp;<a href="#">下一页</a>&nbsp;<a href="#">尾页</a>
    </footer>
</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="cn.travel.model.User"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>福州景点</title>
<script type="text/javascript" src="lib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="lib/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="lib/jquery.pikachoose.min.js"></script>
<script type="text/javascript" src="lib/jquery.touchwipe.min.js"></script>
<link rel="stylesheet" href="lib/style.css">
<link type="text/css" href="lib/bottom.css" rel="stylesheet" />
<style type="text/css">
a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
}
#second{
	margin-top:0px;
}
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:100px;
	clear:both;
}
#third section{
	float:left;
}
#third div{
	margin-top: 20px;
	width: 100%;
	height: 150px;
	border-collapse: collapse;
	border: thin solid #000000;
	border-top-right-radius: 75px;
	border-bottom-right-radius: 75px;
}
#third section:nth-child(2){
	width:300px;
	color:#33cc33;
	font-size:28px;
	font-family:"宋体";
	margin-left:20px;
	margin-top:10px;
}
#third section:nth-child(2) span{
	color:#ff9900;
	float:right;
}
#third section:nth-child(2) aside{
	color:#000;
	font-size:18px;

}
#third section:nth-child(3){
	width:350px;
	color:#000;
	font-size:16px;
	font-family:"幼圆";
	margin-left:20px;
	margin-top:10px;
}
#third section:nth-child(4){
	width:350px;
	color:#000;
	font-size:16px;
	font-family:"幼圆";
	margin-left:20px;
	margin-top:10px;
}
#third div{
	position:relative;
}
#third article{
	width:700px;
	word-break:break-all;
	margin-left:20px;
	float:left;
	font-size:14px;
	overflow:hidden;
	background-color:#FFF;
	height:70px;
	position:absolute;
	top:65px;
	left:190px;
	z-index:1000;
	padding-left:10px;
	padding-right:10px;
	padding-bottom:10px;
}
#third div img[id]{
	position:relative;
	top:120px;
	left:30px;
	z-index:1010;
}
footer{
	text-align:center;
	clear:both;
	margin-top:20px;
}
footer a{
	color:#000;
	text-decoration:none;
}
#showscenery{
	position: fixed;
	width: 80%;
	height: 500px;
	background-color: #FFF;
	left: 10%;
	top: 20px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	display:none;
	z-index:1020;
}
#showscenery section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1021;
}
</style>
<script language="javascript">
var check=true;
$(document).ready(function(){
	
	
	});
function showarticle(id){
	if(check){
		$("#ar"+id).css("height","auto");
		$("#ar"+id).css("background-color","#CCC");
		$("#im"+id).attr("src","images/up.png");
		check=false;
	}else{
		$("article").css("height","70px");
		$("article").css("background-color","#FFF");
		$("#third div img[id]").attr("src","images/open.png");
		check=true;
	}
}
function showbyID(id){
	$(".pikachoose").empty();
	var a = [
				{"image":"images/jiudian-1.jpg","caption":"","link":"http://pikachoose.com","title":"Image 1"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 2"},
				{"image":"images/jiudian-1.jpg","caption":"Any donation is appreciated. PikaChoose is free to use!","link":"http://pikachoose.com","title":"Image 3"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 4"},
				{"image":"images/jiudian-1.jpg","caption":"Any donation is appreciated. PikaChoose is free to use!","link":"http://pikachoose.com","title":"Image 3"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 4"}
				];
		$(".pikachoose").PikaChoose({data:a});
	$("#"+id).css("display","block");
}
function closebyID(id){
	$("#"+id).css("display","none");
}
</script>
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
	<div>
    	<section><a href="javascript:showbyID('showscenery')"><img src="images/jing2.jpg" width="200" height="150"></a></section>
        <section><img src="images/jingdianbiao.png">于山<span>AAA</span><br><aside>简介:</aside></section>
        <section>福州市鼓楼区于山路</section>
        <section>开放时间：06:00-22:00&nbsp;联系电话：5566-666688</section>
        <article id="ar01">于山位于福州城区中心鼓楼区东南隅，地处五一广场对面。相传古代有一支“于越氏”居此，由此得名。它是福州市区三山之一，值得一去。
整座山形状如巨鳌，名胜古迹众多，景点错落有致。比如有白塔、九曰台、平远台、炼丹井、廓然台等，还有纪念明代抗倭名将戚继光的戚公祠、严复读书处法雨堂和郁达夫的故居。此外，还有不少小巧玲珑的亭榭，如万象亭、吸翠亭、补山精舍等。这些亭子隐约在松竹花卉之间，引人入胜。
所有的景点里面最为出名的要数位于于山西麓白塔寺内的白塔，它因外表涂成灰白色，故称“白塔”，外表真的很好看，很适合拍照。另外，登塔远眺，附近的景色可以尽收眼底。
整座山不高，不难爬，环境也很好，有很多的绿植，上山以后即见树木参天，古榕盘根错节，非常适合散步。并且由于免费开放，所以有时间完全可以过去锻炼下身体。</article><a href="javascript:showarticle('01')"><img src="images/open.png" id="im01"></a>
    </div>
    
    
    <div>
    	<section><img src="images/jing1.jpg" width="200" height="150"></section>
        <section><img src="images/jingdianbiao.png">三坊七巷<span>AAAAA</span><br><aside>简介:</aside></section>
        <section>福州市鼓楼区于山路</section>
        <section>开放时间：06:00-22:00&nbsp;联系电话：5566-666688</section>
        <article id="ar02">“三坊七巷”地处福州市中心，是南后街两旁从北到南依次排列的十条坊巷的概称。“三坊”是：衣锦坊、文儒坊、光禄坊。“七巷”是：杨桥巷、郎官巷、安民巷、黄巷、塔巷、宫巷、吉庇巷。
“谁知五柳孤松客，却住三坊七巷间”，这是一整片的古民居，它从明朝开始初建，经过明清两代数百年的历史，大部分建筑仍保存完好，街区里面有许多名人故居，还有个民俗博物馆。要了解一座城市并不一定要走遍这座城市的大街小巷，可以选择一条老街，慢慢悠悠地行走其间，走过三坊七巷的同时，你也走近了福州。
来这里，主要就是看这些建筑物及名人故居。这里的民居，门窗漏花皆采用镂空精雕，有丰富的图案雕饰，精巧的台阶、门框、花座、柱杆随处可见 。区域内，基本都是窄窄的小巷，白墙瓦屋、黄色木制的房屋。坊巷纵横，石板铺地，有的街巷弯曲，有的笔直，大同小异，每个坊巷口都有一个石刻的牌楼。

从南后街的牌坊进入后，先看到的是杨桥路，它是七巷最北面的一条巷，杨桥路上有林觉民和冰心的故居，《我的故乡》中对故居有生动的描述。再继续往前走是郎官巷，中国近代启蒙思想家、翻译家严复的故居坐落在此。除外，这里还有个二梅书屋，也就是之前所说的民俗博物馆。
然后是塔巷及黄巷，黄巷在塔巷之南，巷内历代多住儒林学士，有个叫小黄楼的小景，郭柏荫故居（天开园红木博物馆）也在这里。
衣锦坊是三坊中的第一坊，坊中16号为清嘉庆进士郑鹏程居宅，其中的衣锦坊水榭戏台最具特色。
再继续往前是安民巷，抗日战争时期，新四军驻闽办事处设在其间。今此老宅列为革命文物保护单位。
文儒坊是第二坊，清代的“民进士”之家（五代都中进士）陈承裘故居在此。之后的宫巷里的豪门住宅结构精巧，单是室内的木雕石刻构件就今人叹为观止。再之后的光禄坊是三坊中的最后一坊，以光禄吟台最为有名。
除了看景点，在这片古建筑步行街上，也跳动着时代的脉搏。星巴客、麦当劳与老字号的“永和鱼丸”、“福州软糕店”并排而立。不妨在街上吃吃福州的特色小吃肉燕（又称燕皮馄饨），又或者在鱼丸店里吃鱼丸，鱼肉做的皮、猪肉的馅，特别鲜美。</article><a href="javascript:showarticle('02')"><img src="images/open.png" id="im02"></a>
    </div>
</div>
<footer>
	<a href="#">首页</a>&nbsp;<a href="#">上一页</a>&nbsp;<a href="#">下一页</a>&nbsp;<a href="#">尾页</a>
</footer>
<div id="showscenery">
	<section><a href="javascript:closebyID('showscenery')"><img src="images/close.png"></a></section>
	<div class="pikachoose"></div>
</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html><head>
<meta charset="utf-8">
<title>福州酒店</title>
<script type="text/javascript" src="lib/jquery-1.9.1.js"></script>
<!-- 图片展示框架 -->
<script type="text/javascript" src="lib/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="lib/jquery.pikachoose.min.js"></script>
<script type="text/javascript" src="lib/jquery.touchwipe.min.js"></script>
<!-- 日期输入框架 -->
<script type="text/javascript" src="lib/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="lib/jquery.ui.datepicker-zh-CN.js"></script>
<link type="text/css" href="lib/bottom.css" rel="stylesheet" />
<link rel="stylesheet" href="lib/style.css">
<link href="lib/table.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="lib/jquery-ui-1.10.3.custom.min.css">
<style type="text/css">
nav ul li:nth-child(2){
	background-color:#006666;
}
a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
}
#second{
	margin-top:0px;
}
#search{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	padding:20px 0;
	clear:both;
}
#search div{
	float:right;
}
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	clear:both;
}
#third div{
	margin-top: 20px;
	border-collapse: collapse;
	padding-bottom: 20px;
	border-bottom: thin outset #000000;
}
#third div section{
	float: left;

}
#third div section:nth-child(1){
	width: 100px;
	height: 100px;
	border-radius: 10px;
	overflow:hidden;
	margin-right:10px;
}
#third div section:nth-child(2){
	width:600px;
	height:50px;
	color:#33cccc;
	font-size:30px;
	font-family:"宋体";
	padding-top:10px;
	margin-right:10px;
}
#third div section:nth-child(2) span{
	color:#000;
	font-size:16px;
	font-family:"黑体";
	margin-left:5px;
}
#third div section:nth-child(3){
	width:100px;
	height:60px;
}
#third div section:nth-child(3) span{
	font-size:36px;
	color:#ff6600;
}
#third div section:nth-child(4){
	width:600px;
	height:50px;
	word-break:break-all;
}
#third div section:nth-child(5){
	width:100px;
	height:40;
}
#third div table{
	clear:both;
	width:100%;
}
#third div table td:nth-child(6) span{
	color:#ff6600;
}
#third div a{
	color:#000;
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
footer{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	text-align:center;
	margin-top:20px;
}
footer a{
	color:#000;
}
#showhotel{
	position: fixed;
	width: 80%;
	height: 500px;
	background-color: #FFF;
	left: 10%;
	top: 20px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	display:none;
}
#showhotel section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#bookroom{
	position: fixed;
	width: 700PX;
	height: 250px;
	background-color: #FFF;
	left: 15%;
	top: 50px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	display:none;
	font-size: 20px;
	font-family: "幼圆", "宋体";
	margin-top: 20px;
}
#bookroom section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#bookroom table{
	margin-top:50px;
	width:650px;
	margin-left:auto;
	margin-right:auto;
	text-align:right;
}
input{
	border-radius: 5px;
}
</style>
<script language="javascript">
$(document).ready(
	function (){
		var a = [
				{"image":"images/jiudian-1.jpg","caption":"","link":"http://pikachoose.com","title":"Image 1"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 2"},
				{"image":"images/jiudian-1.jpg","caption":"Any donation is appreciated. PikaChoose is free to use!","link":"http://pikachoose.com","title":"Image 3"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 4"},
				{"image":"images/jiudian-1.jpg","caption":"Any donation is appreciated. PikaChoose is free to use!","link":"http://pikachoose.com","title":"Image 3"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 4"}
				];
		$(".pikachoose").PikaChoose({data:a});
		 
		//调用datepicker插件在鼠标单击时显示日期选择框
     $("#idDate1").datepicker({
		 minDate:new Date()
		 });
	 $("#idDate2").datepicker({
		 minDate:new Date($("#idDate1").val())
		 });
	$("#idDate1").change(function(e) {
		$("#idDate2").datepicker('option', 'minDate', new Date($("#idDate1").val())); 
    });
});
function showbyID(id){
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
<div id="search">
	<div>
    	<form>
        	酒店名称：<input name="realName" type="text"><input value="搜索" class="button" type="submit">
        </form>
    </div>
</div>
<div id="third">
	<div>
    	<section><a href="javascript:showbyID('showhotel')"><img src="images/hotel-1.jpg" width="100"></a></section>
        <section>福州名城豪生大酒店<span>电话：3854-66620</span></section>
        <section>￥<span>130</span>起</section>
        <section>马尾区马尾区江滨东大道86号，马尾海关大楼。 【 城东地区】</section>
        <section><a href="#"><img src="images/didianbiao.png">去这里</a></section>
		<table class="bordered" border="0" width="100%">
  			<tbody><tr>
    			<td>房型</td>
    			<td>床型</td>
    			<td>早餐</td>
    			<td>宽带</td>
    			<td>政策</td>
    			<td>房价</td>
    			<td>&nbsp;</td>
  			</tr>
  			<tr>
   	 			<td><a href="#">时尚大床房</a></td>
    			<td>大床</td>
                <td>双早</td>
                <td>免费</td>
                <td>免费取消</td>
                <td>￥<span>130</span></td>
                <td><aside class="button"><a href="javascript:showbyID('bookroom')">预定</a></aside></td>
  			</tr>
              <tr>
                <td><a href="#">商大床房</a></td>
                <td>大床</td>
                <td>无</td>
                <td>有线免费</td>
                <td>不可取消</td>
                <td>￥<span>190</span></td>
                <td><aside class="button"><a href="#">预定</a></aside></td>
              </tr>
              <tr>
                <td><a href="#">行政小套房</a></td>
                <td>大床</td>
                <td>双早</td>
                <td>免费</td>
                <td>不可取消</td>
                <td>￥<span>1900</span></td>
                <td><aside class="button"><a href="#">预定</a></aside></td>
              </tr>
		</tbody></table>
    </div>
    <div>
    	<section><img src="images/hotel-1.jpg" width="100"></section>
        <section>福州名城豪生大酒店<span>电话：3854-66620</span></section>
        <section>￥<span>130</span>起</section>
        <section>马尾区马尾区江滨东大道86号，马尾海关大楼。 【 城东地区】</section>
        <section><a href="#"><img src="images/didianbiao.png">去这里</a></section>
		<table class="bordered" border="0" width="100%">
  			<tbody><tr>
    			<td>房型</td>
    			<td>床型</td>
    			<td>早餐</td>
    			<td>宽带</td>
    			<td>政策</td>
    			<td>房价</td>
    			<td>&nbsp;</td>
  			</tr>
  			<tr>
   	 			<td><a href="#">时尚大床房</a></td>
    			<td>大床</td>
                <td>双早</td>
                <td>免费</td>
                <td>免费取消</td>
                <td>￥<span>130</span></td>
                <td><aside class="button"><a href="#">预定</a></aside></td>
  			</tr>
              <tr>
                <td><a href="#">商大床房</a></td>
                <td>大床</td>
                <td>无</td>
                <td>有线免费</td>
                <td>不可取消</td>
                <td>￥<span>190</span></td>
                <td><aside class="button"><a href="#">预定</a></aside></td>
              </tr>
              <tr>
                <td><a href="#">行政小套房</a></td>
                <td>大床</td>
                <td>双早</td>
                <td>免费</td>
                <td>不可取消</td>
                <td>￥<span>1900</span></td>
                <td><aside class="button"><a href="#">预定</a></aside></td>
              </tr>
		</tbody></table>
    </div>
</div>
<footer>
	<a href="#">首页</a>&nbsp;<a href="#">上一页</a>&nbsp;<a href="#">下一页</a>&nbsp;<a href="#">尾页</a>
</footer>
<div id="showhotel">
	<section><a href="javascript:closebyID('showhotel')"><img src="images/close.png"></a></section>
	<div class="pikachoose"></div>
</div>
<div id="bookroom">
	<section><a href="javascript:closebyID('bookroom')"><img src="images/close.png"></a></section>
    <form>
    	<table border="0">
          <tr>
            <td width="105px">入住日期：</td>
            <td><input id="idDate1" name="enterDate" required type="text"></td>
            <td width="30px">&nbsp;</td>
            <td width="105px">离开日期：</td>
            <td><input id="idDate2" name="leaveDate" required type="text"></td>
          </tr>
          <tr>
            <td>姓名：</td>
            <td><input name="realName" required type="text"></td>
            <td>&nbsp;</td>
            <td>房间数：</td>
            <td><input name="roomNum" required type="text"></td>
          </tr>
          <tr>
            <td>手机：</td>
            <td><input name="telphone" required type="text"></td>
            <td>&nbsp;</td>
            <td>邮箱：</td>
            <td><input name="email" type="email"></td>
          </tr>
          <tr>
          	<td colspan="5"><center><input value="提交" class="button" style="margin-top:10px;" type="submit"></center></td>
          </tr>
        </table>
    </form>
</div>
</body>
</html>

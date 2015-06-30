<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/markMap.jspf" %>

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

<script type="text/javascript" src="<%=contextPath%>/jslib/html5Validate-master/src/jquery-html5Validate.js"></script>
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
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:20px;
	clear:both;
}
#third div{
	margin-top: 20px;
	border-collapse: collapse;
	padding-bottom: 20px;
}
#third div section{
	float: left;

}
#third div section:nth-child(1){
	width:600px;
	height:50px;
	color:#33cccc;
	font-size:30px;
	font-family:"宋体";
	padding-top:10px;
	margin-right:10px;
}
#third div section:nth-child(1) span{
	color:#000;
	font-size:16px;
	font-family:"黑体";
	margin-left:5px;
}
#third div section:nth-child(2){
	width:100px;
	height:60px;
}
#third div section:nth-child(2) span{
	font-size:36px;
	color:#ff6600;
}
#third div section:nth-child(3){
	width:600px;
	height:50px;
	word-break:break-all;
}
#third div section:nth-child(4){
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
#showroom{
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
#showroom section{
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
#login{
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
#login section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#login table{
	margin-top:50px;
	width:300px;
	margin-left:auto;
	margin-right:auto;
	text-align:right;
}
input{
	border-radius: 5px;
}
#hotelpika{
	margin-top:-20px;
}
#map{
	width:500px;
	height:300px;
	display:none;
	position:fixed;
	top:100px;
	left:260px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	background-color: #FFF;
}
#map section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#back{
	margin-top:70px;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	font-size:18px;
}
#back span{
	font-size:26px;
}
#back a:visited{
	color:#000;
}
#back img{
	position:relative;
	top:5px;
	margin:0 5px;
}
</style>
<script language="javascript">
$(document).ready(
	function (){	 
		//调用datepicker插件在鼠标单击时显示日期选择框
     $("#idDate1").datepicker({
		 minDate:new Date()
		 });
	 $("#idDate2").datepicker({
		 minDate:new Date($("#idDate1").val())
		 });
	$("#idDate1").change(function(e) {
		$("#hotelpika").datepicker('option', 'minDate', new Date($("#idDate1").val())); 
    });
	
	var images="${picture}";
	
	$("#hotelpika").PikaChoose({data:getOnlyImages(images)});
});

/**
 * 返回 图片 对象,用于显示图片 modal
 */
function getOnlyImages(iamgestr){
	var arrayImages=[];
	arrayImages=iamgestr.split("#");
	var a=[];
	var obj={};
	
	for(var i=0;i<arrayImages.length;i++){
		console.info(arrayImages[i]);
		obj={
			"image":sy.contextPath+"/"+arrayImages[i],
		}
		a.push(obj);
	}
	return a;
}
function showbyID(id,images){
	if(id=="showroom"){
		$("#pika").empty();
		$("#pika").PikaChoose({data:getOnlyImages(images)});	
	}
	$("#"+id).css("display","block");
}
function showOrderbyID(id){
	var loginId=${sessionScope.loginUser.id}
	console.info(loginId);
	if(!loginId){//没有登录
		 id="login";
	}
	$("#"+id).css("display","block");
}
function showMapbyID(id,lng,lat){

	console.info("map");
	Location.showLocation(lng,lat);
	$("#"+id).css("display","block");
}
function closebyID(id){
	$("#"+id).css("display","none");
}
</script>

</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="back">
	<span><a href="<%=contextPath%>/front/front_Hotel_toMore.do">福州酒店</a></span><img src="images/right.png">${realName}
    <hr>
</div>

<s:set value="#{1:'大床',2:'双人床',3:'单床',4:'多人床'}" var="bedStyleMap"></s:set>
<s:set value="#{1:'双份',2:'多份',3:'不含',4:'单份'}" var="breakfastMap"></s:set>
<s:set value="#{1:'无线免费',2:'有线免费'}" var="broadbandMap"></s:set>
<s:set value="#{1:'免费取消',2:'可取消',3:'不可取消'}" var="cancelMap"></s:set>


<div id="third">
	<div>  	
        <section>${realName}<span>电话：${telphone }</span></section>
        <section>￥<span>130</span>起</section>
        <section>${address}</section>
        <section><a href="javascript:showMapbyID('map','${longitude}','${latitude}')"><img src="images/didianbiao.png">去这里</a></section>
        <section class="pikachoose" id="hotelpika"></section>
		<table class="bordered" border="0" width="100%">
  			<tbody>
  				<tr>
    			<td>房型</td>
    			<td>床型</td>
    			<td>早餐</td>
    			<td>宽带</td>
    			<td>政策</td>
    			<td>房价</td>
    			<td>&nbsp;</td>
  			</tr>
  			<s:iterator value="roomstyles">
  			
  		
  		
  			<tr>
   	 			<td><a href="javascript:showbyID('showroom','${picture}')">${realName}</a></td>
    			<td>${bedStyleMap[bedStyle]}</td>
                <td>${breakfastMap[breakfast]}</td>
                <td>${broadbandMap[broadband]}</td>
                <td>${cancelMap[cancel]}</td>
                <td>￥<span>${price}</span></td>
                <td><aside class="button"><a href="javascript:showOrderbyID('bookroom')">预定</a></aside></td>
  			</tr>
  			
  				
  			</s:iterator>
           
		</tbody>
		
		</table>
		
		<div>
			${introduction}
		</div>
    </div>
</div>

<div id="showroom">
	<section><a href="javascript:closebyID('showroom')"><img src="images/close.png"></a></section>
	<div class="pikachoose" id="pika"></div>
</div>
<div id="bookroom">
	<section><a href="javascript:closebyID('bookroom')"><img src="images/close.png"></a></section>
    <form id="orderHotelForm">
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
          	<td colspan="5"><center><input value="提交" class="button" style="margin-top:10px;" id="checkOrderHotelSubmit" type="button"></center></td>
          </tr>
        </table>
    </form>
</div>
<div id="login">
	<section><a href="javascript:closebyID('login')"><img src="images/close.png"></a></section>
    <form id="loginForm" >
    	<table border="0">
          <tr>
            <td width="105px">手机号：</td>
            <td><input  name="mobile" required type="tel"></td>
          </tr>
          <tr>
         
            <td>密码：</td>
            <td><input name="pwd" required type="password"></td>
          </tr>
      
          <tr>
          	<td colspan="5"><center><input value="提交" class="button" style="margin-top:10px;" id="checkLoginSubmit" type="submit"></center></td>
          </tr>
        </table>
    </form>
</div>
<div id="map">
	<section><a href="javascript:closebyID('map')"><img src="images/close.png"></a></section>
	<div id="l-map" style="height:100%" class="dis"></div>			
</div>
<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
</s:action>
</body>
<script type="text/javascript">
	$(function(){
		$("#checkLoginSubmit").off('click');
		$("#checkLoginSubmit").on('click',function(){
			
			
			console.info("click");
			
			var $form=$("#loginForm");
			
			$form.html5Validate(function() {
			    // 全部验证通过，该干嘛干嘛~~
			    console.info("通过校验");
			    var url='<%=contextPath%>/front/front_User_login.do';
			   
			    console.info(url);
			  	$.post(url,$form.serialize(),function(data){
			    	if(data&&data.success){
			    		console.info("登录成功");
			    		window.location.reload();
			    	}else{
			    		jError(data.msg);
			    	}
			    },"json");
			});
		});
		$("#checkOrderHotelSubmit").off('click');
		$("#checkOrderHotelSubmit").on('click',function(){
			
			
			
			
			$("#orderHotelForm").html5Validate(function() {
				<%--  var url=<%=contextPath%>/front/front_Order_doOrderHotel.do;
				   
				    $.post(url,$form.serialize(),function(data){
				    	if(data&&data.success){
							jSuccess(data.msg);
				    	}else{
				    		jError(data.msg);
				    	}
				    }); --%>
			});
			console.info("click");
		});
	})
</script>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>旅游路线</title>
<link rel="stylesheet" href="<%=contextPath%>/front/lib/style.css">
<style type="text/css">
a{
	text-decoration:none;
	color:#000;
}
#third{
	margin-top:10px;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	font-size:18px;
}
#third table{
	font-size:17px;
}
#third table td{
	padding-right:10px;
}
#third aside{
	width:200px;
	height:150px;
	border-radius: 10px;
	overflow:hidden;
	float:right;
	margin-right:200px;
}
#third h1{
	color:#33cccc;
}
#third div{
	width:100%;
	clear:both;
	height:200px;
	padding-top:5px;
}
#route_map{
	width:1000px;
	clear:both;
	height:300px;
	padding-top:5px;
	margin:0 auto;
	
}
#third span{
	color:#F00;
}
#fourth{
	margin-top:90px;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	font-size:18px;
}
#fourth span{
	font-size:26px;
}
#fourth img{
	position:relative;
	top:5px;
	margin:0 5px;
}

 body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #show-map{height:300px;width:800px;}
        #r-result{width:100%; font-size:14px;line-height:20px;}
        p{margin-left:5px; font-size:14px;}
#fifth{
	padding:20px 0;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	
}
#fifth article{
	font-size: 38px !important;
}

#bookRoute{
	width:400px;
	height:200px;
	display:none;
	position:fixed;
	top:150px;
	left:320px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	background-color: #FFF;
}
#bookRoute table{
	width:260px;
	margin:20px auto;
}
#bookRoute table input{
	border-radius: 5px;
}
#bookRoute table span{
	color:red;
}
#bookRoute section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#bookRoute .button{
	float:none;
}
.button{
	background: #006666;
	display: inline-block;
	text-decoration: none;
	border-radius: 5px;
	border-collapse: collapse;
	padding:5px 10px;
	word-break:break-all;
	float:right;
	margin-right:10px;
	color: #fff;
	margin-top:30px;
}
.button a{
	color: #fff;
}
</style>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CA3NlRi4BRVc5elDe4l0tXnu"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
<script type="text/javascript"	src="<%=contextPath%>/back/style/js/line.js"	charset="utf-8"></script>

<script type="text/javascript" src="<%=contextPath%>/jslib/html5Validate-master/src/jquery-html5Validate.js"></script>
<script type="text/javascript">


var rouId=null;
var isLogin="${sessionScope.loginUser.id}";
var lock=false;

$(function(){

	
	
	//线路收藏
	$("#collectRoute").off('click');
	$("#collectRoute").on('click',function(){
		if(!isLogin||isLogin.length<0){//没有登录
			 location.href="<%=contextPath%>/login.jsp";
			 return ;
		}
		lock=true;
		if(lock){
			 var url='<%=contextPath %>/collect_doSave.do?rouId=${id}';
			   
			    $.post(url,null,function(data){
			    	if(data&&data.success){
						
						lock=false;//成功后不能提交
						$("#collectRoute").html("已经收藏");
						jSuccess(data.msg);
			    	}else{
			    		jError(data.msg);
			    	}
			    	
			    },'json');
		}else{
			jNotify("不能重复提交");
		}
		console.info("click");
	});
	
	//线路预定
	$("#checkOrderRouteSubmit").off('click');
	$("#checkOrderRouteSubmit").on('click',function(){

		if(!rouId){
			jError("出错了");
			return;
		}
		var $form=$("#orderRouteForm");
		
		var flag=true;
		$form.find("input[type='text']").each(function(){
			var source=$(this).val();
			if(source == "" || typeof source != "string"){
				jNotify("必填项不能为空");
				flag=false;
				return ;
			}
		});
		if(!flag){
			return;
		}
		
		if(lock){
			 var url='<%=contextPath%>/routebook_doSave.do?rouId='+rouId;
			   
			    $.post(url,$form.serialize(),function(data){
			    	if(data&&data.success){
						
						lock=false;//成功后不能提交
						
						$form.find(":reset").trigger("click");
						$("#bookRoute").css("display","none");
						jSuccess(data.msg);
			    	}else{
			    		jError(data.msg);
			    		lock=true;
			    	}
			    	
			    },'json');
		}else{
			jNotify("不能重复提交");
		}
		console.info("click");
	});
})
function showbyID(id){
	$("#"+id).css("display","block");
}
function closebyID(id){
	$("#"+id).css("display","none");
}
function showRouteOrder(id){

	console.info("参数:"+id);
	console.info(isLogin);
	if(!isLogin||isLogin.length<0){//没有登录
		 location.href="<%=contextPath%>/login.jsp";
	}else{	
		rouId=id;
		lock=true;
		$("#bookRoute").css("display","block");
	}
}
function closebyID(id){
	$("#bookRoute").css("display","none");
	$("#orderRouteForm").find(":reset").trigger("click");
}
</script>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>

<div id="fourth">
	<span><a href="<%=contextPath %>/front/front_Route_toIndex.do?routeType=${routeType}">${routeType==0?'旅游线路':'自由行' }</a></span><img src="images/right.png">${realName}
</div>
<div id="third">
	<hr>
	<aside><img src="images/jing2.jpg" width="200" height="150"></aside>
	
	<s:if test="routeType==0">
	<span class="button"><a href="javascript:showRouteOrder('${id}')">预定</a></span>
		<h1>${realName}</h1>
		<table>
			<tr>
				<td>人均消费：<span>￥</span>${money}</td>
				<td> 报名截止时间：<span><fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
			</tr>
			<tr>
				<td>出发时间： <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>结束时间： <fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</table> 
		
		
		<script type="text/javascript">
			$("nav ul li:eq(2)").css("background-color","#006666");
		</script>
	</s:if>
  	<s:elseif test="routeType==1">	 
  	<span class="button">
  		<s:if test="canCollect">
  			<a href="javascript:void(0);" id="collectRoute">
	  		收藏
	  		</a>
  		</s:if>
  		<s:else>
  			<a href="javascript:jNotify('已经收藏了');">
	  		已经收藏
	  		</a>
  		</s:else>
  	</span>
  	<h1>${realName}</h1>
  	 人均消费：<span>￥</span>${money}
  	 
  	 <script type="text/javascript">
			$("nav ul li:eq(3)").css("background-color","#006666");
		</script>
  	</s:elseif>
    
</div>

<div id="route_map">
    <hr>
    <div id="myMap">
	<div id="show-map"></div>
	</div>
</div>

<div id="fifth"><article>${description}</article></div>

</body>


<div id="bookRoute">
  <section><a href="javascript:closebyID('book')"><img src="images/close.png"></a></section>
	
	 <form id="orderRouteForm">
	     	<input type="reset" style="display:none;" /> 
    	
    	<table border="0">
          <tr>
            <td><span>*</span>姓名：</td>
            <td><input name="leaveName" required type="text"></td>
          </tr>
           <td><span>*</span>联系方式：</td>
            <td><input name="leaveTel" required type="text" onchange="checkAllPhone(this);"></td>
          </tr>
          <tr>
            <td><span>*</span>人数：</td>
            <td><input name="peopleNum" required type="text" onchange="checkDigital(this);"></td>
          </tr>
        </table>
        <center><input value="提交" class="button" style="margin-top:10px;" id="checkOrderRouteSubmit" type="button"></center>
    </form>
</div>
<script type="text/javascript">
	$(function(){
		  var url=sy.contextPath + '/front/front_Route_loadRouteplanWithRid.do';
	     	
	        var line=new myLine();
		var value={
				rid:${id}
			}
			line.lineDivMap(url,value,"route_map");
	});
</script>
</html>

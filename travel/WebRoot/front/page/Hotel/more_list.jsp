<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>

<!-- 图片展示框架 -->
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.pikachoose.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.touchwipe.min.js"></script>

<div id="list">
<div id="search">
	<div>
    	<form id="pageForm" action="<%=contextPath%>/front/front_Hotel_toMoreList.do">
        	<span style="font-size:18px;">酒店名称：</span><s:textfield name="realName" />
        	<input value="搜索" class="button" id="pageBtn" type="button">
        </form>
    </div>
</div>
<div id="third">
 <s:iterator value="pageBean.recordList">
	<div>
    	<section><a href="javascript:showHotelPic('${picture}')"><img src="<%=contextPath %>/${logo }" width="100"></a></section>
        <section>${realName}<span style="margin-left:10px;">电话：${telphone}</span></section>
        <section><a href="<%=contextPath %>/front/front_Hotel_toDetail.do?id=${id}"><span>预定</span></a></section>
        <section>${address}</section>
        <section><a href="javascript:showMapbyID('map','${longitude}','${latitude}')"><img src="images/didianbiao.png">去这里</a></section>
       
    </div>
 </s:iterator>
<center style="clear:both"></div>
<%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>
</div></center>
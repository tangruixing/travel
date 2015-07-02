<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<%
java.util.Date date=new java.util.Date();
%>
<div>
<form id="pageForm" action="<%=contextPath %>/collect_toPersonRouteList.do">
<s:iterator value="pageBean.recordList">
        <div class="roombook">   
        	<h2><a href="<%=contextPath %>/front/front_Route_toDetail.do?id=${route.id}">${route.realName }</a></h2>         
            	<span class="button"><a href="javascript:cancel('<%=contextPath %>/collect_cancel.do',${id })">取消收藏</a></span>
            	<div>
            	出发日期：<fmt:formatDate value="${route.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;
            	结束时间：<fmt:formatDate value="${route.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>            	
            	</div>			
        </div>
</s:iterator> 
</form>
</div>
      <%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>  


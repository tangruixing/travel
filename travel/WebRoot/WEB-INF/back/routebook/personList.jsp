<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<%
java.util.Date date=new java.util.Date();
%>
<div>
<form id="pageForm" action="<%=contextPath %>/routebook_toPersonList.do">
<s:iterator value="pageBean.recordList">
        <div class="roombook">   <h2><a href="<%=contextPath %>/front/front_Route_toDetail.do?id=${route.id}">${route.realName }</a></h2>         
            	<div>
            	出发日期：<fmt:formatDate value="${route.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;
            	结束时间：<fmt:formatDate value="${route.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            	</div>
				<div>姓名：${leaveName }&nbsp;&nbsp;&nbsp;&nbsp; 手机号:${leaveTel }
				<span class="button"><s:if test="route.cancel"><a href="javascript:cancel('<%=contextPath %>/routebook_cancel.do',${id })">取消预订</a></s:if><s:else>已完成</s:else></span></div>
				<div> 人数：${peopleNum} &nbsp;&nbsp;&nbsp;&nbsp; 价钱:￥${totalPrice }</div>
        </div>
</s:iterator> 
</form>
</div>
      <%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>  


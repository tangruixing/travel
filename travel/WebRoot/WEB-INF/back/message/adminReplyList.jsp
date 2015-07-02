<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%		
	String contextPath=request.getContextPath();
%>
<div id="list">
<s:set value="userName" var="questionName"> </s:set>
 <form id="pageForm" action="<%=contextPath %>/message_adminLookMessageList.do">
 	<s:hidden name="userId"/>
 </form>

 <s:iterator value="pageBean.recordList">
  	 <s:if test="adminId!=null">
        	
        		<blockquote class="blockquote-reverse">
					<p>${content }</p>
					<footer>我<cite title="Source Title"><fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></cite></footer>
				</blockquote>
        </s:if>
        
        <s:else>
        	 <blockquote>
					<p>${content}</p>
					<footer>${questionName}<cite title="Source Title"><fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></cite></footer>
				</blockquote>
        </s:else>
 
 </s:iterator>

<%@ include file="/WEB-INF/page/bootstrap-simple-ajax.jspf" %>
</div>
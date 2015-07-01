<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="list">
<div>
<form id="pageForm" action="<%=contextPath %>/travels_toList.do">
<s:iterator value="pageBean.recordList">
        <div class="travels">
            <h2><a href="<%=contextPath %>/front/front_Travels_toDetail.do?id=${id}">${title }</a></h2>       
            	发布时间：<fmt:formatDate value="${publicTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            	<span>浏览量：${click }</span>
        </div>
</s:iterator> 
</form>
</div>
      <%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>  
</div>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="list">
<div>
<form id="pageForm" action="<%=contextPath %>/front/front_News_toList.do">
<s:iterator value="pageBean.recordList">
        <section>
            <h2><a href="<%=contextPath %>/front/front_News_toDetail.do?id=${id}">${title }</a></h2>
            <article>${fn:substring(summary,0,90)}...</article>
            	发布时间：<fmt:formatDate value="${publicTime}" pattern="yyyy-MM-dd HH:mm:ss"/><span>浏览量：${click }</span>
        </section>
</s:iterator> 
</form>
</div>
      <%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>  
</div>
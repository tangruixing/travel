<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<div id="list">
<form id="pageForm" action="<%=contextPath %>/front/front_Route_toList.do">

<s:iterator value="pageBean.recordList">
	<div class="content">
    	<header>
        	<a href="<%=contextPath %>/front/front_Route_toDetail.do?id=${id}"><img src="<%=contextPath%>/${logo}" width="160" height="120"></a>
        </header>
        <article>
			<h1><a href="<%=contextPath %>/front/front_Route_toDetail.do?id=${id}">${realName}</a></h1>
            <section>
            	${fn:substring(description,0,20) }...
            </section>
        	人均消费：￥${money }<span>出发时间 ： <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/> 结束时间：<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/></span>
        </article>
    </div>
</s:iterator>
</form>
<%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>
</div>

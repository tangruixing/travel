<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<div id="list">
<div id="search">
	<div>
    	<form id="pageForm" action="<%=contextPath %>/front/front_Route_toList.do">
        	<span style="font-size:18px;">去哪儿：</span><s:textfield name="realName" />
        	<s:hidden name="routeType"></s:hidden>
        	<input value="搜索" class="button" id="pageBtn" type="button">
        </form>
    </div>
</div>


<s:iterator value="pageBean.recordList">
	<div class="content">
    	<header>
        	<a href="<%=contextPath %>/front/front_Route_toDetail.do?id=${id}"><img src="<%=contextPath%>/${logo}" width="160" height="120"></a>
        </header>
        <article>
			<h1><a href="<%=contextPath %>/front/front_Route_toDetail.do?id=${id}">${realName}</a></h1>
            <section>
            	${fn:substring(description,0,35) }...
            </section>
        	人均消费：￥${money }<span>出发时间 ： <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/> 结束时间：<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/></span>
        </article>
    </div>
</s:iterator>

<%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>
</div>

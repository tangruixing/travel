<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="list">
<form id="pageForm" action="<%=contextPath %>/front/front_Scenery_toList.do">
<s:set value="#{1:'A',2:'AA',3:'AAA',4:'AAAA',5:'AAAAA'}" var="Sgrade"></s:set>
<s:iterator value="pageBean.recordList">

<div class="content">
    	<header>
        	<a href="<%=contextPath %>/front/front_Scenery_toDetail.do?id=${id}"><img src="<%=contextPath%>/${logo}" width="200" height="150"></a>
        </header>
        <article> 
        	<s:if test="grade!=0">
        	<aside>级别：<span>${Sgrade[grade]}</span></aside> 
        	</s:if>      
			<h1><a href="<%=contextPath %>/front/front_Scenery_toDetail.do?id=${id}"><img src="<%=contextPath%>/front/images/jingdianbiao.png">${realName}</a></h1>           
            <section><img src="images/didianbiao.png">${address }</section>
        	<section>开放时间：${startTime }-${endTime }&nbsp;联系电话：${telphone }</section>
            <section>
            	${fn:substring(summary,0,60)}...
            </section>
        </article>
</div>
</s:iterator>
</form>
<%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %> 
</div>   
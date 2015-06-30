<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="list">
<div id="third">
	<section>
    	我的留言
    </section>
    <section>
    <form id="pageForm" action="<%=contextPath %>/message_browseMsg.do"></form>
    <s:iterator value="pageBean.recordList">
    	
       <s:if test="adminId!=null">
        	<article class="article2"><span>管理员&nbsp;<fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
        	</span>${content }</article>
        </s:if><s:else>
        	<article><span>我&nbsp;<fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>${content }</article>
        </s:else> 
    </s:iterator>
    </section>
</div>
	<%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>
</div>	
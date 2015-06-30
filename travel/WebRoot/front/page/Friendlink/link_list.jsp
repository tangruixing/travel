<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div class="friendlink">
	<header>
    	合作旅游局<hr>
    </header>
    <div>
    <s:iterator value="pageBean.recordList">
    	<section>
        	<a href="${url}"><img src="<%=contextPath %>/${logo}"><br>${realName}</a>
        </section>
	</s:iterator>
    </div>
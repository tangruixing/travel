<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="sixth">
	<header>
    	合作旅游局
    </header>
    <div>
    <s:iterator value="pageBean.recordList">
    	<section>
        	<a href="${url}"><img src="<%=contextPath %>/${logo}" width="110" height="50"><br>${realName}</a>
        </section>
	</s:iterator>
    </div>
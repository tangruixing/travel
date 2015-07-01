<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="fourth">
<s:if test="sceneryList.size()!=0">
	<h2>所属景点</h2>
	<s:iterator value="sceneryList">
	<div>
    	<section><img src="<%=contextPath %>/front/images/scenery.png"><h3>${realName }</h3></section>
         <section><img src="<%=contextPath %>/${logo}" width="250"></section>
        <article>
        	${summary }
		</article>    
    </div>
    
    </s:iterator>
</div>
</s:if>
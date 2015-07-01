<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="fourth">
	<header>
    	必玩景区
    </header>
    <s:iterator value="pageBean.recordList">
    <section>
    <a href="<%=contextPath %>/front/front_Scenery_toDetail.do?id=${id}"><img src="<%=contextPath %>/${logo}" width="242" height="162"></a>
        <table>
        	<tr><td><img src="<%=contextPath %>/front/images/jingdianbiao.png">&nbsp;<a href="<%=contextPath %>/front/front_Scenery_toDetail.do?id=${id}">${realName}</a></td></tr>
            <tr><td><span>${fn:substring(summary,0,30)}...</span></td></tr>
         </table>
    </section>
    </s:iterator>
    <footer>
    	<a href="<%=contextPath %>/front/front_Scenery_toMore.do">更多景点<img src="<%=contextPath %>/front/images/you-2.png"></a>
    </footer>
</div>
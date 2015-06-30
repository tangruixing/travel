<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="fifth">
	<header>
    	旅游新闻
    </header>
    <section class="example2">    	      
        <ul>
            <li><img src="<%=contextPath %>/front/images/jing3.jpg" width="400" height="230"></li>
            <li><img src="<%=contextPath %>/front/images/jing2.jpg" width="400" height="230"></li>
            <li><img src="<%=contextPath %>/front/images/jing1.jpg" width="400" height="230"></li>
        </ul>
        <ol>
            <li></li>
            <li></li>
            <li></li>
        </ol>
    </section>
    <aside>
    <table>
    <s:iterator value="pageBean.recordList">
    	<tr><td><a href="#">${fn:substring(title,0,23)}...</a></td></tr>
    </s:iterator>
    </table>
    </aside>
    <footer>
    	<a href="#">更多新闻</a><img src="<%=contextPath %>/front/images/you-3.png">
    </footer>
</div>
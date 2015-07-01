<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="third">
	<header>
    	福州酒店
    </header>
    <s:iterator value="pageBean.recordList">
   	<section class="jiudian">
    	<img src="<%=contextPath%>/${logo}">
        <section>
        	<a href="<%=contextPath %>/front/front_Hotel_toDetail.do?id=${id}">
        	${realName}<br>
            <span>预定</span></a>
        </section>
    </section>
    
    </s:iterator>
    
    <footer>
    	<a href="<%=contextPath %>/front/front_Hotel_toMore.do">更多酒店<img src="<%=contextPath %>/front/images/you-1.png"></a>
    </footer>
</div>
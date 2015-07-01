<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<aside>
    	<h2>热门游记</h2>
    	<ul>
    		<s:iterator value="travelsList">
        	<li><a href="<%=contextPath %>/front/front_Travels_toDetail.do?id=${id}">${fn:substring(title,0,15)}...</a></li>
            </s:iterator>
        </ul>
    </aside>
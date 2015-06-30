<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<aside>
   	<h2>热门线路</h2>
   	<ul>
   		  <s:iterator value="hotList">
   		  		<li><a href="<%=contextPath %>/front/front_Route_toDetail.do?id=${id}">${realName}</a></li>
   		  </s:iterator>
     </ul>
</aside>
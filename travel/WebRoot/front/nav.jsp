<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<header>
	<img src="<%=contextPath%>/front/images/index_01.jpg">
</header>
<div id="second">
	<nav>
    	<ul>
        	<li><a href="<%=contextPath%>/index.jsp">首页</a></li>
            <li><a href="<%=contextPath%>/front/front_Hotel_toMore.do">酒店</a></li>
            <li><a href="<%=contextPath%>/front/front_Route_toIndex.do?routeType=0">旅游路线</a></li>
            <li><a href="<%=contextPath%>/front/front_Route_toIndex.do?routeType=1">自由行</a></li>
             <li><a href="<%=contextPath%>/front/front_Travels_toIndex.do">游记</a></li>
            <li><a href="<%=contextPath%>/message_goMsg.do">留言</a></li>              
        </ul>
        <div>
        <s:if test="#session.loginUser==null">
        	<span><a href="<%=contextPath%>/login.jsp">登录</a></span>│<a href="<%=contextPath%>/front/register.jsp">注册</a>     
        </s:if><s:else>
            <s:if test="#session.loginUser.role==2"><a href="<%=contextPath%>/user_goPerson.do"></s:if>
            <s:else><a href="<%=contextPath%>/login_toLogin.do"></s:else>尊敬的会员</a>&nbsp;<a href="<%=contextPath%>/front/front_User_logout.do">注销</a>
        </s:else>
        </div>
    </nav>
</div>

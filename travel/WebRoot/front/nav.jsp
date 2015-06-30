<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<header>
	<img src="<%=contextPath%>/front/images/index_01.jpg">
</header>
<div id="second">
	<nav>
    	<ul>
        	<li><a href="<%=contextPath%>/index.jsp">首页</a></li>
            <li><a href="#">酒店</a></li>
            <li><a href="#">旅游路线</a></li>
            <li><a href="#">自由行</a></li>
            <li><a href="<%=contextPath%>/front_Message_index.do">留言</a></li>            
        </ul>
        <div>
        <s:if test="#session.loginUser==null">
        	<span><a href="<%=contextPath%>/front/login.jsp">登录</a></span>│<a href="<%=contextPath%>/front/register.jsp">注册</a>     
        </s:if><s:else>
            <s:if test="#session.loginUser.role==2"><a href="<%=contextPath%>/front/person.jsp"></s:if>
            <s:else><a href="<%=contextPath%>/login_toLogin.do"></s:else>尊敬的会员</a>&nbsp;<a href="<%=contextPath%>/front_User_logout.do">注销</a>
        </s:else>
        </div>
    </nav>
</div>
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
            <li><a href="<%=contextPath%>/message_goMsg.do">留言</a></li>            
        </ul>
        <div>
        <s:if test="#session.loginUser==null">
        	<span>登录</span>│<a href="<%=contextPath%>/front/register.jsp">注册</a>
            <section id="sign">
            	<form action="<%=contextPath%>/front_User_login.do" id="myform">
                <table>
                	<tr><td>手机号：</td><td><input type="text" name="mobile" autocomplete="off"></td></tr>
                    <tr><td>密码：</td><td><input type="password" name="pwd"></td></tr>
                    <tr><td colspan="2" height="40px"><center><input type="submit" value="登录" class="button"></center></td>
                 </table>
                 </form>
            </section>
        </s:if><s:else>
            <s:if test="#session.loginUser.role==2"><a href="<%=contextPath%>/front/person.jsp"></s:if>
            <s:else><a href="<%=contextPath%>/login_toLogin.do"></s:else>尊敬的会员</a>&nbsp;<a href="<%=contextPath%>/front/front_User_logout.do">注销</a>
        </s:else>
        </div>
    </nav>
    <div id="slider01"></div>
</div>

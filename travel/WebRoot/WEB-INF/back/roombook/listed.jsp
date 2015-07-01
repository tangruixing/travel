<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>

<div>
<form id="pageForm" action="<%=contextPath %>/roombook_toListed.do">
<s:iterator value="pageBean.recordList">
        <div class="roombook">   <h2><a href="<%=contextPath %>/front/front_Hotel_toDetail.do?id=${roomstyle.hotel.id}">${roomstyle.hotel.realName }</a></h2><h3>${roomstyle.realName }</h3>           
            	<div>
            	预定时间：<fmt:formatDate value="${creatDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;
            	入住时间：<fmt:formatDate value="${enterDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            	</div>
            	<div>离开时间：<fmt:formatDate value="${leaveDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
				<div>姓名：${realName }&nbsp;&nbsp;&nbsp;&nbsp; 房间数量:${roomNum }</div>
				<div>  手机号:${telphone }&nbsp;&nbsp;&nbsp;&nbsp; 邮箱:${email }</div>

        </div>
</s:iterator> 
</form>
</div>
      <%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>  


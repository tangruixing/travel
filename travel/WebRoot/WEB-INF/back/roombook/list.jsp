<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<div id="list">
<div>
<form id="pageForm" action="<%=contextPath %>/roombook_toList.do?type=1">
<s:iterator value="pageBean.recordList">
        <div>                
            	预定时间：<fmt:formatDate value="${creatDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            	入住时间：<fmt:formatDate value="${enterDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            	离开时间：<fmt:formatDate value="${leaveDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				姓名：${realName } 房间数量${roomNum }  手机号${telphone } 邮箱${email }
        </div>
</s:iterator> 
</form>
</div>
      <%@ include file="/WEB-INF/page/pageBean-ajax.jspf" %>  
</div>

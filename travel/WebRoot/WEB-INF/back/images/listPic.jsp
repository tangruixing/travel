<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
   <style type="text/css">
    	.thumbnail img{
    	 	width: 171 !important; 
    	 	height: 180 !important; 

    	}
    </style>
</head>
<body>


  <div class="row">
<s:iterator value="pageBean.recordList">
			<div class="col-sm-6 col-md-3 pic">
		        <div class="thumbnail" >
		            <img src="<%=contextPath%>/${image}" alt="${name}">
		            <div class="caption">
		               <%--   <h3>${fn:substring(name,0,5)}</h3>
		                 <small>${fn:substring(caption,0,10)}...</small> --%>
		                <p>
		                   <button type="button"  class="btn btn-primary" role="button" onclick="deletePic(${id});">删除</button>
		                </p>
		            </div>
		        </div>
		    </div>
</s:iterator>




</div>
  <!--分页-->
  <s:if test="pageBean.pageCount<=0">
		<div class="alert alert-danger" role="alert">改景点还没有图片</div>
  </s:if>
  <s:else>
  	
  	<nav>
      <ul class="pager">
          <li class="previous ${pageBean.currentPage==1?'disabled':''}"><a href="javascript:void(0);" onclick="goPage(${pageBean.currentPage-1})"><span aria-hidden="true">&larr;</span>上一页</a></li>
          <li class="next ${pageBean.currentPage==pageBean.pageCount?'disabled':''}"><a href="javascript:void(0);" onclick="goPage(${pageBean.currentPage+1})">下一页 <span aria-hidden="true">&rarr;</span></a></li>
      </ul>
   </nav>
  </s:else>





<script type="text/javascript">
var url="<%=contextPath%>/images_toListPicBySid.do",
page=new Page(url,"pic_list");
page.setParams("sceId","${sceId}");

function goPage(num){
	if(num<1||num>${pageBean.pageCount}){
		console.info("没有该页面");
		return;
	}
	page.gotoPage(num);
}
/**
 * 删除 指定图片
 */
function deletePic(id){
	
	var url="<%=contextPath%>/images_doDeletes.do";
	var params={
			deleteIds:id
	}
	$.post(url,params,function(data){
		
		if(data&&data.success){
			jNotify(data.msg);
			page.gotoPage(${page});
		}else{
			jError(data.msg);
		}
	},'json');
}


</script>
</html>
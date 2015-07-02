<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="<%=contextPath %>/back/style/js/page.js"></script>
    
    <style type="text/css">
    	.thumbnail img{
    	 	height: 200 !important; 
    		width: 242 !important;
    	}
    </style>
</head>

<body>
<s:if test="pageBean.pageCount>0">
   <div class="row">
	
<form class="form-inline" id="scenery_logo_form" action="<%=contextPath %>/images_doSeceryList.do">
        <div class="form-group">
            <label for="exampleInputName2">景区名</label>
            <input type="text" class="form-control" id="sceId" name="areaName" placeholder="请输入景区名字">
        </div>
        <button type="button" class="btn btn-default" onclick="goPage(${pageBean.currentPage});">搜索</button>
    </form>
		
	
		<s:iterator value="pageBean.recordList">
			<div class="col-sm-6 col-md-3">
		        <div class="thumbnail" >
		            <img src="<%=contextPath%>/${logo}" alt="${realName}" class="scenery_logo">
		            <div class="caption">
		                 <h3>${fn:substring(realName,0,5)}</h3>
		                 <small>${fn:substring(summary,0,10)}...</small>
		                <p>
		                     <a class="btn btn-primary" data-toggle="modal" href="<%=contextPath %>/images_toPicIndex.do?sceId=${id}" data-target="#listAndAddModal">浏览</a>
		                     <a class="btn btn-primary" data-toggle="modal" href="<%=contextPath %>/images_toAddPic.do?sceId=${id}&page=${pageBean.currentPage}" data-target="#listAndAddModal">上传</a>
		                </p>
		            </div>
		        </div>
		    </div>
		</s:iterator>
	
	<!--景点图片浏览/添加-->
    <div class="row">
        <!-- Modal -->
        <div class="modal fade" id="listAndAddModal" tabindex="-1" role="dialog" aria-labelledby="listAndAddModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
					
                </div>
            </div>
        </div>
	</div>
	
	
   </div>
   </s:if>
  <!--分页-->
  <s:if test="pageBean.pageCount<=0">
		<div class="alert alert-danger" role="alert">暂时没有任何景点</div>
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
	var url="<%=contextPath%>/images_doSeceryList.do";
	var page=new Page(url,"scenery_list");
	page.setSearchForm("scenery_logo_form");
	function goPage(num){
		if(num<1||num>${pageBean.pageCount}){
			console.info("没有该页面");
			return;
		}
		page.gotoPage(num);
	}
	
	/**
	 * modal 框
	 */
	$("#listAndAddModal").on("hidden.bs.modal", function(){
		console.info("清除");
		$(this).find(".modal-content").empty();
		$(this).removeData("bs.modal"); 
	});
</script>
</body>
</html>
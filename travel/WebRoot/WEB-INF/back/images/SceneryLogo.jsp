<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="<%=contextPath %>/back/style/js/page.js"></script>
</head>
<body>

   <div class="row">
	sdf${pageBean.pageCount}sdf
	<s:if test="pageBean.pageCount==0">
		<div class="alert alert-danger" role="alert">暂时没有任何景点</div>
	</s:if>
	<s:else>
		<s:iterator value="recordList" var="scenery">
			<div class="col-sm-6 col-md-4">
		        <div class="thumbnail">
		            <img src="<%=contextPath %>/${scenery.logo}" alt="${scenery.realName}">
		            <div class="caption">
		                <h3>${scenery.realName}</h3>
		                <p>
		                    <a href="javascript:void(0);" class="btn btn-primary" role="button">浏览</a>
		                    <a href="javascript:void(0);" class="btn btn-default" role="button">上传</a>
		                </p>
		            </div>
		        </div>
		    </div>
		</s:iterator>
	</s:else>
	
	
    
      

   </div>
  <!--分页-->
  <nav>
      <ul class="pager">
          <li class="previous"><a href="javascript:void(0);" onclick="goPage(${pageBean.currentPage-1})"><span aria-hidden="true">&larr;</span>上一页</a></li>
          <li class="next"><a href="javascript:void(0);" onclick="goPage(${pageBean.currentPage+1})">下一页 <span aria-hidden="true">&rarr;</span></a></li>
      </ul>
  </nav>


    <!--景点图片浏览-->
    <div class="row">
        <a class="btn btn-primary" data-toggle="modal" href="imageList.html" data-target="#imageListModal">浏览</a>

        <!-- Modal -->
        <div class="modal fade" id="imageListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                </div>
            </div>
        </div>

        <script type="text/javascript">

            $("#imageListModal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
        </script>
    </div>

    <!--景点图片添加-->
    <div class="row">
        <a class="btn btn-primary" data-toggle="modal" href="addImage.html" data-target="#addImageModal">上传</a>

        <!-- Modal -->
        <div class="modal fade" id="addImageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                </div>
            </div>
        </div>

        <script type="text/javascript">

            $("#addImageModal").on("hidden.bs.modal", function() { $(this).removeData("bs.modal"); });
        </script>
    </div>


</div>

<script type="text/javascript">
	$(function(){
		
	})
	var url="<%=contextPath%>/scenery_doSeceryList.do";
	var page=new Page(url,"scenery_list");
	function goPage(num){
		page.gotoPage(num);
	}
</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">图片浏览</h4>


</div>
<div class="modal-body">
    <div  id="pageList">
        <div class="row">
            <div class="col-xs-6 col-md-3">
                <div class="thumbnail">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>标题</h3>
                        <p>描述</p>
                        <p>
                            <button type="button"  class="btn btn-primary" role="button">删除</button>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="thumbnail">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>标题</h3>
                        <p>描述</p>
                        <p>
                            <button type="button"  class="btn btn-primary" role="button">删除</button>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="thumbnail">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>标题</h3>
                        <p>描述</p>
                        <p>
                            <button type="button"  class="btn btn-primary" role="button">删除</button>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="thumbnail">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>标题</h3>
                        <p>描述</p>
                        <p>
                            <button type="button"  class="btn btn-primary" role="button">删除</button>
                        </p>
                    </div>
                </div>
            </div>

        </div>

    </div>


    <nav>
        <ul class="pager">
            <li><a href="javascript:void (0);" id="previous">Previous</a></li>
            <li><a href="javascript:void(0)" id="next">Next</a></li>
        </ul>
    </nav>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <button type="button" class="btn btn-primary">Save changes</button>
</div>
</body>

<script type="text/javascript">
    $("#previous").on("click",function(){
        var value={
            page:1
        }
        $.post("pageImages.html",null,function(data){
            console.info(data);
            $("#pageList").empty();
            $("#pageList").append(data);


        });
    });



</script>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/webuploader.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<form id="routeForm" method="post" class="form-horizontal" >
<s:hidden name="sceId"></s:hidden>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">图片浏览</h4>


</div>
<div class="modal-body">


        <div class="form-group">
            <label class="col-lg-3 control-label">名称</label>
            <div class="col-lg-5">
               <s:textfield cssClass="form-control" name="name" placeholder="输入路线名称" />
           
            </div>

        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">LOGO</label>
            <div class="col-lg-5">
                <!-- 单张图片上传 (注意：id) -->
                <img id="scenery_pic_img" style="width: 200px; height: 100px;float:left;" src='<%=contextPath%>/back/style/images/pixel_0.gif'/>
                <div style="float:left;margin:56px 0 0 20px;" id="scenery_pic_picker">选择图片</div>
                <s:hidden class="form-control" name="image" id="scenery_pic_input"/><!-- 单张图片上传结束-->
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-3 control-label">描述</label>
            <div class="col-lg-5">
               <s:textarea cssClass="form-control" rows="3" name="caption"></s:textarea>
            </div>
        </div>




</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary" id="checkSubmit">保存</button>
</div>
</form>
</body>

<script type="text/javascript">
    $(document).ready(function() {
        $('#routeForm').bootstrapValidator({
//        live: 'disabled',\
            /*  message: default, */
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                realName: {
                    group: '.col-lg-4',
                    validators: {
                        notEmpty: {
                            /*  message: 'The first name is required and cannot be empty' */
                        }
                    }
                }


            }
        });

    	new uploadSimpleImage('scenery_pic_img','scenery_pic_input','scenery_pic_picker');

        $("#checkSubmit").on('click',function(){

            var logoUrl=$("#scenery_pic_input").val();
       		if(logoUrl.length<=0){
                jNotify("请上传 LOGO !!");
                return;

            };

            var url="<%=contextPath%>/images_doAddPic.do";
            var redirUrl="<%=contextPath%>/images_toIndex.do?page=${page}"
            var data=$("#routeForm").serialize();
            console.info($("#addPicModal"));
            $('#addPicModal').modal('hide');
            $.post(url,data,function(data){
            	if(data&&data.success){
            		jNotify(data.msg);
            		window.location.href=redirUrl;
            	}else{
            		jError("操作出错了");
            	}
            },'json');

        });






    });



</script>
</html>
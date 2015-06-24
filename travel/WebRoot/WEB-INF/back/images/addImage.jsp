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
<form id="routeForm" method="post" class="form-horizontal" action="<%=contextPath%>/route_doSaveOrUpdateAction.do">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">图片浏览</h4>


</div>
<div class="modal-body">

    <div class="row">
        <div class="form-group">
            <label class="col-lg-3 control-label">名称</label>
            <div class="col-lg-5">
              <!--  <s:textfield cssClass="form-control" name="realName" placeholder="输入路线名称" />-->
                <input type="text" class="form-control" name="realName" placeholder="输入图片名称" />
            </div>

        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">LOGO</label>
            <div class="col-lg-5">
                <!-- 单张图片上传 (注意：id) -->
                <img id="router_logo_img" style="width: 200px; height: 100px;float:left;" src='<s:property value="getImageUrl()"/>'/>
                <div style="float:left;margin:56px 0 0 20px;" id="router_logo_picker">选择图片</div>
               <!-- <s:hidden class="form-control" name="logo" id="image_path"/>--><!-- 单张图片上传结束 -->

                <input type="hidden" id="image_path" name="imgPath">
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-3 control-label">描述</label>
            <div class="col-lg-5">
               <!-- <s:textfield cssClass="form-control" name="realName" placeholder="输入路线名称" />-->
                <textarea name="description" class="form-control" rows="5"></textarea>
            </div>

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



        $("#checkSubmit").on('click',function(){

            var logoUrl=$("#image_path").val();
          /*  if(logoUrl.length<=0){
                //jNotify("请上传 LOGO !!");
                console.info("请上传 Logo ");
                return;

            };*/

            var url="";
            var data=$("#routeForm").serialize();
            console.info($("#addImageModal"));
            $('#addImageModal').modal('hide');
            $.post(url,data,function(data){
                /* if(data&&data.success){
                     console.info($("#addImageModal"));
                     $('#addImageModal').modal('hide');
                 }else{
                     console.info(data.msg);
                 }*/
            });

        });






    });



</script>
</html>
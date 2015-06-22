<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf"%>  
<%@ include file="/WEB-INF/pub/bootstrap.jspf"%>  
<%@ include file="/WEB-INF/pub/ueditor.jspf"%>  
<%@ include file="/WEB-INF/pub/webuploader.jspf"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>友情链接管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>合作伙伴信息</h2>
                    </div>

                    <form id="friendlinkForm" method="post" class="form-horizontal" action="<%=contextPath%>/friendlink_doSaveOrUpdateAction.do">
                    	<s:hidden name="id" />
                        <div class="form-group">
                            <label class="col-lg-3 control-label">名称</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="realName" placeholder="输入合作伙伴名称" />
                            </div>
                          
                        </div>
        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">URL</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="url" placeholder="输入合作伙伴网址" />
                            </div>
                          
                        </div>
        

                        <div class="form-group">
                            <label class="col-lg-3 control-label">LOGO</label>
                            <div class="col-lg-5">
                            	<!-- 单张图片上传 (注意：id) -->
                            	<img id="friendlink_logo_img" style="width: 200px; height: 100px;float:left;" src=''/>
								<div style="float:left;margin:56px 0 0 20px;" id="friendlink_logo_picker">选择图片</div> 
                                <input type="hidden" class="form-control" name="logo" id="friendlink_logo_input"/><!-- 单张图片上传结束 -->
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">友好程度</label>
                            <div class="col-lg-5">
                               	<s:set value="#{1:'A',2:'AA',3:'AAA',4:'AAAA',5:'AAAAA'}" var="gradeMap"></s:set>
                               	
                               	<s:select cssClass="form-control" list="#gradeMap" listKey="key" listValue="value" name="grade" ></s:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">summary</label>
                            <div class="col-lg-5">
                            	<s:textarea name="summary" cssClass="form-control"/>
                            </div>
                        </div>

                     

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">提交</button>
                               <!--  <button type="button" class="btn btn-info" id="validateBtn">错误提示</button> -->
                                <button type="button" class="btn btn-info" id="resetBtn">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>

<script type="text/javascript">
$(document).ready(function() {
 

    $('#friendlinkForm').bootstrapValidator({
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
            },
            logo: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            url: {
                validators: {
                    notEmpty: {
                  /*       message: 'default' */
                    },
                    uri: {
                		allowLocal: true
                    }
                }
            },
            grade: {
                validators: {
                    notEmpty: {
/*                         message: 'default' */
                    },
                    digits: {
                        /* message: 'default' */
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#friendlinkForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#friendlinkForm').data('bootstrapValidator').resetForm(true);
    });
    

	new uploadSimpleImage('friendlink_logo_img','friendlink_logo_input','friendlink_logo_picker');
});
</script>
</body>
</html>

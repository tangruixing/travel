<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/baidu-bootstrap.jspf"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>旅游路线管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>Sign up</h2>
                    </div>

                    <form id="routeForm" method="post" class="form-horizontal" action="<%=contextPath%>/route_doSaveOrUpdateAction.do">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">名称</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="realName" placeholder="输入路线名称" />
                            </div>
                          
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">LOGO</label>
                            <div class="col-lg-5">
                            	<!-- 单张图片上传 (注意：id) -->
                            	<img id="router_logo_img" style="width: 200px; height: 100px;float:left;" src='<%=pixel_0%>'/>
								<div style="float:left;margin:56px 0 0 20px;" id="router_logo_picker">选择图片</div> 
                                <input type="hidden" class="form-control" name="logo" id="router_logo_input"/><!-- 单张图片上传结束 -->
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">出发时间</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control Wdate" name="startDate" id="startDate"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d+1}',maxDate:'#F{$dp.$D(\'endDate\')}'})"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">结束时间</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control Wdate" name="endDate" id="endDate"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}'})"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">报名人数</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="numPeople" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">人均消费</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="money" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线详情</label>
                            <div class="col-lg-9">
                               	<textarea id="router_content" name="description"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">Sign up</button>
                                <button type="submit" class="btn btn-primary" name="signup2" value="Sign up 2">Sign up 2</button>
                                <button type="button" class="btn btn-info" id="validateBtn">Manual validate</button>
                                <button type="button" class="btn btn-info" id="resetBtn">Reset form</button>
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
            },
            logo: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            startDate: {
                validators: {
                    notEmpty: {
                  /*       message: 'default' */
                    }
                }
            },
            endDate: {
                validators: {
                	notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            money: {
                validators: {
                    notEmpty: {
                      /*   message: 'default' */
                    },
                    regexp: {
                    	 regexp:/^(\d){1,8}(\.)?(\d(\d)?)?$/,
                         message: '请正确输入货币类型' 
                    }
                 
                }
            },
            description: {
                validators: {
                    notEmpty: {

                    }
                }
            },
            numPeople: {
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
        $('#routeForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#routeForm').data('bootstrapValidator').resetForm(true);
    });
    

	new uploadSimpleImage('router_logo_img','router_logo_input','router_logo_picker');
	UE.getEditor('router_content');
});
</script>
</body>
</html>

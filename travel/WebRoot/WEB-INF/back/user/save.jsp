<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>用户管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>用户信息</h2>
                    </div>

                    <form id="userForm" class="form-horizontal" method="post" action="<%=contextPath %>/user_doSaveOrUpdate.do">
                    	<s:hidden name="id" />
                        <div class="form-group">
                            <label class="col-lg-3 control-label">手机号</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="mobile" placeholder="输入手机号" />
                            </div>
                          
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">昵称</label>
                            <div class="col-lg-9">
                               	  <s:textfield cssClass="form-control" name="realName" placeholder="请输入昵称" />
                            </div>
                        </div>
                        
						 <div class="form-group">
                            <label class="col-lg-3 control-label">角色</label>
                            <div class="col-lg-5">
                                <s:set value="#{0:'超级管理员',1:'管理员',2:'普通用户'}" var="roleMap"></s:set>
                                <s:select cssClass="form-control" list="#roleMap" listKey="key" listValue="value" name="role" headerKey="2"></s:select>
                            </div>
                          
                        </div>
                        
                        
                           
						<div class="form-group">
                            <label class="col-lg-3 control-label">邮箱</label>
                            <div class="col-lg-9">
                               	  <s:textfield cssClass="form-control" name="eamil" placeholder="shaonian@qq.com" />
                            </div>
                        </div>
                        
						<div class="form-group">
                            <label class="col-lg-3 control-label">性别</label>
                            <div class="col-lg-9">
                               	  <s:set value="#{1:'男',2:'女',3:'保密'}" var="sexMap"></s:set>
                                <s:select cssClass="form-control" list="#sexMap" listKey="key" listValue="value" name="sex" headerKey="2"></s:select>
                            </div>
                        </div>
                        
                        
						 <div class="form-group">
                            <label class="col-lg-3 control-label">出生日期</label>
                            <div class="col-lg-5">
                                  <input type="text" class="form-control Wdate" name="birth" 
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-{%d}'})"
                                 value="${birth}"
                                />
                            </div>
                          
                        </div>

                      

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" >提交</button>
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
 

    $('#userForm')
    .bootstrapValidator({
//        live: 'disabled',\

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	mobile: {
              
                validators: {
                	  	notEmpty: {
                          /*   message: 'default' */
                        },
                        phone: {
                        	country: 'CN'
                        },
                        remote: {
                            type: 'POST',
                            url: '<%=contextPath%>/user_canRegister.do',
                            message: '该手机已经注册',
                            delay: 1000,
                            dataType: "json"           //接受数据格式
                        },
                }
            },
            role: {
              
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            eamil:{
            	
                validators: {
                    notEmpty:{
                  /*       message: 'default' */
                    },
                    emailAddress:{
                    }
                }
            },
            realName: {
            	
                validators: {
                	notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            birth: {
            	
                validators: {
                    notEmpty: {
                    }
                }
            }
        }
    })
    .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(data) {
            	if(data&&data.success){
        			parent.mainDlg.close("#user_grid");
        			jSuccess(data.msg);
        		}else{
        			jError(data.msg);
        		}
            }, 'json');
     });

    $('#resetBtn').click(function() {
        $('#userForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>
</body>
</html>
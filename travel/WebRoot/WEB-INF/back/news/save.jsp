<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>
<%-- <%@ include file="/WEB-INF/pub/webuploader.jspf" %> --%>
<%@ include file="/WEB-INF/pub/ueditor.jspf" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>新闻管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>新闻信息</h2>
                    </div>

                    <form id="newsForm" class="form-horizontal" method="post" action="<%=contextPath %>/news_doSaveOrUpdate.do">
                    	<s:hidden name="id" />
                        <div class="form-group">
                            <label class="col-lg-3 control-label">标题</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="title" placeholder="输入新闻标题" />
                            </div>
                          
                        </div>
						
						 <div class="form-group">
                            <label class="col-lg-3 control-label">子标题</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="subTitle" placeholder="输入新闻子标题" />
                            </div>
                          
                        </div>
						 <div class="form-group">
                            <label class="col-lg-3 control-label">作者</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="author" placeholder="输入作者" />
                            </div>
                          
                        </div>
                        
                        
                           
						<div class="form-group">
                            <label class="col-lg-3 control-label">热门</label>
                            <div class="col-lg-9">
                               		<s:set value="#{0:'否',1:'是'}" var="hotMap"></s:set>
                               	
                               	<s:select cssClass="form-control" list="#hotMap" listKey="key" listValue="value" name="hot" ></s:select>
                            </div>
                        </div>
						 <div class="form-group">
                            <label class="col-lg-3 control-label">新闻摘要</label>
                            <div class="col-lg-5">
                                <s:textarea cssClass="form-control" name="summary" rows="3" />
                            </div>
                          
                        </div>
                     

                        <div class="form-group">
                            <label class="col-lg-3 control-label">内容</label>
                            <div class="col-lg-9">
                               	<s:textarea id="news_content" name="content" />
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
 

    $('#newsForm')
    .bootstrapValidator({
//        live: 'disabled',\
       /*  message: default, */
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	title: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            subTitle: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            author: {
            	group: '.col-lg-4',
                validators: {
                    notEmpty: {
                  /*       message: 'default' */
                    }
                }
            },
            summary: {
            	group: '.col-lg-4',
                validators: {
                	notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            content: {
            	 group: '.col-lg-4',
                validators: {
                    notEmpty: {
                      /*   message: 'default' */
                    }
                }
            },
            hot: {
            	 group: '.col-lg-4',
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
        			parent.mainDlg.close("#news_grid");
        			jSuccess(data.msg);
        		}else{
        			jError(data.msg);
        		}
            }, 'json');
     });

    $('#resetBtn').click(function() {
        $('#newsForm').data('bootstrapValidator').resetForm(true);
    });

	UE.getEditor('news_content');
});
</script>
</body>
</html>
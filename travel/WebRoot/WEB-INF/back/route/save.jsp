<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%		
	String contextPath=request.getContextPath();
%>

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
                        <h2>旅游线路信息</h2>
                    </div>

                    <form id="routeForm" method="post" class="form-horizontal" action="<%=contextPath%>/route_doSaveOrUpdate.do">
                    	<s:hidden name="id" />


                    	<s:hidden name="routeType" />

                        <div class="form-group">
                            <label class="col-lg-3 control-label">名称</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="realName" placeholder="输入路线名称" />
                            </div>
                          
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">LOGO</label>
                            <div class="col-lg-5">
                            	<!-- 单张图片上传 (注意：id) -->
                            	<img id="router_logo_img" style="width: 200px; height: 100px;float:left;" src='<s:property value="getImageUrl()"/>'/>
								<div style="float:left;margin:56px 0 0 20px;" id="router_logo_picker">选择图片</div> 
                                <s:hidden class="form-control" name="logo" id="router_logo_input"/><!-- 单张图片上传结束 -->
                            </div>
                        </div>
					
						<div class="form-group">
                            <label class="col-lg-3 control-label">人均消费</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="money" />
                            </div>
                        </div>
						<s:if test="routeType==0"><!-- 针对普通用户 -->
							<div class="form-group">
                            <label class="col-lg-3 control-label">报名截止时间</label>
                            <div class="col-lg-5">
                                <input id="regDate" type="text" class="form-control Wdate" name="regDate" id="regDate"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d+1}',maxDate:'#F{$dp.$D(\'startDate\')}'})"
                                 value="${regDate}"
                                />
                            </div>
                            </div>
							<div class="form-group">
                            <label class="col-lg-3 control-label">出发时间</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control Wdate" name="startDate" id="startDate"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'regDate',maxDate:'#F{$dp.$D(\'endDate\')}'})"
                                 value="${startDate}"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">结束时间</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control Wdate" name="endDate" id="endDate"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}'})"
                                 value="${endDate}"
                                />
                            </div>
                        </div>
                        
                       <div class="form-group">
                            <label class="col-lg-3 control-label">报名人数</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="numPeople" />
                            </div>
                        </div>
                        
						</s:if>
						
						<s:else><!-- 针对自由行用户 -->
							<div class="form-group">
                            <label class="col-lg-3 control-label">行程建议</label>
                            <div class="col-lg-9">
<%--                                	<s:textarea  row="5" id="router_suggest" name="suggest" /> --%>
                               	<s:textarea cssClass="form-control"   row="5" id="router_suggest" name="suggest" />

                            </div>
                        </div>
						</s:else>
                        
  						
                     
                      

                        <div class="form-group">
                            <label class="col-lg-3 control-label">简介</label>
                            <div class="col-lg-5">
                            	<s:textarea name="summary" cssClass="form-control" rows="5"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">热门</label>
                            <div class="col-lg-5">
                            		<s:set value="#{false:'否',true:'是'}" var="hotMap"></s:set>
                               	<s:select cssClass="form-control" list="#hotMap" listKey="key" listValue="value" name="hot" ></s:select>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线详情</label>
                            <div class="col-lg-9">
                               	<s:textarea  id="router_content" name="description" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">



                                <button type="submit" class="btn btn-primary" id="checkSubmit">提交</button>
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
                
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            logo: {
                
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
        			parent.mainDlg.close();
        			jSuccess(data.msg);
        		}else{
        			jError(data.msg);
        		}
            }, 'json');
     });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#routeForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#routeForm').data('bootstrapValidator').resetForm(true);
    });
    

	new uploadSimpleImage('router_logo_img','router_logo_input','router_logo_picker');
	var content=UE.getEditor('router_content');
	/* var suggest=UE.getEditor('router_suggest'); */
	
	$("#checkSubmit").on('click',function(){
		
		var logoUrl=$("#router_logo_input").val();
		if(logoUrl.length<=0){
			jNotify("请上传 LOGO !!");
			return false;
		}
		
		
		
		var routeType=${routeType};
		console.info(routeType);
		
	
		if(routeType=='1'){
			if(str.length<=0){
				jNotify("行程建议不能为空");
				return false;
			}
		}
	});

});
</script>
</body>
</html>

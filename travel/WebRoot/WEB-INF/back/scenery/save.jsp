<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/baidu-bootstrap.jspf"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>景区管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-md-8 col-md-offset-2">
                    <div class="page-header">
                        <h2>景区管理</h2>
                    </div>

                    <s:form id="sceneryForm" method="post" cssClass="form-horizontal" action="scenery_doSaveOrUpdateAction.do">
                    	<s:hidden id="lng" name="longitude" /><!-- 经度 -->
                    	<s:hidden id="lat" name="latitude" /><!-- 纬度 -->
                    	<s:hidden name="id"/><!-- 景区/景点 id -->
                    	<s:hidden name="sceId"/><!-- 景点的景区id -->
                    	
                        <div class="form-group">
                            <label class="col-md-3 control-label">名称</label>
                            <div class="col-md-5">
                            
                                <s:textfield cssClass="form-control" name="realName" placeholder="请输入名称" />
                            </div>
                        </div> 
                       
                       <div class="form-group">
                           <label class="col-md-3 control-label">地址</label>
                            <div class="col-md-5">
                                <s:textfield id="userInput"  cssClass="form-control" name="address" placeholder="请输入地址" />
                            </div>
                          	<div class="col-md-2">
							<input type="button" class="btn btn-primary btn-sm" id="markBtn" data-toggle="modal" value="地图标记" />
                            </div>
                      
 						</div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">LOGO</label>
                            <div class="col-md-5">
                            	<!-- 单张图片上传 (注意：id) -->
                            	<img id="scenery_logo_img" style="width: 200px; height: 100px;float:left;" src='<s:property value="getImageUrl()"/>'/>
								<div style="float:left;margin:56px 0 0 20px;" id="scenery_logo_picker">选择图片</div> 
							
                                <s:hidden cssClass="form-control" name="logo" id="scenery_logo_input"/><!-- 单张图片上传结束 -->
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">开放时间</label>
                            <div class="col-md-5">
                                <s:textfield cssClass="form-control Wdate" name="startTime" id="startTime"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'endTime\')}'})"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">结束时间</label>
                            <div class="col-md-5">
                                <s:textfield cssClass="form-control Wdate" name="endTime" id="endTime"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'HH:mm',minDate:'#F{$dp.$D(\'startTime\')}'})"
                                 
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">网址</label>
                            <div class="col-md-5">
                                <s:textfield cssClass="form-control" name="url" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">景区级别</label>
                            <div class="col-md-5">
                               	<s:set value="#{1:'A',2:'AA',3:'AAA',4:'AAAA',5:'AAAAA'}" var="gradeMap"></s:set>
                               	
                               	<s:select cssClass="form-control" list="#gradeMap" listKey="key" listValue="value" name="grade" ></s:select>
                            </div>
                        </div>

						 <div class="form-group">
                            <label class="col-md-3 control-label">景区联系电话</label>
                            <div class="col-md-5">
                                <s:textfield cssClass="form-control" name="telphone" />
                            </div>
                        </div>
                        
						 <div class="form-group">
                            <label class="col-md-3 control-label">轮播</label>
                            <div class="col-md-5">
                                <s:set value="#{0:'否',1:'是'}" var="booleanMap"></s:set>
                               	
                               	<s:select cssClass="form-control" list="#booleanMap" listKey="key" listValue="value" name="viwepager" value="0" ></s:select>
                            </div>
                        </div>
						 <div class="form-group">
                            <label class="col-md-3 control-label">推荐</label>
                            <div class="col-md-5">
                               	
                               	<s:select cssClass="form-control" list="#booleanMap" listKey="key" listValue="value" name="suggest" value="0" ></s:select>
                            </div>
                        </div>
                        
                       
                        
                        

                        <div class="form-group">
                            <label class="col-md-3 control-label">景区详情</label>
                            <div class="col-md-9">
                               	<s:textarea id="scenery_content" name="introduction"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-3">
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">提交</button>
                                <button type="submit" class="btn btn-primary" name="signup2" value="Sign up 2">提交2</button>
                                <button type="button" class="btn btn-info" id="validateBtn">错误提示</button>
                                <button type="button" class="btn btn-info" id="resetBtn">重置</button>
                            </div>
                        </div>
                    </s:form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>


<!-- 地图标记  -->
<%@ include file="/WEB-INF/pub/markMap.jspf" %>
<script type="text/javascript">
$(document).ready(function() {
 

    $('#sceneryForm').bootstrapValidator({
//        live: 'disabled',\
       /*  message: default, */
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	realName: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            address: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            longitude: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            latitude: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            logo: {
                group: '.col-md-4',
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
                    }
                }
            },
            startTime: {
                validators: {
                    notEmpty: {
                  /*       message: 'default' */
                    }
                }
            },
            endTime: {
                validators: {
                	notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            url: {
                validators: {
                	uri: {
                		allowLocal: true
                    }
                 
                }
            },
            telphone: {
                validators: {
                    notEmpty: {
                      /*   message: 'default' */
                    },
                    phone: {
                    	country: 'CN'
                    }
                 
                }
            },
            grade: {
                validators: {
                    notEmpty: {
                      /*   message: 'default' */
                    }
                 
                }
            },
            introduction: {
                validators: {
                    notEmpty: {

                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#sceneryForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#sceneryForm').data('bootstrapValidator').resetForm(true);
    });
    

	new uploadSimpleImage('scenery_logo_img','scenery_logo_input','scenery_logo_picker');
	UE.getEditor('scenery_content');
	
	
});

window.onload=function(){
	Location.init();
}
</script>
</body>
</html>

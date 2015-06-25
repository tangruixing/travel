<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf"%>  
<%@ include file="/WEB-INF/pub/bootstrap.jspf"%>  
<%@ include file="/WEB-INF/pub/ueditor.jspf"%>  
<%@ include file="/WEB-INF/pub/webuploader.jspf"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>酒店管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>酒店管理</h2>
                    </div>

                    <s:form id="hotelForm" method="post" cssClass="form-horizontal" action="hotel_doSaveOrUpdateAction.do">
                    	<s:hidden id="lng" name="longitude" /><!-- 经度 -->
                    	<s:hidden id="lat" name="latitude" /><!-- 纬度 -->
                    	<s:hidden name="id"/><!-- 酒店/景点 id -->
                    	
                        <div class="form-group">
                            <label class="col-lg-3 control-label">名称</label>
                            <div class="col-lg-5">
                            
                                <s:textfield cssClass="form-control" name="realName" placeholder="请输入名称" />
                            </div>
                        </div> 
                       
                       <div class="form-group">
                           <label class="col-lg-3 control-label">地址</label>
                            <div class="col-lg-5">
                                <s:textfield id="userInput"  cssClass="form-control" name="address" placeholder="请输入地址" />
                            </div>
                          	<div class="col-lg-2">
							<input type="button" class="btn btn-primary btn-sm" id="markBtn" data-toggle="modal" value="地图标记" />
                            </div>
 						</div>
 						
                        <div class="form-group">
                            <label class="col-lg-3 control-label">LOGO</label>
                            <div class="col-lg-5">
                            	<!-- 单张图片上传 (注意：id) -->
                            	<img id="hotel_logo_img" style="width: 200px; height: 100px;float:left;" src='<s:property value="getImageUrl()"/>'/>
								<div style="float:left;margin:56px 0 0 20px;" id="hotel_logo_picker">选择图片</div> 
							
                                <s:hidden cssClass="form-control" name="logo" id="hotel_logo_input"/><!-- 单张图片上传结束 -->
                            </div>
                        </div>
                       

                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店级别</label>
                            <div class="col-lg-5">
                               	<s:set value="#{1:'A',2:'AA',3:'AAA',4:'AAAA',5:'AAAAA'}" var="gradeMap"></s:set>
                               	
                               	<s:select cssClass="form-control" list="#gradeMap" listKey="key" listValue="value" name="grade" ></s:select>
                            </div>
                        </div>

						 <div class="form-group">
                            <label class="col-lg-3 control-label">酒店联系电话</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="telphone" />
                            </div>
                        </div>
        

                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店详情</label>
                            <div class="col-lg-9">
                               	<s:textarea id="hotel_content" name="introduction"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" id="checkSubmit">提交</button>
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
 

    $('#hotelForm').bootstrapValidator({
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
            address: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            longitude: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            latitude: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
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
    
    
  $("#checkSubmit").on('click',function(){
		
		var logoUrl=$("#hotel_logo_input").val();
		if(logoUrl.length<=0){
			jNotify("请上传 LOGO !!");
			return false;
		}
	});
    
    
    $('#resetBtn').click(function() {
        $('#hotelForm').data('bootstrapValidator').resetForm(true);
    });
    

	new uploadSimpleImage('hotel_logo_img','hotel_logo_input','hotel_logo_picker');
	UE.getEditor('hotel_content');
	
	
});

window.onload=function(){
	Location.init();
}
</script>
</body>
</html>

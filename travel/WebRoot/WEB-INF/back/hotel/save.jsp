<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

                    <s:form id="hotelForm" method="post" cssClass="form-horizontal" action="hotel_doSaveOrUpdate.do">
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
                            <label class="col-lg-3 control-label">图片</label>
                            <div class="col-lg-9">
                            	<!-- 多张图片 -->
                            	<div id="wrapper">
							<div id="container">
								<div id="uploader">
									<div class="queueList">
										<ul class="filelist" id="filelist2"></ul>
								    	<div class="statusBar" style="">
											<div class="progress" style="display: none;">
												<span class="text">0%</span> <span class="percentage" style="width: 0%;"></span>
											</div>
											<div class="info">  </div>
											<div class="btns">
												<div id="filePicker2" class="webuploader-container">
												<div class="webuploader-pick" style="">继续添加</div>
												<div id="rt_rt_19iuagm1e14ms14tj1qschtic766" style="position: absolute; top: 0px; left: 10px; width: 94px; height: 42px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file" class="webuploader-element-invisible" multiple="multiple"><label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial;"></label></div></div>
												<div class="uploadBtn state-ready">开始上传</div>
											</div>
										</div>
									</div> 
								</div>
							</div>
					   </div>  
					    <s:hidden id="images" name="picture" maxlength="25000"/>
					    <!-- 多张图片结束 -->
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


<!-- 地图标记 -->
<div id="markDlg">
					
	<div id="l-map" style="height:100%" class="dis"></div>					
</div>
<div id="dlg-markDlg-buttons" class="dis">
<div id="r-result">
	<font style="float:left">请输入搜索地址:&nbsp;&nbsp;&nbsp;&nbsp;</font><input type="text" style="float:left; width: 320px;"  id="suggestId"   maxlength="255" size="20" /></div>
	<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
    <a href="javascript:void(0)" class="easyui-linkbutton" id="mark_close" style="width:90px">确定</a>
</div> <!-- 地图标记结束 -->
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
              
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            address: {
              
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            longitude: {
              
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            latitude: {
              
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
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
        		/* 	UE.getEditor('hotel_content').destroy(); */
        			jSuccess(data.msg);
        		}else{
        			jError(data.msg);
        		}
            }, 'json');
     });
    
    var oldData = new uploadManyImages('wrapper',$('#filelist2'),5);//后台可编辑回显示
	oldData.initEcho('filelist2','${picture}');//把图片回显
	
  $("#checkSubmit").on('click',function(){
		
		var logoUrl=$("#hotel_logo_input").val();
		if(logoUrl.length<=0){
			jNotify("请上传 LOGO !!");
			return false;
		}
		
		var imgSrc = oldData.getInsertString();
  	    var allSrc = oldData.getEchoInsertString();

  	    if(imgSrc != "" && allSrc != "")
  			allSrc = imgSrc + "#" + allSrc;
  		else
  			allSrc = imgSrc + allSrc;
  	    
  	    if(allSrc.length<=0){
  	    	console.info("没有上传图片");
  	    	jNotify("请上传图片");
  	    	return false;
  	    }
  	    $('#images').val(allSrc);
  	    console.info(allSrc);
	});
    
    
    $('#resetBtn').click(function() {
        $('#hotelForm').data('bootstrapValidator').resetForm(true);
    });
	
	new uploadSimpleImage('hotel_logo_img','hotel_logo_input','hotel_logo_picker');
    
    UE.getEditor('hotel_content');
    
	
	
	
});

Location.initDlg();
</script>
</body>
</html>

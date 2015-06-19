<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/baidu-bootstrap.jspf"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>景区管理</title>
    
    <style type="text/css">
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-size:14px;}
		#l-map{height:300px;width:100%;}
		#r-result{width:100%;}
		.tangram-suggestion-main{z-index:999999}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CA3NlRi4BRVc5elDe4l0tXnu"></script>
<script type="text/javascript" src="<%=contextPath%>/back/style/js/location.js"/"></script>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>景区管理</h2>
                    </div>

                    <form id="sceneryForm" method="post" class="form-horizontal" action="<%=contextPath%>/route_doSaveOrUpdateAction.do">
                    	<s:hidden id="lng" name="longitude" /><!-- 经度 -->
                    	<s:hidden id="lat" name="latitude" /><!-- 纬度 -->
                    	<s:hidden name="rid"/> 
                    	
                        <div class="form-group">
                            <label class="col-lg-3 control-label">名称</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="realName" placeholder="请输入名称" />
                            </div>
                          
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">地址</label>
                            <div class="col-lg-5">
                                <input type="text" id="userInput"  class="form-control" name="address" placeholder="请输入地址" />
                                <!-- <button type="button" class="btn btn-info" id="markBtn">地图标记</button> -->
                                <!-- 按钮触发模态框 -->
								<input type="button" class="btn btn-primary btn-sm" id="markBtn" data-toggle="modal" value="地图标记" />
                            </div>
                          
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">LOGO</label>
                            <div class="col-lg-5">
                            	<!-- 单张图片上传 (注意：id) -->
                            	<img id="scenery_logo_img" style="width: 200px; height: 100px;float:left;" src='<%=pixel_0%>'/>
								<div style="float:left;margin:56px 0 0 20px;" id="scenery_logo_picker">选择图片</div> 
                                <input type="hidden" class="form-control" name="logo" id="scenery_logo_input"/><!-- 单张图片上传结束 -->
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">开放时间</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control Wdate" name="startTime" id="startTime"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}'})"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">结束时间</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control Wdate" name="endTime" id="endTime"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'HH:mm:ss',minDate:'#F{$dp.$D(\'endDate\')}'})"
                                 
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">网址</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="url" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">景区级别</label>
                            <div class="col-lg-5">
                               	<s:set value="#{1:'A',2:'AA',3:'AAA',4:'AAAA',5:'AAAAA'}" var="gradeMap"></s:set>
                               	
                               	<s:radio cssClass="radio" list="#gradeMap" listKey="key" listValue="value" name="grade" ></s:radio>
                            </div>
                        </div>

						 <div class="form-group">
                            <label class="col-lg-3 control-label">景区联系电话</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="telphone" />
                            </div>
                        </div>
                        
						 <div class="form-group">
                            <label class="col-lg-3 control-label">轮播</label>
                            <div class="col-lg-5">
                                <s:set value="#{0:'否',1:'是'}" var="booleanMap"></s:set>
                               	
                               	<s:radio cssClass="radio" list="#booleanMap" listKey="key" listValue="value" name="viwepager" value="0" ></s:radio>
                            </div>
                        </div>
						 <div class="form-group">
                            <label class="col-lg-3 control-label">推荐</label>
                            <div class="col-lg-5">
                               	
                               	<s:radio cssClass="radio" list="#booleanMap" listKey="key" listValue="value" name="suggest" value="0" ></s:radio>
                            </div>
                        </div>
                        
                       
                        
                        

                        <div class="form-group">
                            <label class="col-lg-3 control-label">景区详情</label>
                            <div class="col-lg-9">
                               	<textarea id="scenery_content" name="description"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">提交</button>
                                <button type="submit" class="btn btn-primary" name="signup2" value="Sign up 2">提交2</button>
                                <button type="button" class="btn btn-info" id="validateBtn">错误提示</button>
                                <button type="button" class="btn btn-info" id="resetBtn">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>




<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" >
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               地图标记
            </h4>
         </div>
         <div class="modal-body">
        		
        		
        		
        		<div id="l-map" style="height:100%"></div>	
        		
        		
         </div>
         <div class="modal-footer">
         	<div id="r-result"><font style="float:left">请输入搜索地址:&nbsp;&nbsp;&nbsp;&nbsp;</font><input type="text" style="float:left; width: 320px;"  id="suggestId"   maxlength="255" size="20" /></div>
					<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
            <button type="button" class="btn btn-primary" id="markClose" data-dismiss="modal">
              确定
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->









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
                    notEmpty: {
                      /*   message: 'default' */
                    },
                    remote: {
                    }
                 
                }
            },
            telphone: {
                validators: {
                    notEmpty: {
                      /*   message: 'default' */
                    },
                    phone: {
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
	
	Location.init();
});
</script>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%		
	String contextPath=request.getContextPath();
	
	String pixel_0=contextPath+"/back/style/images/pixel_0.gif";//0像素的背景，一般用于占位
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>风景管理</title>
</head>
<body>
 <s:if test="type==1">
 	<c:set value="景区" var="stitle"></c:set>
 </s:if>
<s:else>
	<c:set value="景点" var="stitle"></c:set>
</s:else>

 <s:set value="#{false:'否',true:'是'}" var="booleanMap"></s:set>
<s:set value="#{1:'A',2:'AA',3:'AAA',4:'AAAA',5:'AAAAA'}" var="gradeMap"></s:set>
 <div class="container">
 

        <div class="row">
            <!-- form: -->
            <section>
      
                <div class="col-md-8 col-md-offset-2">
                    <div class="page-header">
                        <h2>${stitle}管理</h2>
                    </div>

			
                    <s:form id="sceneryForm" method="post" cssClass="form-horizontal" action="scenery_doSaveOrUpdate.do">
                    	<s:hidden id="lng" name="longitude" /><!-- 经度 -->
                    	<s:hidden id="lat" name="latitude" /><!-- 纬度 -->
                    	<s:hidden name="id"/><!-- 景区/景点 id -->
                    	
             
                    	
                    	
                    
                      
                        <div class="form-group">
                            <label class="col-md-3 control-label">${stitle}名称</label>
                            <div class="col-md-5">
                            
                                <s:textfield cssClass="form-control" name="realName" placeholder="请输入${stitle}名称" />
                            </div>
                        </div> 
                       
                       <div class="form-group">
                           <label class="col-md-3 control-label">地址</label>
                            <div class="col-md-5">
                                <s:textfield id="userInput"  cssClass="form-control" name="address" placeholder="请输入${stitle}地址" />
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
                        
                      
                      	<s:if test="type==2">
                      	
                      	
                    	  <div class="form-group">
                            <label class="col-md-3 control-label">所属景区</label>
                            <div class="col-md-5">
                                <s:textfield cssClass="form-control" name="sceId" id="sceId"  placeholder="请选择景区" />
                            </div>
                          </div> 
                        </s:if>
                    	<s:elseif test="type==1">

                    		 <div class="form-group">
                            <label class="col-md-3 control-label">开放时间</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control Wdate" name="startTime" id="startTime"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'endTime\')}'})"
                                 value="${startTime}"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">结束时间</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control Wdate" name="endTime" id="endTime"
                                 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'HH:mm',minDate:'#F{$dp.$D(\'startTime\')}'})"
                                 value="${endTime}"
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
                               	<s:select cssClass="form-control" list="#gradeMap" listKey="key" listValue="value" name="grade" ></s:select>
                            </div>
                        </div>
                        
                          
						 <div class="form-group">
                            <label class="col-md-3 control-label">轮播</label>
                            <div class="col-md-5">
                              
                               	<s:select cssClass="form-control" list="#booleanMap" listKey="key" listValue="value" name="viwepager" value="0" ></s:select>
                            </div>
                        </div>
               </s:elseif> 

                    

						 <div class="form-group">
                            <label class="col-md-3 control-label">${stitle}联系电话</label>
                            <div class="col-md-5">
                                <s:textfield cssClass="form-control" name="telphone" />
                            </div>
                        </div>
                      
						 <div class="form-group">
                            <label class="col-md-3 control-label">${stitle}推荐</label>
                            <div class="col-md-5">
                               	
                               	<s:select cssClass="form-control" list="#booleanMap" listKey="key" listValue="value" name="suggest" value="0" ></s:select>
                            </div>
                        </div>
                        
                       
                        
                        

                        <div class="form-group">
                            <label class="col-md-3 control-label">${stitle }简介</label>
                            <div class="col-md-9">
                               <s:textarea cssClass="form-control" rows="3" name="summary"></s:textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-md-3 control-label">${stitle }详情</label>
                            <div class="col-md-9">
                               	<s:textarea id="scenery_content" name="introduction"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-3">
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
 
	if('${type}'==2){//景点：加载景区

		$('#sceId').combogrid({ 
	    	panelWidth:450,
	        idField:'id', //ID字段  
	        textField:'realName', //显示的字段  
	        url:"<%=contextPath%>/scenery_doList.do?type=1",  
	        fitColumns: true,  
	        striped: true,  
	        editable:true,  
	        pagination : true,//是否分页  
	        rownumbers:true,//序号  
	        collapsible:false,//是否可折叠的  
	        fit: true,//自动大小  
	        pageSize: 10,//每页显示的记录条数，默认为10  
	        pageList: [10],//可以设置每页记录条数的列表  
	        method:'post',  
	        columns:[[{
	            title : '景区编号',
	            field : 'id',// 绑定属性名字,后台返回的json数据
	            width : 100,// 必须要给，大于50
	            sortable : true,// 鼠标点击可以升序/降序切换
	            checkbox : true
	        	},{
				title : '景区名称',
				field : 'realName',
				width : 100,
				sortable : true
				},{
				title : '地址',
				field : 'address',
				width : 100,
				sortable : true
				},{
				title : '开放时间',
				field : 'openDime',
				width : 100,
				sortable : true
				},{
				title : '景区级别',
				field : 'grade',
				width : 100,
				sortable : true
				},{
				title : '景区联系电话',
				field : 'telphone',
				width : 100,
				sortable : true
				},{
				title : '推荐',
				field : 'suggest',
				width : 100,
				sortable : true
				}]]
	    });  
	}
	

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

    // Validate the form manually
    $("#checkSubmit").on('click',function(){
		
    	if('${type}'==2){//景点
    		console.info($("#sceId").val());
    		if($("input[name='sceId']").val().length<=0){
    			jNotify("请选择一个景区");
    			return false;
    		}
    	}
    	
    	
		var logoUrl=$("#scenery_logo_input").val();
		if(logoUrl.length<=0){
			jNotify("请上传 LOGO !!");
			return false;
		}
	});
    
    $('#resetBtn').click(function() {
        $('#sceneryForm').data('bootstrapValidator').resetForm(true);
    });
    

	new uploadSimpleImage('scenery_logo_img','scenery_logo_input','scenery_logo_picker');
	UE.getEditor('scenery_content');
	
	
});
Location.initDlg();
</script>
</body>
</html>

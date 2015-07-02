<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%		
	String contextPath=request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>${hotname}房型管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>${hotname}房型管理</h2>
                    </div>

                    <s:form id="roomstyleForm" method="post" cssClass="form-horizontal" action="roomstyle_doSaveOrUpdate.do">
                    	<s:hidden name="id"/><!-- 房型/景点 id -->
                    	<s:hidden name="hotId" />
                    	<s:hidden name="hotname" />

                    	
                        <div class="form-group">
                            <label class="col-lg-3 control-label">名称</label>
                            <div class="col-lg-5">

                                <s:textfield cssClass="form-control" name="realName" placeholder="请输入名称" />
                            </div>
                        </div> 
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">图片</label>
                            <div class="col-lg-8">
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
                            <label class="col-lg-3 control-label">房屋面积(㎡)</label>
                            <div class="col-lg-5">
                            
                                <s:textfield cssClass="form-control" name="area" placeholder="请输入建筑面积" />
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">最多可入住人数(人)</label>
                            <div class="col-lg-5">
                            
                                <s:textfield cssClass="form-control" name="limitPerson" placeholder="请输入可入住人数" />
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">床型</label>
                            <div class="col-lg-5">
                            	<s:set value="#{1:'大床',2:'双人床',3:'单床',4:'多人床'}" var="bedStyleMap"></s:set>
                               	<s:select cssClass="form-control" list="#bedStyleMap" listKey="key" listValue="value" name="bedStyle" ></s:select>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">间数(个)</label>
                            <div class="col-lg-5">
                            	  <s:textfield cssClass="form-control" name="number" placeholder="请输入房间数量" />
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">早餐</label>
                            <div class="col-lg-5">
                            	<s:set value="#{1:'双份',2:'多份',3:'不含',4:'单份'}" var="breakfastMap"></s:set>
                               	<s:select cssClass="form-control" list="#breakfastMap" listKey="key" listValue="value" name="breakfast" ></s:select>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">宽带</label>
                            <div class="col-lg-5">
                            	<s:set value="#{1:'无线免费',2:'有线免费'}" var="broadbandMap"></s:set>
                               	<s:select cssClass="form-control" list="#broadbandMap" listKey="key" listValue="value" name="broadband" ></s:select>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">取消政策</label>
                            <div class="col-lg-5">
                            	<s:set value="#{1:'可取消',2:'不可取消'}" var="cancelMap"></s:set>
                               	<s:select cssClass="form-control" list="#cancelMap" listKey="key" listValue="value" name="cancel" ></s:select>
                            </div>
                        </div> 
                       
                       <div class="form-group">
                           <label class="col-lg-3 control-label">价钱(1晚￥)</label>
                            <div class="col-lg-5">
                                <s:textfield   cssClass="form-control" name="price" placeholder="请输入价钱" />
                            </div>
                          	
 						</div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">房型设施</label>
                            <div class="col-lg-9">
                               	<s:textarea id="roomstyle_content" name="introduce">
                               		
                               	</s:textarea>
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


<script type="text/javascript">
$(document).ready(function() {
 

    $('#roomstyleForm').bootstrapValidator({
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
            bedStyle: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            price: {
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
            limitPerson: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    },
                    integer:{
                    	
                    }
                }
            },
            breakfast: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    }
                }
            },
            broadband: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            cancel: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    }
                }
            },
            area: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    },
                    numeric:{}
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

   

	//new uploadSimpleImage('roomstyle_logo_img','roomstyle_logo_input','roomstyle_logo_picker');
	
           var oldData = new uploadManyImages('wrapper',$('#filelist2'),5);//后台可编辑回显示
        	oldData.initEcho('filelist2','${picture}');//把图片回显
			var ue=UE.getEditor('roomstyle_content');
        /* 	var html="便利设施：雨伞、多种规格电源插座、110V电压插座、中央空调、书桌、熨衣设备、房内保险箱<br/>媒体/科技：国内长途电话、国际长途电话<br/>和饮品：电热水壶、咖啡壶/茶壶、免费瓶装水、小冰箱、迷你吧<br/>浴室：24小时热水、拖鞋、浴室化妆放大镜、浴衣、吹风机、免费洗漱用品(6样以上)<br/>";
        	ue.setContent(html); */
        	
      	$("#checkSubmit").on("click",function(){
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
        $('#roomstyleForm').data('bootstrapValidator').resetForm(true);
    });
    
	
	
});

</script>
</body>

</html>

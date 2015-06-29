<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>线路管理</title>
</head>
<body>
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>线路信息</h2>
                    </div>

                    <form id="routeplanForm" class="form-horizontal" method="post" action="<%=contextPath %>/routeplan_doSaveOrUpdate.do">
                    	<s:hidden name="id" />
                    	<s:hidden name="rouId" />
                        <div class="form-group">
                            <label class="col-lg-3 control-label">标题</label>
                            <div class="col-lg-5">
                                <s:textfield id="sceId" name="sceId" ></s:textfield>
                            </div>
                          
                        </div>
						
						 <div class="form-group">
                            <label class="col-lg-3 control-label">顺序</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="step" placeholder="输入途径地点顺序" />
                            </div>
                          
                        </div>
						 <div class="form-group">
                            <label class="col-lg-3 control-label">停留天数</label>
                            <div class="col-lg-5">
                                <s:textfield cssClass="form-control" name="day" placeholder="输入停留天数" />
                            </div>
                          
                        </div>
                     
						 <div class="form-group">
                            <label class="col-lg-3 control-label">简介</label>
                            <div class="col-lg-5">
                                <s:textarea cssClass="form-control" name="description" rows="3" />
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



$(function() {
	
	  
    $('#sceId').combogrid({ 
    	panelWidth:450,
        idField:'id', //ID字段  
        textField:'realName', //显示的字段  
        url:"<%=contextPath%>/scenery_doList.do",  
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
			title : '轮播',
			field : 'viwepager',
			width : 100,
			sortable : true
			},{
			title : '推荐',
			field : 'suggest',
			width : 100,
			sortable : true
			}]]
    });  
 
    //$('#sceId').combogrid();
    $('#routeplanForm')
    .bootstrapValidator({
//        live: 'disabled',\
       /*  message: default, */
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	step: {
                
                validators: {
                    notEmpty: {
                       /*  message: 'The first name is required and cannot be empty' */
                    },
                    integer:{}
                }
            },
            day: {
                
                validators: {
                    notEmpty: {
                       /*  message: 'default' */
                    },
                    integer:{}
                }
            },
            sceId: {
            	
                validators: {
                    notEmpty: {
                  /*       message: 'default' */
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
        			parent.mainDlg.close("#routeplan_grid");
        			jSuccess(data.msg);
        		}else{
        			jError(data.msg);
        		}
            }, 'json');
     });

    $('#resetBtn').click(function() {
        $('#routeplanForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>
</body>
</html>
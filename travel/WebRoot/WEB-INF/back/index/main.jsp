<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<%@ include file="/WEB-INF/pub/bootstrap.jspf"%>  
<%@ include file="/WEB-INF/pub/ueditor.jspf"%>  
<%@ include file="/WEB-INF/pub/webuploader.jspf"%>  
<%@ include file="/WEB-INF/pub/markMap.jspf"%>  
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link href="<%=contextPath%>/back/style/css/default.css" rel="stylesheet" type="text/css" />   
    <link href="<%=contextPath%>/jslib/bootstrap-3.3.4-dist/css/ace.min.css" rel="stylesheet" type="text/css" />   
	<script type="text/javascript" src="<%=contextPath%>/back/style/js/Layout.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/back/style/js/editPwd.js"></script>
	
	<style type="text/css">
		.panel-body {
    			padding: 0px ! important;
		}
		.panel {
		  
		    margin-bottom: 0px ! important;
		}
		.dis{
			display: none;
		}
		li [class^="icon-"], li [class*=" icon-"], .nav-list li [class^="icon-"], .nav-list li [class*=" icon-"] {
    width: 20px;
	}
	</style>
</head>



<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(<%=contextPath%>/back/style/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎${sessionScope.loginUser.realName}使用<a href="#" id="user_editpwd_show">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="<%=contextPath%>/back/style/images/blocks.gif" width="20" height="20" align="absmiddle" />旅游后台管理</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">页脚</div>
    </div>
    <div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
<div id="nav" class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden; color:red; " >
				<h1 style="font-size:24px;">你好</h1>
<h1 style="font-size:24px;">你好<a style="font-size:24px;color:green;" href="http://hxling.cnblogs.com">你好</a></h1>
<h1 style="font-size:24px;">你好</h1>
				<h1 style="font-size:24px;">你好</h1>
			</div>
		</div>
    </div>
    
    
    <div id="userEditPwdDlg" class="easyui-dialog dis" 
     closed="true" buttons="#userEditPwdDlg-buttons" modal="true" style="width:400px;height:220px;padding:10px 20px">
    <div class="ftitle">用户个人密码修改</div>
    <form id="userEditPwdFm" method="post">
        <table>
            <tr>
                <td>原来密码:</td>
                <td> <input  id="oldpassword" class="easyui-validatebox"  type="password"  data-options="iconCls:'icon-lock',required:true,missingMessage:'请输入原密码'"  >
                <td>
                    <div id="unique"  style="float:left;display: none"></div>
                </td>
                
  
            </tr>
            <tr>
                <td>新密码:</td>
                <td><input id="newpassword" name="newPwd" class="easyui-textbox easyui-validatebox"   type="password"  data-options="iconCls:'icon-lock',required:true,missingMessage:'请输入新密码',validType:'safepass'" ></td>
            </tr>

			
			<tr>
                <td>确认密码:</td>
                <td>
				<input id="confirm_password" name="confirmPwd"  class="easyui-textbox easyui-validatebox"   type="password"  data-options="iconCls:'icon-lock',required:true,missingMessage:'请确认密码',validType:'equals[\'#newpassword\']'" > <!--   -->
				</td>
            </tr>
        </table>

    </form>
</div>
<div id="userEditPwdDlg-buttons" class="dis">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="user_editPwd_save" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="user_editPwd_close" style="width:90px">取消</a>
</div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>



<div id="parentDlg"></div>
<script type="text/javascript">

	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"基本管理",
							"menus":[
									{"menuid":"12","menuname":"用户列表","icon":"icon-add","url":"<%=contextPath%>/user_toIndex.do"},
									{"menuid":"13","menuname":"留言列表","icon":"icon-users","url":"<%=contextPath%>/message_toIndex.do"},
									{"menuid":"14","menuname":"友情连接列表","icon":"icon-nav","url":"<%=contextPath%>/friendlink_toIndex.do"}

								]
						},{"menuid":"6","icon":"icon-sys","menuname":"风景管理",
							"menus":[{"menuid":"61","menuname":"景区列表","icon":"icon-nav","url":"<%=contextPath%>/scenery_toIndex.do?type=1"},
										{"menuid":"62","menuname":"景点列表","icon":"icon-nav","url":"<%=contextPath%>/scenery_toIndex.do?type=2"},
										{"menuid":"63","menuname":"风景图片","icon":"icon-nav","url":"<%=contextPath%>/images_toIndex.do"}
									]
						},{"menuid":"2","icon":"icon-sys","menuname":"旅游线路",
							"menus":[
									{"menuid":"21","menuname":"线路列表","icon":"icon-nav","url":"<%=contextPath%>/route_toIndex.do?routeType=0"},
									{"menuid":"22","menuname":"线路报名","icon":"icon-nav","url":"<%=contextPath%>/routebook_toIndex.do?routeType=0"}
	<%-- 								{"menuid":"22","menuname":"自由行","icon":"icon-nav","url":"<%=contextPath%>/route_toIndex.do?routeType=1"},
									{"menuid":"22","menuname":"线路收藏","icon":"icon-nav","url":"<%=contextPath%>/collect_toIndex.do?routeType=1"},
									{"menuid":"23","menuname":"旅游新闻","icon":"icon-nav","url":"<%=contextPath%>/news_toIndex.do"},
									{"menuid":"24","menuname":"旅游游记","icon":"icon-nav","url":"<%=contextPath%>/travels_toIndex.do"} --%>
								]
						},{"menuid":"3","icon":"icon-sys","menuname":"线路规划",
							"menus":[
										{"menuid":"31","menuname":"规划列表","icon":"icon-nav","url":"<%=contextPath%>/route_toIndex.do?routeType=1"},
										{"menuid":"32","menuname":"收藏列表","icon":"icon-nav","url":"<%=contextPath%>/collect_toIndex.do?routeType=1"}
									]
						},{"menuid":"5","icon":"icon-sys","menuname":"酒店管理",
							"menus":[
										{"menuid":"51","menuname":"酒店列表","icon":"icon-nav","url":"<%=contextPath%>/hotel_toIndex.do"},
										{"menuid":"52","menuname":"酒店预定","icon":"icon-nav","url":"<%=contextPath%>/roombook_toIndex.do"}<%-- ,
										{"menuid":"53","menuname":"房型列表","icon":"icon-nav","url":"<%=contextPath%>/roomstyle_toIndex.do"} --%>
									]
						},{"menuid":"4","icon":"icon-sys","menuname":"资讯管理",
							"menus":[
										{"menuid":"41","menuname":"旅游新闻","icon":"icon-nav","url":"<%=contextPath%>/news_toIndex.do"},
										{"menuid":"42","menuname":"旅游游记","icon":"icon-nav","url":"<%=contextPath%>/travels_toIndex.do"}
									]
						}<%-- ,{"menuid":"39","icon":"icon-sys","menuname":"其他 ",
							"menus":[
							         {"menuid":"51","menuname":"友情连接列表","icon":"icon-nav","url":"<%=contextPath%>/friendlink_toIndex.do"},
							         {"menuid":"51","menuname":"单张图片演示","icon":"icon-nav","url":"<%=contextPath%>/demo/uploadImage.jsp"},
							         {"menuid":"51","menuname":"单张图片演示2","icon":"icon-nav","url":"<%=contextPath%>/demo/simpleImage.jsp"},
							         {"menuid":"51","menuname":"多张图片演示","icon":"icon-nav","url":"<%=contextPath%>/demo/uploadImages.jsp"},
							         {"menuid":"51","menuname":"多张图片带参数","icon":"icon-nav","url":"<%=contextPath%>/demo/uploadImagesToObj.jsp"},
							         {"menuid":"51","menuname":"bootstrap 验证","icon":"icon-nav","url":"<%=contextPath%>/demo/bootstrap.jsp"},
							         {"menuid":"51","menuname":"bootstrap 验证2","icon":"icon-nav","url":"<%=contextPath%>/demo/bootstrap2.jsp"},
							         {"menuid":"51","menuname":"ueditor演示","icon":"icon-nav","url":"<%=contextPath%>/demo/ueditor.jsp"}
								]
						} --%>
				]};

        $(function() {

         
            

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
					
                    if (r) {
                    	
                    	$.post(sy.contextPath+"/login_doLogout.do",null,function(data){
                    		  if(data&&data.success){
			                     location.replace(sy.contextPath+"/index.jsp");                			  
                    		  }else{
				                 $.messager.alert('抱歉',data.msg,'warning');
				              }
                    	},'json');
                    }
                });
                
            })
            
            
        });
		
        //创建一个 dlg 子 iframe 来访问
        var mainDlg=new pdlg();
    </script>
</body>
</html>

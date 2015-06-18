<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>福建旅游管理系统</title>
<!--当前页面js-->
<script type="text/javascript" src="<%=contextPath %>/back/style/js/login.js"></script>

</head>
<body>
<div id="loginDlg" left="500px" top="150px" class="easyui-dialog dis" title="福建旅游管理系统" style="width:400px;height:200px;padding:10px 20px;"
     closed="true" buttons="#dlg-buttons" modal="true">
    <div class="ftitle">用户登陆</div>
    <form id="loginFm" method="post" novalidate>
        <div class="fitem">
            <label>登陆手机号:</label><!--  data-options="required:true,validType:'email'" -->
            <input name="mobile" class="easyui-textbox easyui-validatebox"  data-options="iconCls:'icon-man',required:true,missingMessage:'请输入密码',validType:'mobile'" value="15659029206">
        </div>
        <div class="fitem">
            <label>登陆密码:</label>
            <input name="pwd" type="password" class="easyui-textbox easyui-validatebox "  data-options="iconCls:'icon-lock',required:true,missingMessage:'请输入密码'" value="shaonian"><!-- ,validType:'safepass' -->
        </div>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="loginBtn" style="width:90px">登陆</a>
</div>




</body>
</html>



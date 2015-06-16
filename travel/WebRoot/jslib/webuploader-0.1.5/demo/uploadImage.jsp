<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>WebUploader演示</title>
</head>
<body>


    	<img id="logo" style="width: 200px; height: 100px;float:left;" />
	    <input type="hidden" id="sceniclogo" name="scenic.logo" class="input"/>
		<div style="float:left;margin:56px 0 0 20px;" id="logoPicker">选择图片</div> 
		
		
 
    <script type="text/javascript">

        $(function(){

        	new uploadImage('logo','sceniclogo','logoPicker');
        	
            var up=new uploadImages("uploader","logoId",5);
            
            $("#getImageSrc").on("click",function(){
            	var str=up.getImageList().join("#");
            	console.info(str);
            });
        })
    </script>
</body>
</html>
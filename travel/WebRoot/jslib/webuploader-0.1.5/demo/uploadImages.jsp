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


    <div id="wrapper">
        <div id="container">
            <!--头部，相册选择和格式选择-->

            <div id="router" class="uploader">
                <div class="queueList">
                    <div id="router_dndArea" class="placeholder">
                        <div id="router_startPicker"></div>
                        <p>或将照片拖到这里，单次最多可选300张</p>
                    </div>
                </div>
                <div class="statusBar" style="display:none;">
                    <div class="progress">
                        <span class="text">0%</span>
                        <span class="percentage"></span>
                    </div><div class="info"></div>
                    <div class="btns">
                        <div id="router_nextPicker" class="nextPicker"></div><div class="uploadBtn">开始上传</div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    

    
    <input type="button" id="getImageSrc" value="点击获得url"/> 
    

    <script type="text/javascript">

        $(function(){

            var up=new uploadImages("router","logoId",5);
            
            $("#getImageSrc").on("click",function(){
            	var str=up.getImageList().join("#");
            	console.info(str);
            });
        })
    </script>
</body>
</html>
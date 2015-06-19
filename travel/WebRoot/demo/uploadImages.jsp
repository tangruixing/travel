<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<%@ include file="/WEB-INF/pub/webuploader.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>WebUploader演示</title>
</head>
<body>


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
					   
					
				  <input type="hidden" id="scenicimages" name="scenic.images" class="input"  maxlength="25000"/>
    

    
    <input type="button" id="getImageUrl" value="点击得到url">

    <script type="text/javascript">

        $(function(){

        	var oldData = new uploadManyImages('wrapper',$('#filelist2'),5);//后台可编辑回显示
        	oldData.initEcho('filelist2','${scenic.images}');//把图片回显
        	//$('#wrapper2').hide();
        	
        	$("#getImageUrl").off('click');
        	$("#getImageUrl").on('click',function(){
        		
        		var imgSrc = oldData.getInsertString();
	            var allSrc = oldData.getEchoInsertString();
	            console.info(imgSrc);
	            console.info(allSrc);
	            if(imgSrc != "" && allSrc != "")
	        		allSrc = imgSrc + "#" + allSrc;
	        	else
	        		allSrc = imgSrc + allSrc;
	            $('#scenicimages').val(allSrc);
	            console.info(allSrc);
	            
	            jNotify(allSrc);
        		
        	});
        });
      
    </script>
</body>
</html>

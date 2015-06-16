<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">

 <tr >
					<td align="right"><label for="readme">景区logo图</label></td>										
				  <td align="left">
				 		 <img id="logo" <c:if test="${logo!=null }">src="${logo }"</c:if> style="width: 200px; height: 100px;float:left;" />
					    <input type="hidden" id="sceniclogo" name="logo"/>
						<div style="float:left;margin:56px 0 0 20px;" id="logoPicker">选择图片</div> 
				</tr>
				
                 <tr >
					<td align="right"><label for="readme">景区展示图</label></td>										
				  <td align="left">
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
					   
					   <div id="wrapper2" >
							<div id="container">
								<div id="uploader">
									<div class="queueList">
										<div id="dndArea" class="placeholder">
											<div id="filePicker"></div>											
										</div>
									</div>
									<div class="statusBar" style="display: none;">
										<div class="progress">
											<span class="text">0%</span> <span class="percentage"></span>
										</div>
										<div class="info"></div>
										<div class="btns">
											<div id="filePicker2"></div>
											<div class="uploadBtn">开始上传</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
				  <input type="hidden" id="scenicimages" name="images" class="input"  maxlength="25000"/>
				  </td>
				</tr>	
</table>
</body>

<script type="text/javascript">
	$(function(){
		var newData;
		var oldData;
		
		new uploadSimpleImage('logo','sceniclogo','logoPicker');

		oldData = new uploadManyImages('wrapper',$('#filelist2'),5);//后台可编辑回显示
		oldData.initEcho('filelist2','${images}');
		$('#wrapper2').hide();

	});
</script>
</html>
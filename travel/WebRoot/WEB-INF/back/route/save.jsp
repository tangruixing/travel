<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head lang="en">
    <title>Route管理</title>
 <!--    <style type="text/css">
    	#edui149{
    		z-index:10000
    	}
    </style> -->
</head>
<body>
<s:form id="route_fm" method="post" action="<%=contextPath%>/route_doSaveOrUpdate.do">
	<s:hidden name="id" />
	<s:hidden name="useid" /><!-- 哪个管理员发布 -->

      <table  width="100%">
		<tr>	
			<td>
				<span class="required">*</span>地点
			</td>	
			<td>
			<input name="realName" class="easyui-validatebox textbox" required="true"  missingMessage="地点不能为空">
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>logo
			</td>	
			<td>
			
				<img id="router_logo_img" style="width: 200px; height: 100px;float:left;" />
				<div style="float:left;margin:56px 0 0 20px;" id="router_logo_picker">选择图片</div> 
				<input type="hidden" id="router_logo_input" name="logo"/>
			</td>
		</tr>
		<tr>	
			<td>
				<span class="required">*</span>logo
			</td>	
			<td>
			
					<img id="logo" style="width: 200px; height: 100px;float:left;" />
	    <input type="hidden" id="sceniclogo" name="scenic.logo" class="input"/>
		<div style="float:left;margin:56px 0 0 20px;" id="logoPicker">选择图片</div> 
			</td>
		</tr>
		
		<tr>
		<td>风景图</td>
		<td>
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
    </td>
	</tr>
		
		
		<tr>	
			<td>
				<span class="required">*</span>出发时间
			</td>	
			<td>
			<input name="startDate" class="easyui-validatebox" 
			 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d+1}'})"
			 data-options="iconCls:'icon-lock',required:true,missingMessage:'出发时间不能为空'"
			>
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>结束时间
			</td>	
			<td>
			<input name="endDate" class="easyui-validatebox" 
			 onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d+1}'})"
			 data-options="iconCls:'icon-lock',required:true,missingMessage:'结束时间不能为空',validType:'gtDate[\'#startDate\']'"
			>
			
			</td>
		</tr>
	
		
		<!-- 
		<tr>	
			<td>
				<span class="required">*</span>类型
			</td>	
			<td>
				<input name="routeType" class="easyui-validatebox textbox" required="true"  missingMessage="类型不能为空">
			</td>
		</tr> -->
	
		<tr>	
				<td>
					报名人数
				</td>	
				<td>
					<input name="numPeople"
						class="easyui-validatebox textbox" 
			data-options="iconCls:'icon-lock',required:true,missingMessage:'结束时间不能为空',validType:'integ'"
			>
				</td>
		</tr>
		
		<tr>	
			<td>
				<span class="required">*</span>价钱
			</td>	
			<td>
			<input name="money" class="easyui-validatebox textbox" 
			data-options="iconCls:'icon-lock',required:true,missingMessage:'结束时间不能为空',validType:'currency'"
			>
			</td>
		</tr>
	
		
		
		<tr>	
			<td>
				<span class="required">*</span>描述
			</td>	
			<td>
			<textarea id="router_content" name="description"></textarea>
			</td>
		</tr>
	
		
		
	
		
			<!-- <tr>	
				<td>
					推荐
				</td>	
				<td>
					<input name="suggest" >
				</td>
			</tr>
	
		
			<tr>	
				<td>
					行程建议
				</td>	
				<td>
					<input name="content" >
				</td>
		</tr> -->
	
		
        </table>

</s:form>
</html>

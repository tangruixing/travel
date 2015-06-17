1，配置 ueditor 的 url
 window.UEDITOR_HOME_URL = sy.contextPath+"/jslib/ueditor1_4_3-utf8-jsp/";
2，引入相关 文件
 <%-- 引入 ueditor 编辑器 --%>
<script type="text/javascript" src="<%=contextPath%>/jslib/ueditor1_4_3-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="<%=contextPath%>/jslib/ueditor1_4_3-utf8-jsp/ueditor.all.min.js"> </script>
<script type="text/javascript" src="<%=contextPath%>/jslib/ueditor1_4_3-utf8-jsp/lang/zh-cn/zh-cn.js""></script>
3,引入 jar 包
注意：如果项目中原来有相同的 jar 包，移除掉。用 ueditor 中的 jar 包。避免找不到类错误信息
4,配置信息：config.json(让上传的图片和文件可以正常显示)
 "*Prefix": "/travel", /* 图片访问路径前缀 */
 "*Format":"/ueditor/jsp/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
 /*Prefix/ueditor/jsp....(在 j2ee 中以 ‘/’ 开头的路径指的是：网站根目录)
 注意：
config.json
controller.jsp
放在同一目录下

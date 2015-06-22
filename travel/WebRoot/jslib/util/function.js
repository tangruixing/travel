var sy = sy || {};

/**
 * 判断是否以xx开头
 *
 * @param source
 * @param xx
 */
sy.startWith = function(source, xx) {
	var reg = new RegExp("^" + xx);
	return reg.test(source);
};
/**
 *  判断字符是否非空
 * @param id
 * @returns {Boolean}
 */
sy.isNull = function(id) {
	var source = $("#" + id).val();
	return source == "" || typeof source != "string";
};
/**
 * 判断结束字符是否是XX
 *
 * @author 孙宇
 */
sy.endWith = function(source, str) {
	var reg = new RegExp(str + "$");
	return reg.test(source);
};

/**
 * 增加formatString功能
 *
 * @author 孙宇
 *
 * @example sy.formatString('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 *
 * @returns 格式化后的字符串
 */
sy.formatString = function(str) {
	for (var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};
/**
 * dataGrid 控制显示
 */
sy.dataGrid = function(id, title, toolBar, url, sortName) {
	$('#' + id).datagrid({
		title : title,
		iconCls : 'icon-ok',
		pageSize : 10, // 默认选择的分页是每页10行数据
		pageList : [5, 10, 15, 20], // 可以选择的分页集合
		nowrap : true, // 设置为true，当数据长度超出列宽时将会自动截取
		striped : true, // 设置为true将交替显示行背景。
		collapsible : true, // 显示可折叠按钮
		toolbar : "#" + toolBar, // 在添加 增添、删除、修改操作的按钮要用到这个
		url : url, // url调用Action方法
		loadMsg : '数据装载中......',
		// singleSelect:true,//为true时只能选择单行 为了实现批量删除必须隐去
		fitColumns : true, // 允许表格自动缩放，以适应父容器
		sortName : sortName, // 当数据表格初始化时以哪一列来排序
		sortOrder : 'asc', // 定义排序顺序，可以是'asc'或者'desc'（正序或者倒序）。
		remoteSort : false,
		frozenColumns : [[{
			field : 'ck',
			checkbox : true
		}]],
		pagination : true, // 分页
		rownumbers : true
		// 行数

	});
};
/**
 * 表格时间显示格式化
 */
function timeformater(value, row, index) {
	if (value == null)
		return null;
	var unixTimestamp = new Date(value);
	return unixTimestamp.toLocaleString();
}

/**
 * iframe自适应高度
 *
 * @param iframe
 */
sy.autoIframeHeight = function(iframe) {
	iframe.style.height = iframe.contentWindow.document.body.scrollHeight + "px";
};

/**
 * 设置iframe高度
 *
 * @param iframe
 */
sy.setIframeHeight = function(iframe, height) {
	iframe.height = height;
};

/**
 * @function: 系统时间戳格式匹配
 * @author tongqian
 * @date 2015-1-17 上午14:06:28
 * @return String
 * eg:format="YYYY-MM-dd hh:mm:ss";
 *  使用方法： date.fomat("YYYY-MM-dd hh:mm:ss");
 */
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
		// millisecond

	};
	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	for (var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

/**
 * d1,d2日期格式yyyy-MM-dd
 * d1<d2 返回false
 */
function dateComp(d1,d2)  
{  
	var flag = true;
	 var d3 = new Date(d1.replace(/-/g, "/")); 
	 var d4 = new Date(d2.replace(/-/g, "/")); 	 
	  if(d3 <=d4)  { 
	  flag = false; 
	 } 
	  return flag;
} 
sy.str2json=function(s){
     if (window.JSON) {
         return JSON.parse(s);
     } else {
         return (new Function("return " + utils.trim(s || '')))();
     }
}
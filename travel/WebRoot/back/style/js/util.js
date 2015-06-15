/**
 * Created by always_w_u on 2014/12/4.
 */
var gx = {
	bp : function() {
		var curWwwPath = window.document.location.href;
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		var localhostPaht = curWwwPath.substring(0, pos);
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/')
						+ 1);
		return (localhostPaht + projectName);

	},
	messager : {
		wait : function() {
			$.messager.progress({
						text : '页面加载中....',
						interval : 100
					});
		},
		waitTime : function(num) {
			$.messager.progress({
						text : '页面加载中....',
						interval : 100
					});
			window.setTimeout(function() {
						try {
							$.messager.progress('close');
						} catch (e) {
						}
					}, 1000 * num);
		},
		close : function() {
			$.messager.progress('close');
		}
	},
	string : {
		isEmpty : function(str) {
			/*
			 * if(str&&str.trim().length<=0) { return false; }else{ return
			 * true; }
			 */
			return str == 'undefined' || str == undefined || str == null
					|| str.trim().length <= 0;
		}
	},
	cleanFm:function(jquery){
			jquery.find("input").val("");
			jquery.find("select").val("");
	
	},
	cleanAll:function(jquery){
		$(':input',jquery)  
		 .not(':button, :submit, :reset, :hidden,:radio')  
		 .val('');  
		$(':radio',jquery).removeAttr('checked')  
		$(':checkbox',jquery).removeAttr('selected');  
	},
	
	serializeObject : function(obj) {
		var o = {};
		$.each(obj, function(index) {
					if (o[this['name']]) {
						o[this['name']] = o[this['name']] + "," + this['value'];
					} else {
						o[this['name']] = this['value'];
					}
				});
		console.info(o);
		return o;
	}
};

/*$.extend($.fn.validatebox.defaults.rules, {
			minLength : {
				validator : function(value, param) {
					return value.trim().length >= param[0];
				},
				message : '请至少输入{0}个字符'// false
			}
		});
*/
/*
 * $.extend($.fn.validatebox.defaults.rules,{
 * 
 * 
 * 
 * 
 * checkUnique:{ validator: function (value,param) { console.info(value); var
 * url=param[0]; var p={ username:value.trim() } $.post(url,p, function (data) {
 * 
 * console.info(data.success); if(data&&data.success){ return false; }else{
 * return true;//success=false }
 */
/*
 * if(data&&data.success)
 * {//D:\project\idea\jsp\test09\src\main\webapp\js\lib\jquery-easyui-1.4.1\themes\icons\ok.png
 * return true; }else{ html+=sy.fs("<img src='{0}' alt='{1}'><p>{2}<p>",sy.bp()+"/js/lib/jquery-easyui-1.4.1/themes/icons/no.png",data.msg,data.msg); }
 *//*
	 * 
	 * 
	 * //$("#unique").append(html).show();
	 * 
	 * },'json'); }, message:'用户名重复了' } });
	 */

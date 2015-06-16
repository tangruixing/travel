//验证只能输入正整数 >=0
function checkDigital(obj,defaultValue)
{
    var num_value=$(obj).val();
    var re =/^[0-9]*[1-9][0-9]*$/;
	if (!re.test(obj.value))
	  {
	        obj.value=defaultValue||"";
	        obj.focus();
	        jNotify("该文本框只能输入整数,请正确输入!"); 
	        return false;
	  }

}

//邮箱验证
function checkEmail(obj)
{
    var num_value=$(obj).val();
	    var re =/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
		if (!re.test(obj.value))
		  {
		        obj.value="";
		        jNotify("请正确输入邮箱!"); 
		        return false;
		  }
    }
//qq验证
function checkQQ(obj)
{
    var num_value=$(obj).val();
    var re =/^(0|([1-9]\d*))$/;
	if (!re.test(obj.value))
	  {
	     if(isNaN(obj.value)){
	        obj.value="";
	        obj.focus();
	        jNotify("QQ格式不正确!"); 
	        return false;
	     }
	  }
}
//验证只能输入整数 -1，0，1
 function checkNum(obj)
 {
    var re = /^-?[1-9]*(\.\d*)?$|^-?d^(\.\d*)?$/;
	if (!re.test(obj.value))
	  {
	    if(isNaN(obj.value)){
		   obj.value="0";
	       obj.focus();
	       jNotify("该文本框只能输入整数,请正确输入!"); 
	       return false;
	    }
	 }
 } 

//验证RMB类型
function checkRMB(obj){
    var obj_value=$(obj).val();
	//验证是否为数字正则表达式
	var reg = /^(\d){1,8}(\.)?(\d(\d)?)?$/;
	if(!reg.test(obj_value)){		
		jNotify("请正确输入货币类型!");		
		$(obj).val("");
		return false;
	}else{
		return true;
	}
}

//验证浮点类型
function checkFloat(obj){
    var obj_value=$(obj).val();
	var reg = /^(\d){1,8}(\.)?(\d(\d)?)?$/;
	if(!reg.test(obj_value)){		
		jNotify("请正确输入浮点类型,最多保留两位小数!");		
		$(obj).val("");
		return false;
	}else{
		return true;
	}
}
//验证网址类型
function checkURL(obj){
    var obj_value=$(obj).val();
	 var reg = "^((https|http|ftp|rtsp|mms)?://)"
        + "+(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
        + "|" // 允许IP和DOMAIN（域名）
        + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
        + "[a-z]{2,6})" // first level domain- .com or .museum
        + "(:[0-9]{1,4})?" // 端口- :80
        + "((/?)|" // a slash isn't required if there is no file name
        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
	 var re=new RegExp(reg);
	if(!re.test(obj_value)){		
		jNotify("请正确输入网址!");		
		$(obj).val("");
		return false;
	}else{
		return true;
	}
}
//验证手机号类型
function checkPhone(obj){
    var obj_value=$(obj).val();
	//验证是否为数字正则表达式
	var reg =  /^0?1[3|4|5|8][0-9]\d{8}$/;
	if(!reg.test(obj_value)){		
		jNotify("请正确输入手机!");		
		$(obj).val("");
		return false;
	}else{
		return true;
	}
}
//验证固定电话类型
function checkTelephone(obj){
    var obj_value=$(obj).val();
	//验证是否为数字正则表达式
	var reg =  /^0\d{2,3}-?\d{7,8}$/;
	if(!reg.test(obj_value)){		
		jNotify("请正确输入电话号码!");		
		$(obj).val("");
		return false;
	}else{
		return true;
	}
}
//同时验证是手机号和固话
function checkAllPhone(obj){
    var obj_value=$(obj).val();
	//验证是否为数字正则表达式
	var reg1 =  /^0\d{2,3}-?\d{7,8}$/;
	var reg2 = /^0?1[3|4|5|8][0-9]\d{8}$/;
	if(!reg1.test(obj_value)&&!reg2.test(obj_value)){		
		jNotify("请正确输入固话或手机号!");		
		$(obj).val("");
		return false;
	}else{
		return true;
	}
}
//控制textarea框的长度
function checkLength(obj,num){
    var obj_value=$(obj).val();
    if(obj_value.length>num){    
       var get_value=obj_value.substring(0,num);
       $(obj).val(get_value);
       jNotify("该输入框字符数不能超过"+num+"字!"); 
    }
}

 
 //去掉字符串中，最后一个字符
 function deleteLastChar(str,ch){
 	if(str.indexOf(ch)>-1){
 		var lastPos = str.lastIndexOf(ch);
 		str=str.substring(0,lastPos);
 	}
 	return str;
 }
 
//列表批量删除操作
function delInfo(field_name,actionName){
	//值拼串
	var filedVal = '';	
	var checks = document.getElementsByName(field_name);
	for(var i=0;i<checks.length;i++){
		if(checks[i].checked){
			if(checks[i].value!=""){
				filedVal += checks[i].value+',';
			}
		}
	}	
	if(filedVal.indexOf(',') > -1){
		filedVal = filedVal.substring(0,filedVal.length-1);
	}	
    
	if(filedVal==''){
		art.dialog({
			title: '友情提示',
		    content: '请至少选择一条记录!',
	    	lock: true
		});
		return false;
	}else{
		art.dialog({
			title: '友情提示',
			content:'<div class="decorate">'+'确定要删除?'+'</div>',
			okValue: '确定',
			width: '238px',
			cancelValue: '取消',
		    ok: function () {
		        document.getElementById('commonForm').action=actionName;
		    	document.getElementById('commonText').name = field_name;
		    	document.getElementById('commonText').value = filedVal;
		    	document.getElementById('commonForm').submit();	  
		    },
		    cancel: function () {
				return true;
		    }
		});
	}
}

//删除单个操作
function delOneInfo(field_name,actionName,infoid){
	art.dialog({
			title: '友情提示',
			content:'<div class="decorate">'+'确定要删除?'+'</div>',
			okValue: '确定',
			width: '238px',
			cancelValue: '取消',
			lock: true,
		    ok: function () {
		        document.getElementById('commonForm').action=actionName;
				document.getElementById('commonText').name = field_name;
				document.getElementById('commonText').value = infoid;
				document.getElementById('commonForm').submit();	
		    },
		    cancel: function () {
				return true;
		    }
		});
}


//进入修改页面
function linkToInfo(actionName,paraStr){
	$("#hidden_div").html("");//清空
	var ppstr = paraStr.split("&");
	if(ppstr.length > 0){
		for(var i=0;i<ppstr.length;i++){
			var para = ppstr[i];
			if(para.indexOf("=") > -1){
				var paraSon = para.split("=");
				if(paraSon.length > 1){
					var key = paraSon[0];
					var value = paraSon[1];
					var hidden_name ="<input type='hidden' name='"+key+"' value='"+value+"' />";
					$("#hidden_div").append(hidden_name);
				}
			}
		}
	}
	document.getElementById("commonForm").action=actionName;
	document.getElementById("commonForm").submit();
}



//列表批量选择操作
function selectAll(field_name){
	var checkall = document.getElementById('checkall');
	var checks = document.getElementsByName(field_name);
	for(var i=0;i<checks.length;i++){
		if(checkall.checked){
			checks[i].checked = true;
		}else{
			checks[i].checked = false;
		}
	}
}

//重载列表批量选择操作，两个参数
function selectAll(field_name,obj){
	var is_checked = $(obj).attr("checked");
	var checks = document.getElementsByName(field_name);
	for(var i=0;i<checks.length;i++){
		if(is_checked){
			checks[i].checked = true;
		}else{
			checks[i].checked = false;
		}
	}
	$(".checkall").each(function(){
		$(this).attr("checked",is_checked);
	});
}

//批量操作状态开始
function updateBatchState(state,field_name,actionName,tip){
        var flag = false;
        var tf_id="";
		$("input:checkbox[name='"+field_name+"']").each(function(i){
			if(this.checked==true){
				flag=true;
				tf_id+=$(this).val()+",";
			}	      
      	});
		if(flag==false){
			art.dialog({
			  title: '友情提示',
		      content: '请至少选择一条记录!',
		      lock: true
		  });
		  return false;
		}
		//id串
      	tf_id=deleteLastChar(tf_id,",");
		if(flag==true){
	   		art.dialog({
				title: '系统信息提示',
				content:'<div class="decorate">确定'+tip+'?</div>',
				okValue: '确定',
				width: '238px',
				cancelValue: '取消',
				lock: true,
			    ok: function () {
				    document.getElementById('commonId').name = "cb_ids";
			    	document.getElementById('commonId').value = tf_id;
			    	document.getElementById('commonText').name = "state_vals";
			    	document.getElementById('commonText').value = state;
			    	document.getElementById('commonForm').action=actionName;
			    	document.getElementById('commonForm').submit();	  
			        return false;
			    },
		   		cancel: function () {
					return true;
			    }
		    });
		}
}
//批量操作状态结束

//批量推荐与不推荐开始
function updateBatchRecom(state,field_name,actionName,recom_id,tipMsg){
      var chb_count=0;
      var chb_id="";
      $("input:checkbox[name='"+field_name+"']").each(function(i){
			if(this.checked==true){
				chb_id+=$(this).val()+",";
				chb_count++;
			}	      
      });
      chb_id=deleteLastChar(chb_id,",");
	  if(chb_count==0){
			art.dialog({
				title: '友情提示',
			    content: '请至少选择一条记录!',
			    lock: true
			});
			return false;
	   }else{
	   		var tip = '';
			if(state=='0'){
				tip = '确认'+tipMsg+'吗?';
			}else if(state=='1'){
				tip = '确认'+tipMsg+'吗?';
			}
			art.dialog({
				title: '友情提示',
				content:'<div class="decorate">'+tip+'</div>',
				okValue: '确定',
				width: '238px',
				cancelValue: '取消',
				lock: true,
			    ok: function () {
			    	saveHiddenVal();//回选方法
			        document.getElementById('commonId').name = "chb_id";
			    	document.getElementById('commonId').value = chb_id;
			    	document.getElementById('commonText').name = "state_val";
			    	document.getElementById('commonText').value = state;
			    	document.getElementById('commonForm').action=actionName;
			    	document.getElementById('commonForm').submit();	  
			    },
			    cancel: function () {
					return true;
			    }
			});
		}
}
//批量推荐与不推荐结束


//赋隐藏域的值用于回选，不丢掉搜索值
function saveHiddenVal(){
	//清空
	$("#hidden_div").html("");
	$("input[name$='_s'],select[name$='_s']").each(function(){
		//alert($(this).attr("name"));
		var fn =$(this).attr("name");
		var fn_val =$(this).val();
		var hidden_name ="<input type='hidden' name='"+fn+"' value='"+fn_val+"' />";
		$("#hidden_div").append(hidden_name);
	});  
}



//批量显示与不显示开始
function updateBatchShow(state,field_name,actionName,recom_id){
        var flag = false;
		var checks = document.getElementsByName(field_name);
		for(var i=0;i<checks.length;i++){
			if(checks[i].checked){
				flag=true;
				break;
			}
		}
		if(flag==false){
			alert("请至少选择一条记录");
			return false;
		}
		if(flag==true){
		    var tip = '';
			if(state=='0'){
				tip = '确认不显示吗?';
			}else if(state=='1'){
				tip = '确认显示吗?';
			}
		       document.getElementById(recom_id).value = state;
			   document.forms[0].action=actionName;
			   document.forms[0].submit();
		       return false;
		}
}
//批量推荐与不推荐结束

//公共批量排序方法
function updateSort(cid,s_val,actionName){  
      var sort_count=0;
      var tf_id="";
      var tf_sort=""
      $("input:checkbox[name='"+cid+"']").each(function(i){
			if(this.checked==true){
				tf_id+=$(this).val()+",";
				tf_sort+=$("input:text[name='"+s_val+"']").eq(i).val()+",";
				sort_count++;
			}	      
      });
      tf_id=deleteLastChar(tf_id,",");
      tf_sort=deleteLastChar(tf_sort,",");
      
      
    if(sort_count==0){
		art.dialog({
			title: '友情提示',
		    content: '请至少选择一条记录!',
		    lock: true
		});
		return false;
	}else{
		art.dialog({
			title: '友情提示',
			content:'<div class="decorate">'+'确定要排序'+'</div>',
			okValue: '确定',
			width: '238px',
			cancelValue: '取消',
			lock: true,
		    ok: function () {
		        document.getElementById('commonId').name = "chb_id";
		    	document.getElementById('commonId').value = tf_id;
		    	document.getElementById('commonText').name = "sort_val";
		    	document.getElementById('commonText').value = tf_sort;
		    	document.getElementById('commonForm').action=actionName;
		    	document.getElementById('commonForm').submit();	  
		    },
		    cancel: function () {
				return true;
		    }
		});
	}
} 

//获取URL路径传过来的值
function queryUrlvalue(key)
{
  var regex_str="^.+\\?.*?\\b"+ key +"=(.*?)(?:(?=&)|$|#)"
  var regex=new RegExp(regex_str,"i");
  var url=window.location.toString();
  if(regex.test(url)) return RegExp.$1;
  return undefined;
}


//对查找出的select 进行回选
function selectCheckObj(objid,thisvalue){
	var levelone = document.getElementById(objid);
	if(levelone!=null){
		for (var j = 0; j < levelone.options.length; j++) {
	        if (levelone.options[j].value == thisvalue) {
	            levelone.options[j].selected = true;
	        }
        }
	}
}

//列表对地区和分类的搜索获取值功能
function showSelectDiv(area_attr_id,cat_atrr_id,bandareaid,bandcatid){
	    //获取地区
	    if(area_attrid!=""){
		 	var area_attr = document.getElementsByName(area_attrid);
		 	var area_attr_str = '';
		 	for(var i=0;i<area_attr.length;i++){
				if(area_attr[i].value!='0'){
					area_attr_str += area_attr[i].value+',';
				}
			 }
		 if(area_attr_str!=""){
		   area_attr_str=area_attr_str.substring(0,area_attr_str.length-1);
		 }
		 $("#"+bandareaid+"").val(area_attr_str);
		}
		//分类获取
		if(cat_atrrid!="")
		{
		var cat_attr= document.getElementsByName(cat_atrrid);
		var cat_attr_str = '';
		for(var i=0;i<cat_attr.length;i++){
			if(cat_attr[i].value!='0'){
				cat_attr_str += cat_attr[i].value+',';
			}
		}
		if(cat_attr_str!="")
		{
		 cat_attr_str=cat_attr_str.substring(0,cat_attr_str.length-1);
		}
		$("#"+bandcatid+"").val(cat_attr_str);
		}
		document.forms[0].submit();
	}


//公共通过脚本处理分类提交表单
function searchSubmit(){
	/****搜索分类加载开始****/
	if($("#cat_attr_s").length > 0){
		var cstr="";
		$("select[name='cat_attr']").each(function(){
			cstr+=$(this).val()+",";
		});
		//去除请选择值
		cstr=cstr.replace("0,","");
		//去掉最后一个逗号
		cstr=deleteLastChar(cstr,",");
		//赋值传给后台搜索
		$("#cat_attr_s").val(cstr);
	}
	/****搜索分类加载结束****/
	/****搜索地区加载开始****/
	if($("#area_attr_s").length > 0){
		var astr="";
		$("select[name='area_attr']").each(function(){
			astr+=$(this).val()+",";
		});
		//去除请选择值
		astr=astr.replace("0,","");
		//去掉最后一个逗号
		astr=deleteLastChar(astr,",");
		//赋值传给后台搜索
		$("#area_attr_s").val(astr);
	}
	/****搜索地区加载结束****/
	//document.forms[0].submit();
	$("#listform").submit();
}


//div层定位
function getPosition(el){ 
	for (var lx=0,ly=0;el!=null;lx+=el.offsetLeft,ly+=el.offsetTop,el=el.offsetParent); 
	return {x:lx,y:ly} 
}


//列表筛选弹出层操作-开始
function divfixed2(r,name){ 
   var sug=document.getElementById(name);
   sug.style.left=getPosition(r).x+"px"; 
   sug.style.top=getPosition(r).y+r.offsetHeight+"px"; 
   sug.style.position="absolute"; 
   sug.style.display="block"; 
}

//显示搜索框
function showSearch(obj,val){
	var objdiv = document.getElementById(val);
	if(objdiv.style.display=="none"){
		divfixed2(obj,val);
	}else{
		objdiv.style.display="none"; 
	}
}

//关闭搜索框
function closeSearch(val){
	var obj_id = "searchDiv";
	if(val!=null && val!=""){
		obj_id=val;
	}
	document.getElementById(obj_id).style.display="none"; 
}

//自定义map对象
function Map(){
 this.keys = new Array();
 this.data = new Array();
 
 this.put = function(key,value){
  if(this.data[key] == null){
   this.keys.push(value);
  }
  this.data[key] = value;
 };
 
 this.get = function(key){
  return this.data[key];
 };
 
 this.remove = function(key){
     for(var i=key+1;i<this.keys.length+1;i++){          
     	this.data[i] = null;
     }
     this.keys.length=key;
 };
 
 this.isEmpty = function(){
  return this.keys.length == 0;
 };
 
 this.size = function(){
  return this.keys.length;
 };
}
/**
 * src的日期应大于targetId的日期，否则返回错误消息
 * 		日期的文本值为：2015-06-19 11:06:44 形式 
 * @param src
 * 		源dom 对象
 * @param targetId
 * 		目标dom 对象的id
 * @param msg
 * 		错误消息
 */		
 function gtDate(src,targetId,msg){
	 
        var tar=document.getElementById(targetId);
        if(tar.value){
	        var srcDate=new Date(src.value.replace(/-/g,"/"));
        	var tarDate=new Date(tar.value.replace(/-/g,"/"));
	        if(srcDate.getTime()-tarDate.getTime()<0){
	        	src.value="";
	            jNotify(msg);
	        }
        }
      
   }
 
 /**
  * src的日期应小于targetId的日期，否则返回错误消息
  * 		日期的文本值为：2015-06-19 11:06:44 形式 
  * @param src
  * 		源dom 对象
  * @param targetId
  * 		目标dom 对象的id
  * @param msg
  * 		错误消息
  */
   function ltDate(src,targetId,msg){
	   var tar=document.getElementById(targetId);
        if(tar.value){
	        var srcDate=new Date(src.value.replace(/-/g,"/"));
        	var tarDate=new Date(tar.value.replace(/-/g,"/"));
	        if(srcDate.getTime()-tarDate.getTime()>0){
	        	src.value="";
	            jNotify(msg);
	        }
        }
      
   }



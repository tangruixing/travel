var login={
		fm:null,
		dlg:null,
		loginUrl:sy.contextPath+"/login_doLogin.do",
		indexUrl:sy.contextPath+"/login_toIndex.do",
		init:function(){
			
			login.dlg=$("#loginDlg").show().dialog('open');
			login.fm=$("#loginFm");
			
			  $("#loginBtn").off('click');
		      $("#loginBtn").on('click', function () {
		    	  login._function.login();
		    	  
		      });      
		      //响应键盘的回车事件
		      $(window).keydown(function (event) {
		          if (event.keyCode == 13) {
		              event.returnValue = false;
		              event.cancel = true;
		              console.info("click");
		              return login._function.login();
		          }
		      });
		      
		    
		},
		_function:{
				login:function(){
					var $fm=login.fm;
					
					 if($fm.form('validate')){
				         $.ajax({
				             url:login.loginUrl,
				             data:$fm.serialize(),
				             catche:false,
				             dataType:"json",
				             type:'POST',
				             success:function(data){
				                 if(data&&data.success){
				                 	
				                     location.replace(login.indexUrl);
				                     login.dlg.dialog('close');
				                     
				                     $.messager.show({
				                         title:'提示',
				                         msg:data.msg,
				                         showType:'show'
				                     })
				                 }else{
				                     $.messager.alert('抱歉',data.msg,'warning');
				                 }
				             }
				         });
				     };
				}
		}
}
$(function () {
    login.init();
});
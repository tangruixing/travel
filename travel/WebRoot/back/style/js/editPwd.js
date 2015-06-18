
/**
 * 
 */
 
var editpassword={

	oldpasswordIsVaild:undefined,
	
	fm:undefined,
	dlg:undefined,
	url:undefined,
	checkOldPwdUrl:sy.contextPath+"/user_checkOldPwd.do",
	editPwdUrl:sy.contextPath+"/user_eidtPassword.do",
	
	init:function(){
		
		editpassword.fm=$("#userEditPwdFm");
		editpassword.dlg=$("#userEditPwdDlg");
		
	
		
		
		$("#user_editpwd_show").off("click");
        $("#user_editpwd_show").on("click", function () {
        	editpassword._function.editPasswordUI();
        });

        
        $("#oldpassword").off("blur");
        $("#oldpassword").on("blur", function () {
        	console.info(this);
            editpassword._function.checkOldPassword($(this).val());
        });
        
        
        
		$("#user_editPwd_save").off("click");
		$("#user_editPwd_save").on("click",function(){
			editpassword._function.editPassword();
		});
		
		$("#user_editPwd_close").off('click');
		$("#user_editPwd_close").on('click', function() {
			editpassword.dlg.dialog('close');
				
		});
		
	},
	_function:{
		checkOldPassword:function(oldpassword){
			var valid=$('#oldpassword').validatebox('isValid');
			console.info(valid);
            if(!valid){
                return;
            }
            var param={
            	oldPwd:oldpassword
            }
            var html='';
            $.post(editpassword.checkOldPwdUrl,param, function (data) {
                $("#unique").empty();
                console.info(data);
                if(data&&data.success) {
                    html+=sy.fs("<img src='{0}' title='{1}' style='float:left'><div style='float:left;color: #1006F1'>{2}</div>",sy.contextPath+"/jslib/easyui-1.4.2/themes/icons/ok.png",data.msg,data.msg);
                }else{
                    html+=sy.fs("<img src='{0}' title='{1}' style='float:left'><div style='float:left;color: #ac2925'>{2}</div>",sy.contextPath+"/jslib/easyui-1.4.2/themes/icons/no.png",data.msg,data.msg);
                }

                $("#unique").append(html).show();

            },'json');
		},
		editPasswordUI:function(){
	
            editpassword.dlg.show().dialog('open').dialog('setTitle','修改用户密码');
            editpassword.url = sy.bp()+'/userController/editPassword';

		},
		editPassword:function(){
	
            if(editpassword.fm.form('validate')){
                console.info(editpassword.fm.serialize());
                $.post(editpassword.url,editpassword.fm.serialize(),function(data){
                    console.info(data);
                    if(data&&data.success){
                    	editpassword.dlg.dialog('close');
                        $.messager.show({
                            title:'提示',
                            msg:data.msg
                        });
                    }else{
                        $.messager.alert('抱歉',data.msg,'warning');
                    }
                },'json');
            };

		}
	}
}

$(function(){
	editpassword.init();
});
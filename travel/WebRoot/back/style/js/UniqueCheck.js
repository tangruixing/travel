function UniqueCheck(url,inputId){
	this.url=url;
	this.$input=$("#"+inputId);
	this.$uniqueInfo=$("#unique_"+inputId);
}

UniqueCheck.prototype={
		
		check:function(){
			var _this=this;
			var valid=_this.$input.validatebox('isValid');
			console.info(valid);
            if(!valid){
                return;
            }
            var inputName=_this.$input.attr('name');
            var inputValue=_this.$input.val();
            var param={
            	inputName:inputValue
            }
            var html='';
            $.post(_this.url,param, function (data) {
                _this.$uniqueInfo.empty();
                console.info(data);
                if(data&&data.success) {
                    html+=sy.fs("<img src='{0}' title='{1}' style='float:left'><div style='float:left;color: #1006F1'>{2}</div>",sy.contextPath+"/jslib/easyui-1.4.2/themes/icons/ok.png",data.msg,data.msg);
                }else{
                    html+=sy.fs("<img src='{0}' title='{1}' style='float:left'><div style='float:left;color: #ac2925'>{2}</div>",sy.contextPath+"/jslib/easyui-1.4.2/themes/icons/no.png",data.msg,data.msg);
                }

                _this.$uniqueInfo.append(html).show();

            },'json');
		},
}
function Page(url,listAreaId){
	this.$listArea=$("#"+listAreaId);
	this.url=url;
	this.$form=null;
	this.init(this.$listArea,this.url);
}

Page.prototype={
		
		setSearchForm:function(id){
			this.$form=$("#"+id);
		},
		setCurrentPage:function(page){
			this.page=page;
		},
		init:function(){
			this.gotoPage(1);
		},
		gotoPage:function(num){
			var _this=this;
			var value=null;
			if(_this.$form){
				value=_this.$form.serialize();
			}
			$.post(_this.url,value,function(data){
				if(data){
					_this.$listArea.empty();
					_this.$listArea.append(data);
				}else{
					jNotify("加载数据出错了");
				}
			},"json");
		}
	
}
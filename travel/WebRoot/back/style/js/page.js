/**
 * url:请求 数据列表的 url
 * listAreaId:填充 数据列表的区域
 */
function Page(url,listAreaId){
	this.$listArea=$("#"+listAreaId);
	this.url=url;
	this.formId=null;
	this.params=[];
}

Page.prototype={
		
		setSearchForm:function(id){
			this.formId=id;
		},
		setParams:function(key,value){
			var str= key+"="+value;
			this.params.push(str);
		},
		setCurrentPage:function(page){
			this.page=page;
		},
		gotoPage:function(num){
			var _this=this;
			var value=null;
			var url=_this.url+"?page="+num;
			
			if(_this.formId){
				value=$("#"+_this.formId).serialize();
			}
			if(_this.params.length>0){
				url+="&"+_this.params.join("&");
			}
			console.info(url);
			$.post(url,value,function(data){
				if(data){
					_this.$listArea.empty();
					console.info(_this.$listArea);
					_this.$listArea.append(data);
				}else{
					jNotify("加载数据出错了");
				}
			});
		}
	
}
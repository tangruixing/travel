
/**
 * 初始化
 * 	var demo=new Base(clz);
 *  demo.
 * 	demo.init(clz);//初始化
 * 	demo.grid(girdOpts,dialogOpts,parentObj);
 */
function Base(clz,gdOptions,dlgOptions,parentDlg,url){

	this.init(clz,gdOptions,dlgOptions,parentDlg,url);
	
}

Base.prototype={
		init:function(clz,gdOptions,dlgOptions,parentDlg,url){
			/**
			 * 组件
			 */
			this.$grid=$("#"+clz+"_grid");
			
			this.$saveBtn=$("#"+clz+"_saveBtn");//添加
			this.$updateBtn=$("#"+clz+"_updateBtn");//修改
			this.$deleteBtn=$("#"+clz+"_deleteBtn");//删除
			this.$reloadBtn=$("#"+clz+"_reloadBtn");//删除
			this.parentDialog=parentDlg;
			console.info(this.parentDialog);
			var _this=this;
			/**
			 * 按钮事件绑定
			 */
			this.$saveBtn.off("click");
			this.$saveBtn.on("click",function(){
				_this.toSave();
			});
			this.$updateBtn.off("click");
			this.$updateBtn.on("click",function(){
				_this.toUpdate();
			});
			this.$deleteBtn.off("click");
			this.$deleteBtn.on("click",function(){
				_this.batchDelete();
			});
			this.$reloadBtn.off("click");
			this.$reloadBtn.on("click",function(){
				_this.reload();
			});
			
			/**
			 * 路径
			 */
			this.url=$.extend({
				toSave:sy.contextPath+"/"+clz+"_toSave.do",
				toUpdate:sy.contextPath+"/"+clz+"_toSave.do",
				doList:sy.contextPath+"/"+clz+"_doList.do",
				doSaveOrUpdate:sy.contextPath+"/"+clz+"_toSave.do",
				doDeletes:sy.contextPath+"/"+clz+"_doDeletes.do",
			},url);
			
			/**
			 * 请求参数
			 */
			this.urlParams=[];
			this.gridOpts=$.extend({
				title : '',
				idField : 'id',
				sortName : 'id',
				sortOrder : 'asc',
				toolbar : '#toolbar',
				striped : true,
				pagination : true,//分页栏
				pageSize : 10,// 默认分页显示数据大小
		        pageList : [5, 10, 20, 30],// 选择分页大小
				singleSelect : false,
				nowarp : false,// 不还行（默认true）：false,换行;true,不还行
				onBeforeLoad : function(param) {
					console.info(parent);
					$.messager.progress({
						text : '数据加载中....'
					});
				},
				onLoadSuccess : function(data) {
					$.messager.progress('close');
				}
			},gdOptions);
			
			this.dialogOpts=$.extend({
				title : '&nbsp;',
				width : 640,
				height : 480,
    		    href: this.url.toSave,
				modal : true
			},dlgOptions);
		},
		setUrlParam:function(key,value){
			var str=key+"="+value;
			this.urlParams.push(str);
		},
		
		getUrlParams:function(pre){
			var url="";
			if(this.urlParams.length>0){
				url=pre+this.urlParams.join("&");
			}
			return url;
		},
		loadGrid:function(){

			this.gridOpts.url=this.url.doList+this.getUrlParams("?");
			this.$grid.datagrid(this.gridOpts);
		},
		
		
		
		/**
		 * 后台请求打开：添加页面
		 */
		toSave:function(){
			
			
			this.dialogOpts.href=this.url.toSave+this.getUrlParams("?");
			
			this.parentDialog.open(this.dialogOpts, window, this.$grid);
        },
        
        
        /**
		 * 后台请求打开：修改页面 
		 */
        toUpdate:function(dlgOpts,pdlg){
            var rows=this.$grid.datagrid("getSelections");
            console.info(rows);

            if(rows.length<=0){
            	parent.$.messager.alert('提示','请选择要编辑的行','warning');
                return ;
            }
            if(rows.length>1){
            	parent.$.messager.alert('提示','只能选择一行来编辑','warning');
                return ;
            }
            if (rows.length==1){
                var row=rows[0];
                console.info(row);
               
                
				this.dialogOpts.href=this.url.toUpdate+"?id="+row.id+this.getUrlParams("&");
    			
				this.parentDialog.open(this.dialogOpts, window, this.$grid);
               
            }
        },
       /* doSaveOrUpdate:function(fm){
        	
    	   $.post(this.url.doSaveOrUpdate,this.fm.serialize(),function(data){
               if(data&&data.success){
               	_this.dlg.dialog('close');		// close the dialog
               	_this.$grid.datagrid('reload');	// reload the role data
                   $.messager.show({
                       title:'提示',
                       msg:data.msg
                   });
               }else{
                   $.messager.alert('抱歉',data.msg,'warning');
               }
           },'json');
        },*/
        /**
         * 删除操作：
         */
        batchDelete:function(){
        	var _this=this;
            var rows = _this.$grid.datagrid('getChecked');
            console.info(rows);
            if(rows.length<=0){
                $.messager.alert('提示','请选择要删除的行','warning');
                return ;
            }
            if (rows.length > 0) {
                $.messager.confirm('请确认', '您要删除当前所选项目？', function(r) {
                    if (r) {
                    	var ids=[];
                        for (var i = 0; i < rows.length; i++) {
                            ids.push(rows[i].id);
                        }
                        var param = {
                        	deleteIds : ids.join(',')
                        };
                        $.post(_this.url.doDeletes,
                            param, function(data) {

                        		_this.reload();

                                if (data && data.success) {
                                   parent.$.messager.show({
                                        title : '提示',
                                        msg : data.msg
                                    });
                                } else {
                                	parent.$.messager.alert("抱歉",
                                        data.msg, "icon-no");
                                }
                            }, 'json');
                    }
                });
            }
        },
        /**
         * 重载 
         */
        reload:function(){
        	this.$grid.datagrid('reload');
        	this.$grid.datagrid('unselectAll');// 取消掉选择行
        }
}
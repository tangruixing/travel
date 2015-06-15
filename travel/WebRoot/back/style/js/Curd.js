/**
 * Created by always on 2015/6/10.
 */
function Curd(baseUrl,clz,columns){
	
    this.dgColumns=columns;
  
    this.clz=clz;
    
    console.info(this.clz);
    this.dg=$("#"+this.clz+"_dg");
    this.dlg=$("#"+this.clz+"_dlg");
    this.fm=$("#"+this.clz+"_fm");
    this.fmSaveBtn=$("#"+this.clz+"_save");
    this.fmCloseBtn=$("#"+this.clz+"_close");
    this.baseUrl=baseUrl+"/"+this.clz;
    console.info(this.baseUrl);
}

Curd.prototype={
    init:function(url,columns,sortName){
        var _this=this;
        var defaultUrl={
            save:_this.baseUrl+"_doSave.do",
            update:_this.baseUrl+"_doUpdate.do",
            list:_this.baseUrl+"_doList.do",
            saveOrUpdate:_this.baseUrl+"_doSaveOrUpdate.do",
            remove:_this.baseUrl+"_doDeletes.do"
        };
        this.url=url||defaultUrl;

        this.dgSetting={
            url :this.url.list,// 访问服务器路径//title:'BBS',//标题
            //singleSelect:true,
            iconCls : 'icon-save',// 图标
            idField : 'id',// pk标识，翻页的时候记住选中的//frozenColumns :
            columns :columns||this.dgColumns,
            toolbar :[/*'#search', */{// 只能添加按钮
                text : '增加',
                iconCls : 'icon-add',
                handler :function(){
                    _this._function.toSave.call(_this);
                }
            }, '-', {
                text : '修改',
                iconCls : 'icon-edit',
                handler : function(){
                    _this._function.toUpdate.call(_this);
                }// 点击修改
            },'-', {
                text : '删除',
                iconCls : 'icon-remove',
                handler :function(){
                    _this._function.batchDelete.call(_this);
                }
            }, '-', {
                text : '刷新',
                iconCls : 'icon-reload',
                handler :function(){
                    _this._function.refresh.call(_this);
                }
            }, '-',{
            	text:'搜索',
            	iconCls:'icon-search',
            	handler:function(){
            		
            		_this.gridLayout.layout('expand', 'north');
    				$("#"+this.clz+"_search_table").show();
    				_this.searchFm=$("#"+this.clz+"_search_fm");
    				_this.searchA=$("#"+this.clz+"_search");
    				_this.cleanA=$("#"+this.clz+"_clean");
    				_this.refreshA=$("#"+this.clz+"_refresh");
    				
    				/* 查询 */
    				// 查询_user_serarch
    				_this.searchA.off("click");
    				_this.searchA.on("click", function() {
    					_this._function.search.call(_this);
    				});
    				// 清空查询条件
    				_this.cleanA.off("click");
    				_this.cleanA.on("click", function() {
    					gx.cleanFm(_this.searchFm);
    				});
    				// 清空查询条件+刷新dg面板
    				_this.refreshA.off("click");
    				_this.refreshA.on("click", function() {
    					_this._function.clean.call(_this);
    				});
    				
    				
    				
    				
    				
    				
    				
            	}
            },'-'],// datagrid.news.setting.toolbar,//增删改插
            sortName : sortName||'id',// 第一次加载的时候按照'rolename'来进行排序
            sortOrder : 'desc',// 降序;asc:升序
            pagination : true,// 分页栏
            pageSize : 10,// 默认分页显示数据大小
            pageList : [5, 10, 20, 30],// 选择分页大小
            fit : true,// 自适应
            fitColumns : true,// 每列自适应:false(多)
            nowarp : false,// 不还行（默认true）：false,换行;true,不还行
            onDblClickRow:function(index,row){
                _this.dlg.show().dialog('open').dialog('setTitle','修改');
                _this.fm.form('load',row);
            },
            onLoadSuccess : function() {
                parent.$.messager.progress('close');
            }
        };
        _this.gridLayout=$("#gridLayout");
        _this.gridLayout.layout('collapse', 'north');
        this.controller();
    },
    controller:function(){
        var _this=this;
        console.info(this);
        console.info(this.dgSetting);
        _this.dg.datagrid(this.dgSetting);
        console.info(this.fmSaveBtn);
        _this.fmSaveBtn.off('click');
        _this.fmSaveBtn.on('click', function () {
            _this._function.doSaveOrUpdate.call(_this);
        });


        _this.fmCloseBtn.off('click');
        _this.fmCloseBtn.on('click', function () {
            _this._function.close.call(_this);
        });

    },
    _function:{

        toSave:function(){
            console.info(this.fm);
            this.fm.form('clear');
            this.dlg.show().dialog('open').dialog('setTitle',"添加");
        },
        toUpdate:function(){
            var rows=this.dg.datagrid("getSelections");
            console.info(rows);

            if(rows.length<=0){
                $.messager.alert('提示','请选择要编辑的行','warning');
                return ;
            }
            if(rows.length>1){
                $.messager.alert('提示','只能选择一行来编辑','warning');
                return ;
            }
            if (rows.length==1){
                var row=rows[0];
                this.dlg.show().dialog('open').dialog('setTitle','修改');
                this.fm.form('load',row);
            }
        },
        doSaveOrUpdate:function(){
        	var _this=this;
            if(_this.fm.form('validate')){
                $.post(this.url.saveOrUpdate,this.fm.serialize(),function(data){
                    console.info(data);
                    if(data&&data.success){
                    	_this.dlg.dialog('close');		// close the dialog
                    	_this.dg.datagrid('reload');	// reload the role data
                        $.messager.show({
                            title:'提示',
                            msg:data.msg
                        });
                    }else{
                        $.messager.alert('抱歉',data.msg,'warning');
                    }
                },'json');
            };
        },
        batchDelete:function(){
        	var _this=this;
            var rows = _this.dg.datagrid('getChecked');
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
                        $.post(_this.url.remove,
                            param, function(data) {

                        	_this.dg.datagrid('reload');
                        	_this.dg.datagrid('unselectAll');// 取消掉选择行

                                if (data && data.success) {
                                    $.messager.show({
                                        title : '提示',
                                        msg : data.msg
                                    });
                                } else {
                                    $.messager.alert("抱歉",
                                        data.msg, "icon-no");
                                }
                            }, 'json');
                    }
                });
            }
        },
        search : function() {
        	console.info(sy.serializeObject($("#"+this.clz+"_search_fm")));
			this.dg.datagrid('load',sy.serializeObject(this.searchFm));
		},
        refresh:function(){
            this.dg.datagrid('load');//
            this.dg.datagrid('unselectAll');// 取消掉选择行
        },
        clean:function(){
            this.dg.datagrid('load',{});
        },
        close:function(){
            this.dlg.dialog('close');
        }
    }
};

/**
 * 思路：在子 iframe 中打开父 iframe 中的 dialog ,加载远程页面,远程页面
 */
function dlg(){
	this.opts=null;
	this.$grid=null;// 当前 iframe 中的 grid
	this.parentDlg=$('<div/>');//父 dialog
	this.childWindow=null;//当前 iframe
}

dlg.prototype={
		open:function(opts,childWindow,$grid){
		
			opts.modal = true;// 强制此dialog为模式化，无视传递过来的modal参数
			this.opts=opts;
			this.parentDlg.dialog(this.opts);//
			
			this.childWindow=childWindow;
			
			this.$grid=$grid;
			
			console.info("打开dialog(dlg,子页面,grid)");
			console.info(this.parentDlg);
			console.info(this.childWindow);
			console.info(this.$grid);
			
			
		},
		singleOpen:function(options,childWindow,$grid){
			
			this.open(opts, childWindow, $grid)
			var opts = $.extend({
				title : '&nbsp;',
				width : 640,
				height : 480,
				modal : true,
				onClose : function() {
					$(this).dialog('destroy');
				}
			}, options);
			this.open(opts, childWindow, $grid);
			console.info("当前子页面为：");

			console.info(childWindow);
		},
		close:function(grid){
			console.info("关闭dialog(dlg,子页面,grid)");
			
			console.info(this.parentDlg);
			console.info(this.childWindow);
			console.info(this.$grid);
			console.info(grid);
			var dg=this.childWindow.$(grid)||this.$grid;
			console.info(dg);
			console.info(dg);
			if(!dg){
				$.messager.alert("未定义 grid ",
                        data.msg, "icon-no");
				return ;
			}
			this.parentDlg.dialog('close');
			this.$grid.datagrid('reload');	// reload the role data
			this.$grid.datagrid('unselectAll');// 取消掉选择行
		}
}
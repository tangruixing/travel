var gx={
		childWindow:null,
		/**
		 * 子打开父
		 */
		parentDialog:function(config,currentWindow){
			console.info("当前window:");
			console.info(currentWindow);
			console.info(window);
			parent.$('#parentDlg').dialog(config);
		},
		closeDlgAndRefreshDg:function(id){
			parent.$('#parentDlg').dialog('close');
			gx.childWindow.$("#"+id).datagrid('load');//
			gx.childWindow.$("#"+id).datagrid('unselectAll');// 取消掉选择行
		},
		add:function(){
			
		},
		update:function(){
			
		},
		remove:function(url,params){
			
		
		}
}
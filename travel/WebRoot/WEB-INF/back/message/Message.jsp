<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/back.jspf" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Message管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="message_reloadBtn">刷新</a>
    </div>
	
	<div data-options="region:'center',fit:true,border:false">
		<table id="message_grid" data-options="fit:true,border:false"></table>
	</div>
</body>

<script type="text/javascript">
		var gdOptions=null,
			dlgOptions=null,
			message=null;
        $(function () {
        	var gdOptions={
        			columns:[[{
                        title : '用户编号',
                        field : '"id"',// 绑定属性名字,后台返回的json数据
                        width : 100,// 必须要给，大于50
                        sortable : true,// 鼠标点击可以升序/降序切换
                        checkbox : true

                    },{
					title : '手机号',
					field : 'mobile',
					width : 100,
					sortable : true
					},{
					title : '邮箱',
					field : 'email',
					width : 100,
					sortable : true
					},{
					title : '名字',
					field : 'realName',
					width : 100,
					sortable : true
					},{
					title : '性别',
					field : 'sex',
					width : 100,
					sortable : true,
					formatter : function(value, row, index) {
						
						switch(row.sex)
						{
						case 1:
							return "男";
						  break;
						case 2:
							return "女";
						  break;
						default:
							return "保密";
						}
					
					}
					},{
					title : '出生日期',
					field : 'birth',
					width : 100,
					sortable : true
					},{
                         title : '操作',
                         field : 'action',
                         width : 100,
                         formatter: function (value, row, index) {
                        	
                        	 var str="";
                            
/*                              str+="&nbsp"
                             str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/message_delete.png",row.id);
                             return str; */
                        	 switch(row.message)
     						{
     						case 1:
     							return  str+=sy.fs('<input type="button"  onclick="replay(\'{0}\',\'{1}\')"  title="1" value="回复" />',row.id,row.realName);;
     						  break;
     					/* 	case 2:
     							return  str+=sy.fs('<input  type="button"  onclick="look(\'{0}\',\'{1}\')" title="1" value="已回复"/>',row.id,row.realName);
     						  break; */
     						}
                        	 

                            /*  var str="";
                              str+=sy.fs('<img   src="{0}"  onclick="demo1(\'{1}\')"  title="1" />',"../style/images/myIcons/key_add.png",row.id);
                              str+="&nbsp"
                              str+=sy.fs('<img   src="{0}"  onclick="demo2(\'{1}\')" title="1" />',"../style/images/myIcons/message_delete.png",row.id);
                              return str;*/
                         }
                     }]]
        	}
           
        		dlgOptions={
            		title: '回复',
          		    width: '80%',
          		    height: '80%',
          			onClose:function(){
        		  		parent.mainDlg.parentDlg.dialog('destroy');
        		    },
        	}  
            message=new Base("message",gdOptions,dlgOptions,parent.mainDlg);
            message.loadGrid();         
        });
        
        function replay(id,name){
        	console.info(id);
        	console.info(name);
        	message.dialogOpts.href='<%=contextPath%>/message_toAdminReply.do?userId='+id+'&userName='+name,
        	message.parentDialog.open(message.dialogOpts, window, message.$grid);
        }
    </script>
</html>

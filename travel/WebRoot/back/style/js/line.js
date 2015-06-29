
/**
 * Created by always on 2015/5/13.
 */


function myLine() {
}


myLine.prototype = {
		 
		_init:function(url){
			 var _this=this;
			  $("input[name='loadMap']").off('click');
		      $("input[name='loadMap']").on('click', function () {
		          	var value={
		        	         rid:this.id
		        	};
			      	_this.lineDlgMap(url,value);
		      });
		      
		      _this.closeDlg();
		     
		},
		closeDlg:function(){
			 $("#map_close").off('click');
		      $("#map_close").on('click', function () {
		    	  $("#mapDlg").dialog('close');
		      });
		      
		},
		lineDlgMap:function(url, value) {
			var dlg=$("#mapDlg");//地图显示dialog
			var _this = this;
			 $.post(url,value,function(data){
	             if(data!=null&&data.success){
	             	 if(!data.obj){
	             		 parent.$.messager.alert('提示','暂时没有活动地点,请先设计活动路线','warning');
	                  }else{
	                 	   _this.data=data.obj;
	                        dlg.show().dialog('open').dialog('setTitle','活动路线地图');//['+row.name+']
	                       _this.showMap();
	                  }
	               
	             }else{
	             	 parent.$.messager.alert('提示',data.msg,'error');
	             }
	         },'json');

		},
		
		lineDivMap : function(url, value,id) {
			var _this = this;
			$.post(url, value, function(data) {

				if (data != null && data != undefined) {
					if (!data.obj) {
						$("#"+id).hide();
					} else {
						_this.data=data.obj;
						_this.showMap();
					}

				}
			}, 'json');

		},	
	showMap : function() {
		var _this = this;
		var i;
		var adds;

		var blueIcon =  sy.contextPath+"/back/style/images/map/blue_01.png";
		var orangeIcon = sy.contextPath+"/back/style/images/map/orange_01.png";
		var map = new BMap.Map("show-map");
		map.centerAndZoom(new BMap.Point(119.314096, 26.090628), 12);

		initMap();

		// 创建和初始化地图函数:
		function initMap() {
			i = 0;
			adds = _this.data;// 初始化数据
			setMapEvent();// 设置地图事件
			addMapControl();// 向地图添加控件
			addMapOverlay();// 向地图添加覆盖物
		}
		function setMapEvent() {
			map.enableScrollWheelZoom(); 
			map.enableKeyboard();
			map.enableDragging();
			map.enableDoubleClickZoom()
		}

		function addClickHandler(marker, myIcon, label, window, imgId) {
			marker.addEventListener('mouseout', function(e) {
				marker.closeInfoWindow();
				myIcon.setImageUrl(blueIcon);
				marker.setIcon(myIcon);
				label.setStyle({
					backgroundColor : "#2476e3",
				});
			});

			marker.addEventListener("mouseover", function() {
				
				marker.openInfoWindow(window);
				$("#" + imgId + "").on("onload", function() {
					window.redraw(); // 防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
				});
				
				myIcon.setImageUrl(orangeIcon);
				marker.setIcon(myIcon);
				label.setStyle({
					backgroundColor : "#ff9912",
				});
			
			});
		};

		function addMapOverlay() {

			var point = null;
			var marker = null;
			var points = [];
			var linkAddrStr = "";
			var imgId = null;
			var sContent = null;
			var infoWindow = null;

			var infoSize=new BMap.Size(0,-20);
			var opts = {
				//title : null, // 信息窗口标题
				enableMessage : false,// 设置允许信息窗发送短息
				offset:infoSize
			};
			var myIcon = new BMap.Icon(blueIcon, new BMap.Size(33, 43));
			var scenery=null;
			myIcon.setAnchor(new BMap.Size(17, 42));
			for (; i < adds.length; i++) {
				scenery=adds[i].scenery;
				point = new BMap.Point(scenery.longitude, scenery.latitude);// 坐标
				if (i == 0) {
					linkAddrStr += scenery.realName;
					map.centerAndZoom(point, 12);
				} else {
					linkAddrStr += ("-" + scenery.realName);
				}

				// 向地图添加覆盖物
				var strTitle = "地点：" + scenery.address;
				var title=scenery.realName;
				if (adds[i].day != undefined) {
					strTitle += ",停留：" + adds[i].day + "天";
					title+=" ("+adds[i].day+"天)";
				}

				var icon = {
					title : strTitle
				};
				//opts.title = adds[i].name// "停留："+adds[i].day+"天";
				marker = new BMap.Marker(point, icon);// 标记
				var label = new BMap.Label(i + 1, {
					offset : new BMap.Size(10, 8),
				});
				label.setStyle({
					border : "none",
					color : "white",
					fontSize : "18px",
					backgroundColor : "#2476e3",
					height : "15px",
					width : "5px",
				});
				/*
				 * label=new BMap.Label(i+1,{offset: new BMap.Size(25,5)});
				 */imgId = "imgDemo" + adds[i].id;

				 sContent ="<div style='margin-top:16px;'>"+
					
					"<img  id='"
							+ imgId
							+ "'  src='"
							+ sy.contextPath+"/"+scenery.logo
							+ "' width='220' height='104' title='"+scenery.realName+"'/>"
							+"<h4 style='height:24px;overflow:hidden;margin:0 0 5px 0;'>"+scenery.realName+"</h4>" 
							+ "<p style='margin:0;font-size:13px;'>"
							+ adds[i].description + "</p>" + "</div>";

				marker.setLabel(label);// 设置显示
				marker.setIcon(myIcon);
				map.addOverlay(marker);// 添加标记

				infoWindow = new BMap.InfoWindow(sContent, opts); // 创建信息窗口对象
				addClickHandler(marker, myIcon, label, infoWindow, imgId);// 显示窗口信息

				points[i] = point;

			}

			// 连线
			var polyline = new BMap.Polyline(points, {
				strokeColor : "black",
				strokeWeight : 3,
				strokeOpacity : 0.5
			});
			map.addOverlay(polyline); // 添加到地图

		}
		// 向地图添加控件
		function addMapControl() {

			var scaleControl = new BMap.ScaleControl({
				anchor : BMAP_ANCHOR_BOTTOM_LEFT
			});
			scaleControl.setUnit(BMAP_UNIT_METRIC);
			map.addControl(scaleControl);

			var navControl = new BMap.NavigationControl({
				anchor : BMAP_ANCHOR_TOP_LEFT,
				type : 0
			});
			map.addControl(navControl);

			var overviewControl = new BMap.OverviewMapControl({
				anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
				isOpen : true
			});
			map.addControl(overviewControl);

			var mapType1 = new BMap.MapTypeControl({
				anchor : BMAP_ANCHOR_TOP_RIGHT,
				mapTypes : [ BMAP_NORMAL_MAP, BMAP_SATELLITE_MAP ]
			});
			map.addControl(mapType1);

		}

	}

};
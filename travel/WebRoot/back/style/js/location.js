/**
 * Created by king on 2015/5/11.
 * 在 添加/修改活动时 标记地图
 */
var Location={
	modal:null,
    map:null,
    lng:null,
    lat:null,
    userInput:true,//默认用户已经输入值
    myValue:null,
    getThePosition:function(e){//点击获得地址+经纬度
        //获取经纬度
        var map=Location.map;
        map.clearOverlays();//清除地图上所有覆盖物
        $('#lng').val(e.point.lng);
        $('#lat').val(e.point.lat);

        //得到地址
        var pt = e.point;
        var geoc = new BMap.Geocoder();
        geoc.getLocation(pt, function(rs){
            var addComp = rs.addressComponents;
          
            $("#suggestId").val(addComp.province+"" +addComp.city +""+addComp.district+""+addComp.street+""+addComp.streetNumber);
            
            if(!Location.userInput){//用户没有输入
            	$("#userInput").val(addComp.province+"" +addComp.city +""+addComp.district+""+addComp.street+""+addComp.streetNumber);
            }
            
            Location.myValue=addComp.province+"" +addComp.city +""+addComp.district+""+addComp.street+""+addComp.streetNumber;
            	
        });

        //标记
        var marker = new BMap.Marker(e.point);
        map.addOverlay(marker);
        marker.addEventListener("rightclick",function(e){
            map.removeOverlay(e.target);
        });
    },
    openSearch: function () {
        var map=Location.map;
   
        //Location.map=map;
        // 百度地图API功能
        function G(id) {
            return document.getElementById(id);
        }
        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "suggestId"
                ,"location" : map
            });
     
        ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
            var str = "";
            var _value = e.fromitem.value;
            var value = "";
            if (e.fromitem.index > -1) {
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

            value = "";
            if (e.toitem.index > -1) {
                _value = e.toitem.value;
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
            G("searchResultPanel").innerHTML = str;
        });

        var myValue;
        ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

            setPlace();
        });

        function setPlace(){
            map.clearOverlays();    //清除地图上所有覆盖物
            function myFun(){
            
                var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                map.centerAndZoom(pp, 18);
                $('#lng').val(pp.lng);
                $('#lat').val(pp.lat);
                if(!Location.userInput){//用户没有输入
                	$("#userInput").val(myValue);
                }
                Location.myValue=myValue;
                map.addOverlay(new BMap.Marker(pp));    //添加标注
            }
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: myFun
            });
       
          
            local.search(myValue);
        }
        
        //文本框赋值
        if(Location.myValue!=null){
        	$("#suggestId").attr("value",Location.myValue);
        }
        
    },
    init:function(){
    	
    	   Location.modal=$("#myModal");
    	   
    	   var i=0;
       	 
    	   
           $("#markBtn").off('click');
           $("#markBtn").on('click', function () {
        	   if(i==0){//第一次点击
        		   /*用户是否输入值*/
            	   var userInput=$("#userInput").val();
              
                   if(userInput==undefined||userInput==null||userInput==""||userInput.length==0){//没有输入
                   		Location.userInput=false;
                   }
            	   ++i;
        	   }
        
        	   Location.modal.modal('show');
           	   Location.initMap();
               
           });
           
           $("#markClose").off('click');
           $("#markClose").on('click', function () {
              // _role_curdCommon._function.close();
        	   console.info('close');
        	   Location.modal.modal('close');
           });
    },
    initMap:function(){
    	
    	   //初始化地图
        var map = new BMap.Map("l-map");
        Location.map=map;

        //起始点
        var startPoint=new BMap.Point(116.331398,39.897445);
        var lng=$("#lng").val();
        var lat=$("#lat").val();
     
        if(lng!=null&&lng!=""&&lat!=null&&lat!=""){
    
            startPoint=new BMap.Point(lng,lat);
        }

        //标记起始点
        map.centerAndZoom(startPoint, 18);//必须
        map.enableScrollWheelZoom(true);//可以缩放
        map.disableDoubleClickZoom();

        //标记
        var marker = new BMap.Marker(startPoint);
        map.addOverlay(marker);

   
        
        //给地图添加点击事件
        //设置点击事件
        map.addEventListener("dblclick",Location.getThePosition);

        //开启只能搜索
        Location.openSearch();
    }
};
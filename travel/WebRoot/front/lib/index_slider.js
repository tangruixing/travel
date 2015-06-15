  $(function(){
    //新建一个Slider对象实例，并且设置幻灯持续间隔为3000毫秒
    var slider = new Slider("#slider01").setDuration(3000);
	
	var win = $(window).outerWidth();//首先获取浏览器的宽度
	
		//设置幻灯片的大小
    slider.setSize('100%',500/1366*win);
	
	$(window).resize(function(){
	//浏览器变化宽度的动作。
	win = $(window).outerWidth();
	slider.setSize('100%',500/1366*win);
	})

	//从photos.json这个本地的json文件中加载幻灯片图像
    slider.setPhotos([{"src":"front/images/lunbo-1.jpg"},{"src":"front/images/lunbo-2.jpg"},{"src":"front/images/lunbo-3.jpg"}]);
  });
  
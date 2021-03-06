var swfPath = sy.contextPath
		+ '/jslib/webuploader/js/Uploader.swf';
var server = sy.contextPath + "/UploadImageServlet";
// 上传单张图片 
function uploadSimpleImage(icon, iconName, picker) {
	this.init(icon, iconName, picker)
}

uploadSimpleImage.prototype = {
	init : function(icon, iconName, picker) {
		var $ = jQuery, $icon = $('#' + icon), $iconName = $('#' + iconName),
		// 优化retina, 在retina下这个值是2
		ratio = window.devicePixelRatio || 1,

		// 缩略图大小
		thumbnailWidth = 100 * ratio, thumbnailHeight = 100 * ratio,

		// Web Uploader实例 
		uploader;

		// 初始化Web Uploader
		uploader = WebUploader
				.create({
					// 自动上传。
					auto : true,
					// swf文件路径
					swf : swfPath,

					// 文件接收服务端。
					server : server,

					// 选择文件的按钮。可选。
					// 内部根据当前运行是创建，可能是input元素，也可能是flash.
					pick : '#' + picker,
					runtimeOrder : 'html5,flash',
					fileNumLimit : 1,
					// 只允许选择文件，可选。
					accept : {
						title : 'Images',
						extensions : 'gif,jpg,jpeg,bmp,png',
						mimeTypes : 'image/*'
					}
				});

		// 当有文件添加进来的时候
		uploader.on('fileQueued', function(file) {

			// 创建缩略图
			uploader.makeThumb(file, function(error, src) {
				if (error) {
					$img.replaceWith('<span>不能预览</span>');
					return;
				}

				$icon.attr('src', src);
			}, thumbnailWidth, thumbnailHeight);
		});

		// 文件上传失败，现实上传出错。
		uploader.on('uploadError', function(file) {
			var $li = $('#' + file.id), $error = $li.find('div.error');

			// 避免重复创建
			if (!$error.length) {
				$error = $('<div class="error"></div>').appendTo($li);
			}

			$error.text('上传失败');
		});

		// 上传成功。
		uploader.on('uploadSuccess', function(file, response) {
			$iconName.attr("value", response.url);// input被赋值图片地址

		});
	}
}


//上传多图片
function uploadManyImages(target,$queue,count) {
	this.init(target,$queue,count);
}

uploadManyImages.prototype = {
	
		init : function(target,$queue,count) {
			var _this=this;
			this.imageList = [];
			// 添加的文件数量
			this.fileCount = 0;

			//console.info(fileNum);
			
			var $wrap = $('#' + target), _this = this,

			// 状态栏，包括进度和控制按钮
			$statusBar = $wrap.find('.statusBar'),

			// 文件总体选择信息。
			$info = $statusBar.find('.info'),

			// 上传按钮
			$upload = $wrap.find('.uploadBtn'),

			// 没选择文件之前的内容。
			$placeHolder = $wrap.find('.placeholder'),

			$progress = $statusBar.find('.progress').hide(),

			

			// 添加的文件总大小
			fileSize = 0,

			// 优化retina, 在retina下这个值是2
			ratio = window.devicePixelRatio || 1,

			// 缩略图大小
			thumbnailWidth = 110 * ratio, thumbnailHeight = 110 * ratio,

			// 可能有pedding, ready, uploading, confirm, done.
			state = 'pedding',

			// 所有文件的进度信息，key为file id
			percentages = {},
			// 图片容器
			$queue ,
			 
			// WebUploader实例
			uploader; 
			
		
			if (false == this.isSupportWebuploader($wrap))// 返回 false 代表不支持您的浏览器！
				return;

			options={ 
				formData : {
					uid : 123
				}, 
				swf : swfPath,
				chunked : false,
				chunkSize : 512 * 1024, 
				server : server,  
				// 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
				disableGlobalDnd : true, 
				fileNumLimit : count|300,
				fileSizeLimit : 200 * 1024 * 1024, // 200 M
				fileSingleSizeLimit : 50 * 1024 * 1024
			// 50 M
			};
			
			if($queue == null ){
				$queue= $('<ul class="filelist"></ul>').appendTo(
						$wrap.find('.queueList'));
				options.pick ={
							id : '#filePicker',
							label : '点击选择图片'
						}; 
				options.dnd ='#dndArea',
				options.paste = '#uploader';
			 };  
			
			// 实例化
			uploader = WebUploader
					.create(options);
			
			  uploader.on( 'beforeFileQueued', function( file ) {  
				   var opts = this.options, 
	                max = parseInt( opts.fileNumLimit, 10 ),
	                flag = true; 
	            	
	                if ( _this.fileCount >= max && flag ) {
	                    flag = false;
	                    this.trigger( 'error', '不能超过'+max+'张', max, file );
	                    setTimeout(function() {
	                        flag = true;
	                    }, 1 );
	                } 
	                return _this.fileCount >= max ? false : true;
	            });
			  

			// 拖拽时不接受 js, txt 文件。
			uploader.on('dndAccept', function(items) {
				var denied = false, len = items.length, i = 0,
				// 修改js类型
				unAllowed = 'text/plain;application/javascript ';

				for (; i < len; i++) {
					// 如果在列表里面
					if (~unAllowed.indexOf(items[i].type)) {
						denied = true;
						break;
					}
				}
				return !denied;
			});

			// 添加“添加文件”的按钮，
			uploader.addButton({
				id : '#filePicker2',
				label : '继续添加'
			});

			uploader.on('ready', function() {
				window.uploader = uploader;
			});

			// 当有文件添加进来时执行，负责view的创建
			function addFile(file) {
				var $li = $('<li id="' + file.id + '">' + '<p class="title">'
						+ file.name + '</p>' + '<p class="imgWrap"></p>'
						+ '<p class="progress"><span></span></p>' + '</li>'),

				$btns = $(
						'<div class="file-panel">'
								+ '<span class="cancel">删除</span>').appendTo($li), $prgress = $li
						.find('p.progress span'), $wrap = $li.find('p.imgWrap'), $info = $('<p class="error"></p>'),

				showError = function(code) {
					switch (code) {
					case 'exceed_size':
						text = '文件大小超出';
						break;

					case 'interrupt':
						text = '上传暂停';
						break;

					default:
						text = '上传失败，请重试';
						break;
					}

					$info.text(text).appendTo($li);
				};

				if (file.getStatus() === 'invalid') {
					showError(file.statusText);
				} else {
					// @todo lazyload
					$wrap.text('预览中');
					uploader.makeThumb(file, function(error, src) {
						var img;

						if (error) {
							$wrap.text('不能预览');
							return;
						}

						if (_this.isSupportBase64) {
							img = $('<img src="' + src + '">');
							$wrap.empty().append(img);
						} else {
							$wrap.text("预览出错");
						}
					}, thumbnailWidth, thumbnailHeight);

					percentages[file.id] = [ file.size, 0 ];
					file.rotation = 0;
				}

				file.on('statuschange', function(cur, prev) {
					if (prev === 'progress') {
						$prgress.hide().width(0);
					} else if (prev === 'queued') {
						$li.off('mouseenter mouseleave');
						$btns.remove();
					}

					// 成功
					if (cur === 'error' || cur === 'invalid') {
				/*		console.log(file.statusText);*/
						showError(file.statusText);
						percentages[file.id][1] = 1;
					} else if (cur === 'interrupt') {
						showError('interrupt');
					} else if (cur === 'queued') {
						percentages[file.id][1] = 0;
					} else if (cur === 'progress') {
						$info.remove();
						$prgress.css('display', 'block');
					} else if (cur === 'complete') {
						$li.append('<span class="success"></span>');
					}

					$li.removeClass('state-' + prev).addClass('state-' + cur);
				});

				$li.on('mouseenter', function() {
					$btns.stop().animate({
						height : 30
					});
				});

				$li.on('mouseleave', function() {
					$btns.stop().animate({
						height : 0
					});
				});

				$btns.on('click', 'span', function() {
					uploader.removeFile(file);
				});

				$li.appendTo($queue);
			}

			// 负责view的销毁
			function removeFile(file) {
				var $li = $('#' + file.id);

				delete percentages[file.id];
				updateTotalProgress();
				$li.off().find('.file-panel').off().end().remove();
			}

			function updateTotalProgress() {
				var loaded = 0, total = 0, spans = $progress.children(), percent;

				$.each(percentages, function(k, v) {
					total += v[0];
					loaded += v[0] * v[1];
				});

				percent = total ? loaded / total : 0;

				spans.eq(0).text(Math.round(percent * 100) + '%');
				spans.eq(1).css('width', Math.round(percent * 100) + '%');
				updateStatus();
			}

			function updateStatus() {
				var text = '', stats;

				if (state === 'ready') {
					text = '选中' + _this.fileCount + '张图片，共'
							+ WebUploader.formatSize(fileSize) + '。';
				} else if (state === 'confirm') {
					stats = uploader.getStats();
					if (stats.uploadFailNum) {
						text = '已成功上传'
								+ stats.successNum
								+ '张照片至XX相册，'
								+ stats.uploadFailNum
								+ '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
					}

				} else {
					stats = uploader.getStats();
					text = '共' + _this.fileCount + '张（'
							+ WebUploader.formatSize(fileSize) + '），已上传'
							+ stats.successNum + '张';

					if (stats.uploadFailNum) {
						text += '，失败' + stats.uploadFailNum + '张';
					}
				}

				$info.html(text);
			}

			function setState(val) {
				var file, stats;

				if (val === state) {
					return;
				}

				$upload.removeClass('state-' + state);
				$upload.addClass('state-' + val);
				state = val;

				switch (state) {
				case 'pedding':
					$placeHolder.removeClass('element-invisible');
					$queue.hide();
					$statusBar.addClass('element-invisible');
					uploader.refresh();
					break;

				case 'ready':
					$placeHolder.addClass('element-invisible');
					$('#filePicker2').removeClass('element-invisible');
					$queue.show();
					$statusBar.removeClass('element-invisible');
					uploader.refresh();
					break;

				case 'uploading':
					$('#filePicker2').addClass('element-invisible');
					$progress.show();
					$upload.text('暂停上传');
					break;

				case 'paused':
					$progress.show();
					$upload.text('继续上传');
					break;

				case 'confirm':
					$progress.hide();
					$('#filePicker2').removeClass('element-invisible');
					$upload.text('开始上传');

					stats = uploader.getStats();
					if (stats.successNum && !stats.uploadFailNum) {
						setState('finish');
						return;
					}
					break;
				case 'finish':
					stats = uploader.getStats();
					if (stats.successNum) {
						jSuccess('上传成功');
					} else {
						// 没有成功的图片，重设
						state = 'done';
						location.reload();
					}
					break;
				}

				updateStatus();
			}

			uploader.onUploadProgress = function(file, percentage) {
				var $li = $('#' + file.id), $percent = $li.find('.progress span');

				$percent.css('width', percentage * 100 + '%');
				percentages[file.id][1] = percentage;
				updateTotalProgress();
			};

			uploader.on('uploadSuccess', function(file, ret) {

				var $file = $('#' + file.id);
				try {
					console.info(ret);
					var responseText = (ret._raw || ret), 
					json = sy.str2json(responseText);
					console.info(responseText);
					console.info(json);
					if (json.state == 'SUCCESS') {
						_this.imageList.push(json);
						$file.append('<span class="success"></span>');
					} else {
						$file.find('.error').text(json.state).show();
					}
				} catch (e) {
					console.info(e);
					$file.find('.error').text('上传服务器出错').show();
				}
			});

			uploader.onFileQueued = function(file) {
				_this.fileCount++;
				fileSize += file.size;

				if (_this.fileCount === 1) {
					$placeHolder.addClass('element-invisible');
					$statusBar.show();
				}

				addFile(file);
				setState('ready');
				updateTotalProgress();
			};

			uploader.onFileDequeued = function(file) {
				_this.fileCount--;
				fileSize -= file.size;

				if (!_this.fileCount) {
					setState('pedding');
				}

				removeFile(file);
				updateTotalProgress();

			};

			uploader.on('all', function(type) {
				var stats;
				switch (type) {
				case 'uploadFinished':
					setState('confirm');
					break;

				case 'startUpload':
					setState('uploading');
					break;

				case 'stopUpload':
					setState('paused');
					break;

				}
			});

			uploader.onError = function(code) {
				jError('Eroor: ' + code);
			};

			$upload.on('click', function() {
				if ($(this).hasClass('disabled')) {
					return false;
				}

				if (state === 'ready') {
					console.info("开始上传");
			
					uploader.upload();
				} else if (state === 'paused') {
					uploader.upload();
				} else if (state === 'uploading') {
					uploader.stop();
				}
			});

			$info.on('click', '.retry', function() {
				uploader.retry();
			});

			$info.on('click', '.ignore', function() {
				alert('todo');
			});

			$upload.addClass('state-' + state);
			updateTotalProgress();
		},
	// 检测是否已经安装flash，检测flash的版本
	flashVersion : (function() {
		var version;

		try {
			version = navigator.plugins['Shockwave Flash'];
			version = version.description;
		} catch (ex) {
			try {
				version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
						.GetVariable('$version');
			} catch (ex2) {
				version = '0.0';
			}
		}
		version = version.match(/\d+/g);
		return parseFloat(version[0] + '.' + version[1], 10);
	})(),

	// 判断浏览器是否支持图片的base64
	isSupportBase64 : (function() {
		var data = new Image();
		var support = true;
		data.onload = data.onerror = function() {
			if (this.width != 1 || this.height != 1) {
				support = false;
			}
		}
		data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
		return support;
	})(),

	// 是否支持浏览器
	isSupportWebuploader : function($wrap) {

		if (!WebUploader.Uploader.support('flash')
				&& typeof (WebUploader.browser.ie) != 'undefined'
				&& WebUploader.browser.ie) {

			// flash 安装了但是版本过低。
			if (this.flashVersion) {
				(function(container) {
					window['expressinstallcallback'] = function(state) {
						switch (state) {
						case 'Download.Cancelled':
							alert('您取消了更新！')
							break;

						case 'Download.Failed':
							alert('安装失败')
							break;

						default:
							alert('安装已成功，请刷新！');
							break;
						}
						delete window['expressinstallcallback'];
					};

					var swf = './expressInstall.swf';
					// insert flash object
					var html = '<object type="application/'
							+ 'x-shockwave-flash" data="' + swf + '" ';

					if (WebUploader.browser.ie) {
						html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
					}

					html += 'width="100%" height="100%" style="outline:0">'
							+ '<param name="movie" value="'
							+ swf
							+ '" />'
							+ '<param name="wmode" value="transparent" />'
							+ '<param name="allowscriptaccess" value="always" />'
							+ '</object>';

					container.html(html);

				})($wrap);

				// 压根就没有安转。
			} else {
				$wrap
						.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
			}

			return true;
		} else if (!WebUploader.Uploader.support()) {
			alert('Web Uploader 不支持您的浏览器！');
			return false;
		}
		return true;
	},


	destroy : function() {
		this.$wrap.remove();
	},
	getInsertList : function() {
		var i, data, list = [];
		for (i = 0; i < this.imageList.length; i++) {
			data = this.imageList[i];
			list.push({
				src : data.url,
				_src : data.url,
				title : data.title,
				alt : data.original
			});
		}
		return list;
	},
	getInsertString : function() {
		var i, data, list = "";
		for (i = 0; i < this.imageList.length; i++) {
			data = this.imageList[i];
			list = data.url + "#" + list;
		}
		return list.substring(0, list.length - 1); 
	},//添加视图
	addView : function(target,url){
		var $li = $('<li id="'+url+'">' + '<p class="title">'
				+ url + '</p>' + '<p class="imgWrap"> <img src='+url+'>'+'</p>'
				+ '<p class="progress"><span></span></p>' + '</li>'),

		$btns = $(
				'<div class="file-panel">'
						+ '<span class="cancel">删除</span>').appendTo($li), $prgress = $li
				.find('p.progress span'), $wrap = $li.find('p.imgWrap'), $info = $('<p class="error"></p>');
	  
	  
		$li.on('mouseenter', function() {
			$btns.stop().animate({
				height : 30
			});
		}),_this=this;

		$li.on('mouseleave', function() {
			$btns.stop().animate({
				height : 0
			});
		});

		$btns.on('click', 'span', function() {   
			var i = 0;
			var obj=$(this).parent().parent();
			
		 
			object=obj.attr('id');
			for (; i < _this.list.length; i++) {
				if (_this.list[i] === object) {
					break;
				}
			}
			if (i < _this.list.length) {
				_this.list.splice(i, 1);
				obj.remove();   
				_this.fileCount-- ;
			} 
			
		/*	console.info(_this.list);*/
			
		}); 
		$li.appendTo($('#'+target));
	},
	//初始化  回显 图片
	initEcho:function(target,url){
		
	    this.list=[];
		if(url != null && url.length >0){
			this.list=url.split("#");
		}
		
		for(var i=0;i<this.list.length;i++){
			this.fileCount ++;
			this.addView(target,this.list[i]);
		}  
		//console.info(this.fileCount);
	},
	//返回list中剩余的对象
	getEchoInsertString : function() {
		var i,  temp = "";
		for (i = 0; i < this.list.length; i++) { 
			temp =  this.list[i] + "#" + temp;
		}
		return temp.substring(0, temp.length - 1); 
	}
} 

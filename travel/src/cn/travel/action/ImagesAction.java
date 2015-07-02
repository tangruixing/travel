package cn.travel.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Json;
import cn.model.PageBean;
import cn.travel.model.Images;
import cn.travel.service.ImagesService;
import cn.travel.service.SceneryService;

@Controller("imagesAction")
@Scope("prototype")
public class ImagesAction extends BaseAction<Images>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ImagesAction.class);

	
	@Resource(name="imagesService")
	private ImagesService imagesService;
	
	@Resource(name="sceneryService")
	private SceneryService sceneryService;
	
	private String areaName;

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/images_toIndex.do
	public String toIndex() {
		logger.info("Images_toIndex");
		return goUI("Images.jsp");//后台路径 /WEB-INF/back/images/Images.jsp
	}

	public String toPicIndex(){
		return goUI("Pics.jsp");
	}
	
	/**
	 * 景区/景点 LOGO 显示
	 */
	public String doSeceryList() {
		pageBean=sceneryService.getSceneryPageList(this.page,areaName);
		return goUI("listLogo.jsp");
	}
	
	
	
	/**
	 * 浏览指定 风景 图片 
	 * @return
	 */
	public String toListPicBySid(){
		
		pageBean=imagesService.getImagesListBySid(page,model.getSceId());
		
		return goUI("listPic.jsp");
	}
	
	
	/**
	 * 跳转到 风景 添加图片 的页面
	 * @return
	 */
	public String toAddPic(){
		
		return goUI("addPic.jsp");
	}
	

	/**
	 * 给指定 风景 添加图片
	 * @return
	 */
	public void doAddPic(){
		j=new Json();
		try {
			imagesService.saveEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		} catch (Exception e) {
			// TODO: handle exception
			j.setMsg("操作失败");
		}finally {
			write2Response(j);
		}
		
	}
	
/*	*//**
	 * 给指定 风景 添加图片
	 * @return
	 *//*
	public String doAddPic(){
		
		imagesService.saveEntity(this.model);
		return goAction("images_toIndex.do");
	}
	
*/	
	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.imagesService.batchImagesDelete(deleteIds);
			j.setSuccess(true);
			j.setMsg("删除成功");
		}catch(Exception e){
			j.setMsg("失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
		
		
		
	}

	
	/**
	 * 保存/更新操作
	 */
	public void doSaveOrUpdate() {
		
		j=new Json();
		try{			
			imagesService.saveOrUpdateEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}


	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	
	
	
	
	
}

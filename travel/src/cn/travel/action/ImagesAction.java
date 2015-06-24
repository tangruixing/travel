package cn.travel.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Json;
import cn.model.PageBean;
import cn.travel.model.Images;
import cn.travel.service.ImagesService;

@Controller("imagesAction")
@Scope("prototype")
public class ImagesAction extends BaseAction<Images>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ImagesAction.class);

	
	@Resource(name="imagesService")
	private ImagesService imagesService;
	
	private String pointName;
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

	/**
	 * 列表显示
	 */
	public String doSeceryList() {
		pageBean=imagesService.getSceneryPageList(this.page,pointName,areaName);
		return goUI("SceneryLogo.jsp");
	}
	
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

	public String getPointName() {
		return pointName;
	}

	public void setPointName(String pointName) {
		this.pointName = pointName;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	
	
	
	
	
	
}

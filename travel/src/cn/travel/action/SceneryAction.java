package cn.travel.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Scenery;
import cn.travel.service.SceneryService;

@Controller("sceneryAction")
@Scope("prototype")
public class SceneryAction extends BaseAction<Scenery>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SceneryAction.class);

	
	@Resource(name="sceneryService")
	private SceneryService sceneryService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/scenery_toIndex.do
	public String toIndex() {
		logger.info("Scenery_toIndex");
		return goUI("Scenery.jsp");//后台路径 /WEB-INF/back/scenery/Scenery.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=sceneryService.getSceneryGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.sceneryService.batchSceneryDelete(deleteIds);
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
			sceneryService.saveOrUpdateEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	
	
}

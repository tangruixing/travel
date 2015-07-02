package cn.travel.action;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Collect;
import cn.travel.service.CollectService;

@Controller("collectAction")
@Scope("prototype")
public class CollectAction extends BaseAction<Collect>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CollectAction.class);

	
	@Resource(name="collectService")
	private CollectService collectService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/collect_toIndex.do
	public String toIndex() {
		logger.info("Collect_toIndex");
		return goUI("Collect.jsp");//后台路径 /WEB-INF/back/collect/Collect.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=collectService.getCollectGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.collectService.batchCollectDelete(deleteIds);
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
	public void doSave() {
		
		j=new Json();
		try{
			model.setUser(this.loginUser);
			model.setCreatDate(new Date());
			collectService.saveCollect(this.model);
			
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	public String toPersonRouteList(){
		pageBean=collectService.getRoutePageList(page, 3, this.loginUser.getId());
		return goUI("personRouteList.jsp");
	}
	
	public void cancel(){
		j=new Json();
		try{
			collectService.batchCollectDelete(this.model.getId().toString());		
			j.setSuccess(true);
			j.setMsg("取消成功");
		}catch(Exception e){
			j.setMsg("取消失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
}

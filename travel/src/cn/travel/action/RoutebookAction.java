package cn.travel.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Routebook;
import cn.travel.model.User;
import cn.travel.service.RoutebookService;

@Controller("routebookAction")
@Scope("prototype")
public class RoutebookAction extends BaseAction<Routebook>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(RoutebookAction.class);

	
	@Resource(name="routebookService")
	private RoutebookService routebookService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/routebook_toIndex.do
	public String toIndex() {
		logger.info("Routebook_toIndex");
		return goUI("Routebook.jsp");//后台路径 /WEB-INF/back/routebook/Routebook.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=routebookService.getRoutebookGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.routebookService.batchRoutebookDelete(deleteIds);
			j.setSuccess(true);
			j.setMsg("删除成功");
		}catch(Exception e){
			j.setMsg("失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
		
		
		
	}

	
	/**
	 * 线路报名
	 */
	public void doSave() {
		
		j=new Json();
		try{
			this.model.setUser(this.loginUser);
			routebookService.saveRoombook(this.model);
			j.setSuccess(true);
			j.setMsg("报名成功");
		}catch(Exception e){
			j.setMsg("报名失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	public String toPersonList(){
		pageBean=routebookService.getRoutebookPageList(page, 2, this.loginUser.getId());
		return goUI("personList.jsp");
	}
	
	public void cancel(){
		j=new Json();
		try{
			routebookService.batchRoutebookDelete(model.getId().toString());
			j.setSuccess(true);
			j.setMsg("取消成功");
		}catch(Exception e){
			j.setMsg("取消失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
}

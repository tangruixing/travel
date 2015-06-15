package cn.travel.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Friendlink;
import cn.travel.service.FriendlinkService;

@Controller("friendlinkAction")
@Scope("prototype")
public class FriendlinkAction extends BaseAction<Friendlink>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FriendlinkAction.class);

	
	@Resource(name="friendlinkService")
	private FriendlinkService friendlinkService;

	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/friendlink_toIndex.do
	public String toIndex() {
		logger.info("Friendlink_toIndex");
		return goUI("Friendlink.jsp");//后台路径 /WEB-INF/back/friendlink/Friendlink.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=friendlinkService.getFriendlinkGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.friendlinkService.batchFriendlinkDelete(deleteIds);
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
			friendlinkService.saveOrUpdateEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}


	
}

package cn.travel.action;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Roomstyle;
import cn.travel.service.RoomstyleService;

@Controller("roomstyleAction")
@Scope("prototype")
public class RoomstyleAction extends BaseAction<Roomstyle>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(RoomstyleAction.class);

	
	@Resource(name="roomstyleService")
	private RoomstyleService roomstyleService;
	

	private String msg;

	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/roomstyle_toIndex.do
	public String toIndex() {
		logger.info("Roomstyle_toIndex");
		return goUI("Roomstyle.jsp");//后台路径 /WEB-INF/back/roomstyle/Roomstyle.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=roomstyleService.getRoomstyleGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.roomstyleService.batchRoomstyleDelete(deleteIds);
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
			roomstyleService.saveOrUpdateEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	
	
	
	/*普通方式*/
	/**
	 * 添加操作跳转
	 * @return
	 */
	public String toSave(){
		return goUI("save.jsp");
	}
	
	/**
	 * 修改操作跳转
	 * @return
	 */
	public String toUpdate(){
		Roomstyle r = roomstyleService.getEntity(model.getId());
		r.setHotId(model.getHotId());
		r.setHotname(model.getHotname());
		
		this.model=r;//更新 model
		return goUI("save.jsp");
	}
	/**
	 * 保存和更新
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String doSaveOrUpdateAction() throws UnsupportedEncodingException{
		
		roomstyleService.saveOrUpdateEntity(this.model);
		return goAction("roomstyle_toIndex.do?hotId=${hotId}&hotname=${hotname}");
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	
	
	
	
}

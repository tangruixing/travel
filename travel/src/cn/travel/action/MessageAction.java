package cn.travel.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Message;
import cn.travel.service.MessageService;

@Controller("messageAction")
@Scope("prototype")
public class MessageAction extends BaseAction<Message>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MessageAction.class);

	
	@Resource(name="messageService")
	private MessageService messageService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/message_toIndex.do
	public String toIndex() {
		logger.info("Message_toIndex");
		return goUI("Message.jsp");//后台路径 /WEB-INF/back/message/Message.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=messageService.getMessageGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.messageService.batchMessageDelete(deleteIds);
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
			messageService.saveOrUpdateEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	
	
}

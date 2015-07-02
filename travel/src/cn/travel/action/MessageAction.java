package cn.travel.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Constant;
import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Message;
import cn.travel.model.User;
import cn.travel.service.MessageService;
import cn.util.ConfigUtil;

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
	public void doSave() {
		
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
	
	
	/*普通方式*/
	/**
	 * 添加操作跳转
	 * @return
	 */
	public String toSave(){

		return goUI("adminReply.jsp");
	}
	
	/**
	 * 修改操作跳转
	 * @return
	 */
	public String toUpdate(){
		
		this.model=messageService.getEntity(model.getId());
		return goUI("save.jsp");
	}

	
	public String browseMsg(){
		User user=(User)this.session.get(ConfigUtil.loginUserKey);
		pageBean=messageService.lookMessagePageList(this.page,5, user);
		user.setMessage(0);
		this.session.put(ConfigUtil.loginUserKey, user);
		List<Message> list=pageBean.getRecordList();
		List newList=new ArrayList<Message>();
		for (int i = 0; i < list.size(); i++) {
			Message message=list.get(i);
			if(message.getAdmin()!=null){
				message.setAdminId(message.getAdmin().getId());				
			}
			newList.add(message);
		}
		pageBean.setRecordList(newList);
		return goUI("frontList.jsp");
	}
	
	public String addMsg(){
		User user=(User)this.session.get(ConfigUtil.loginUserKey);
		model.setUser(user);
		Date now = new Date(); 
		model.setCreateDate(now);
		model.setStats(Constant.MESSAGE_UNSTATUS);
		messageService.saveMsg(model,this.loginUser.getId());
		return goAction("message_goMsg.do");
	}
	
	public String goMsg(){
		return goUI("frontMessage.jsp");
	}
}

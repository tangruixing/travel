package cn.travel.action;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.User;
import cn.travel.service.UserService;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction<User>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserAction.class);

	
	@Resource(name="userService")
	private UserService userService;

	/**
	 * 修改密码
	 */
	private String oldPwd; //原密码
	private String newPwd; //新密码
	private String confirmPwd;//确认密码
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/user_toIndex.do
	public String toIndex() {
		logger.info("User_toIndex");
		return goUI("User.jsp");//后台路径 /WEB-INF/back/user/User.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=userService.getUserGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.userService.batchUserDelete(deleteIds);
			j.setSuccess(true);
			j.setMsg("删除成功");
		}catch(Exception e){
			j.setMsg("失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
		
		
		
	}

	
	/**
	 * 保存/更新操作(不包括修改用户名和密码)
	 */
	public void doSaveOrUpdate() {
		
		j=new Json();
		
		try{
			if(StringUtils.isEmpty(model.getPwd())){
				model.setPwd(DigestUtils.md5Hex("123456"));
			}
			userService.saveOrUpdateEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	/**
	 * 失去焦点触发
	 */
	public void checkOldPwd(){
		
		j=new Json();
		try {
			User user = userService.getEntity(this.loginUser.getId());
			oldPwd = DigestUtils.md5Hex(oldPwd);
			if(user.getPwd().equals(oldPwd)){
				j.setSuccess(true);
			}else{
				j.setMsg("原密码不正确");
			}
		} catch (Exception e) {
			j.setMsg("出错了："+e.getMessage());
		}finally{
			write2Response(j);
		}
		
	}
	
	
	/**
	 * 提交按钮触发
	 */
	public void eidtPassword(){
		
		j=new Json();
		try {
			if(!this.newPwd.equals(this.confirmPwd)){
				j.setMsg("两次密码不一致");
			}else{
				userService.editPassword(this.newPwd,this.loginUser.getId());
				j.setSuccess(true);				
			}
		} catch (Exception e) {
			j.setMsg("出错了："+e.getMessage());
		}finally{
			write2Response(j);
		}
		
	}
	

	

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
	
	
	
	
	
	
}

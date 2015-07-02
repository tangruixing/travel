package front.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.model.Json;
import cn.travel.action.BaseAction;
import cn.travel.model.User;
import cn.travel.service.UserService;
import cn.util.ConfigUtil;

@Controller("frontUserAction")
@Scope("prototype")
public class FrontUserAction extends BaseAction<User>{
	
	@Resource(name="userService")
	private UserService userService;
	private Map session = (Map)ActionContext.getContext().getSession();
	
	public void regist(){
		model.setRole(2);
		j=new Json();
		try{	
			String newPwd=DigestUtils.md5Hex(model.getPwd());
			model.setPwd(newPwd);
			model.setMessage(0);
			userService.saveEntity(this.model);
			j.setSuccess(true);
			j.setMsg("注册成功");
			session.put(ConfigUtil.loginUserKey, model);
		}catch(Exception e){
			j.setMsg("注册失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	public void registCheck(){
		j=new Json();
		try{
			User user=(User)userService.uniqueResult("from User where mobile = ?", model.getMobile()); 
			if(user!=null)
				j.setMsg("该号码已被使用");
			else
				j.setMsg("该号码可用");
			j.setSuccess(true);
		}catch(Exception e){
			j.setMsg("注册失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	public String logout(){
		this.removeSessionUser();
		return "toIndex";
		
	}
	
	/**
	 * 前台用户登录
	 */
	public void login(){
		j=new Json();
		try{
			User user = userService.login(model.getMobile(), model.getPwd());
			if(user!=null){
				session.put(ConfigUtil.loginUserKey, user);
				j.setMsg(user.getId().toString()+","+user.getRole());
				j.setSuccess(true);
			}else
				j.setSuccess(false);			
		}catch(Exception e){
			j.setMsg("注册失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
}

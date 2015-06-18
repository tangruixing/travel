package cn.travel.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Json;
import cn.travel.model.User;
import cn.travel.service.UserService;
import cn.util.ConfigUtil;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction<User>{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2220318253187928740L;

	@Resource(name="userService")
	private UserService userService;
	
	/**
	 * 到达后台登录页面
	 * @return
	 */
	public String toLogin(){
		
		return goUI("login.jsp");
	}
	
	/**
	 * 登录操作
	 */
	public void doLogin(){
		j=new Json();
		try {
			User u=userService.login(model.getMobile(),model.getPwd());
			session.put(ConfigUtil.loginUserKey, u);
			j.setSuccess(true);
			j.setMsg("欢迎使用福建旅游后台管理系统");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	/**
	 * 注销操作
	 */
	public void doLogout(){
		j=new Json();
		try {
			this.removeSessionUser();
			j.setSuccess(true);
			j.setMsg("您已成功退出本系统");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}finally{
			write2Response(j);
		}
	
	}
	
	
}

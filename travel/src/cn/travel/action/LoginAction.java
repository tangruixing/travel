package cn.travel.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.model.User;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction<User>{

	
	public String doLogin(){
		
		return goUI("main.jsp");
	}
}

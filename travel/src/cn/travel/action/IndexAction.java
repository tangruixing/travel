package cn.travel.action;

import org.apache.log4j.Logger;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Constant;
import cn.travel.model.User;

@Controller("indexAction")
@Scope("prototype")
public class IndexAction extends BaseAction<User>{
	/**
	* Logger for this class
	*/
	private static final Logger logger = Logger.getLogger(IndexAction.class);
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5916908355099698231L;

	public String toMain() throws Exception{
		if(loginUser.getRole()!=Constant.ROLE_SUPER&&loginUser.getRole()!=Constant.ROLE_ADMIN){
			logger.info("没有权限登录该系统");
			throw new Exception("没有权限登录该系统");
		}
		return goUI("main.jsp");
	}
}

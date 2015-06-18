package cn.travel.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.model.User;

@Controller("indexAction")
@Scope("prototype")
public class IndexAction extends BaseAction<User>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5916908355099698231L;

	public String toMain(){
		return goUI("main.jsp");
	}
}

package front.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.model.Json;
import cn.travel.action.BaseAction;
import cn.travel.model.User;
import cn.travel.service.UserService;

@Controller("frontUserAction")
@Scope("prototype")
public class FrontUserAction extends BaseAction<User>{
	
	@Resource(name="userService")
	private UserService userService;
	
	public void regist(){
		model.setRole(2);
		j=new Json();
		try{	
			userService.saveEntity(this.model);
			j.setSuccess(true);
			j.setMsg("success,注册成功");
			Map session = (Map)ActionContext.getContext().getSession();
			session.put("user", model);
		}catch(Exception e){
			j.setMsg("注册失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	public void registCheck(){
		j=new Json();
		try{	
			j.setSuccess(true);
			j.setMsg("该号码可用");
		}catch(Exception e){
			j.setMsg("注册失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
}

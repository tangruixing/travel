package cn.travel.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.Interceptor;

import cn.travel.action.BaseAction;
import cn.travel.action.LoginAction;
import cn.travel.action.UserAware;
import cn.travel.model.User;
import cn.util.ConfigUtil;
import front.action.FrontUserAction;

public class LoginInterceptor implements Interceptor{

	Logger log=Logger.getLogger(this.getClass());
	/**
	 * 
	 */
	private static final long serialVersionUID = -8105910702540607936L;

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init() {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("rawtypes")
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODbO Auto-generated method stub
		BaseAction action = (BaseAction) invocation.getAction();
		ActionProxy proxy = invocation.getProxy();
		
		log.info("拦截器拦截的ActionName:"+proxy.getActionName()+",Method:"+proxy.getMethod());
	/*	if(proxy.getActionName().startsWith("front")){//前台页面
			log.info("前台首页放行...");
			return invocation.invoke();
		}*/
		if(action instanceof LoginAction|| action instanceof FrontUserAction){
			log.info("直接放行..");
			return invocation.invoke();
		}else{
			HttpSession session = ServletActionContext.getRequest().getSession();
			User user = (User) session.getAttribute(ConfigUtil.loginUserKey);
			if(user!=null){
				//处理 user　注入
				if(action instanceof UserAware){
					((UserAware)action).setUser(user);
				}
				//log.info(JSON.toJSONStringWithDateFormat(user, "yy-MM-dd HH:mm:ss"));
				return invocation.invoke();
			}
			log.info("没有登录,跳转到登录页面....");
			return "toLogin";
		}
	}

}

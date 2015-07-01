package cn.travel.interceptor;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.Interceptor;

import cn.travel.action.BaseAction;

public class FrontLoginInteceptor implements Interceptor{


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
		
		log.info("前台拦截器拦截的ActionName:"+proxy.getActionName()+",Method:"+proxy.getMethod());
	/*	if(action instanceof FrontOrderAction){
			HttpSession session = ServletActionContext.getRequest().getSession();
			User user = (User) session.getAttribute(ConfigUtil.loginUserKey);
			if(user!=null){
				//处理 user　注入
				if(action instanceof UserAware){
					((UserAware)action).setUser(user);
				}
				//log.info(JSON.toJSONStringWithDateFormat(user, "yy-MM-dd HH:mm:ss"));
				return invocation.invoke();
			}else{
				// 得到登陆之前的地址
				String realPath = ServletActionContext.getRequest().getHeader("referer");
				session.setAttribute("url", realPath);
				log.info("没有登录,跳转到前台登录页面....");
				return "toFrontLogin";
			}
		
		}else{
			return invocation.invoke();
			
		}
		*/
		return invocation.invoke();
	}
}

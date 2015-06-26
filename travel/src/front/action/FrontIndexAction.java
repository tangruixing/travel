package front.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;

@Controller("frontIndexAction")
@Scope("prototype")
public class FrontIndexAction extends BaseAction{
	public String index(){
		return goUI("index.jsp");
	}
}

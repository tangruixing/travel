package front.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Message;

@Controller("frontMessageAction")
@Scope("prototype")
public class FrontMessageAction extends BaseAction<Message>{

	public String index(){
		return goUI("/front/message.jsp");
	}
}

package front.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Friendlink;
import cn.travel.service.FriendlinkService;

@Controller("frontFriendlinkAction")
@Scope("prototype")
public class FrontFriendlinkAction extends BaseAction<Friendlink>{
	@Resource(name="friendlinkService")
	private FriendlinkService friendlinkService;
	
	public String toIndexList(){
		pageBean=friendlinkService.getFriendlinkPageList(page, rows);
		return goUI("index_list.jsp");
	}
	
	public String toList(){
		pageBean=friendlinkService.getFriendlinkPageList(page, rows);
		return goUI("link_list.jsp");
	}
}

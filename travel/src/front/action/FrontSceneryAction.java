package front.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Scenery;
import cn.travel.service.SceneryService;

@Controller("frontSceneryAction")
@Scope("prototype")
public class FrontSceneryAction extends BaseAction<Scenery>{
	@Resource(name="sceneryService")
	private SceneryService sceneryService;
	/**
	 * 前台首页列表
	 * @return
	 */
	public String toIndexList(){
		
		pageBean=sceneryService.getSceneryPageList(this.page,this.rows);
		return goUI("index_list.jsp");
	}
}

package front.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Message;
import cn.travel.model.Scenery;
import cn.travel.service.SceneryService;

@Controller("frontSceneryAction")
@Scope("prototype")
public class FrontSceneryAction extends BaseAction<Scenery>{
	@Resource(name="sceneryService")
	private SceneryService sceneryService;
	
	private List<Scenery> hotList;
	public List<Scenery> getHotList() {
		return hotList;
	}

	public void setHotList(List<Scenery> hotList) {
		this.hotList = hotList;
	}

	/**
	 * 前台首页列表
	 * @return
	 */
	public String toIndexList(){
		
		pageBean=sceneryService.getSceneryPageList(this.page,this.rows);
		return goUI("index_list.jsp");
	}
	
	public String toList() {
		pageBean=sceneryService.getSceneryPageList(this.page,this.rows);
		List<Scenery> list=pageBean.getRecordList();		
		List newList=new ArrayList<Scenery>();
		for (int i = 0; i < list.size(); i++) {
			Scenery scenery=list.get(i);
			if(scenery.getScenery()==null)
				newList.add(scenery);
		}
		pageBean.setRecordList(newList);
		return goUI("list.jsp");
	}
	
	public String toHot() {
		hotList=sceneryService.getSceneryPageHot(page, rows).getRecordList();
		return goUI("hot.jsp");
	}
	
	public String toMore(){
		return goUI("index.jsp");
	}
	
	public String toDetail() {
		this.model =sceneryService.getEntity(this.model.getId());
		return goUI("detail.jsp");
	}
	
	public String toJingDianList(){
		
		return goUI("jingDianList.jsp");
	}
}

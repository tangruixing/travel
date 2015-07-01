package front.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Images;
import cn.travel.model.Message;
import cn.travel.model.Scenery;
import cn.travel.service.ImagesService;
import cn.travel.service.SceneryService;

@Controller("frontSceneryAction")
@Scope("prototype")
public class FrontSceneryAction extends BaseAction<Scenery>{
	@Resource(name="sceneryService")
	private SceneryService sceneryService;
	
	@Resource(name="imagesService")
	private ImagesService imagesService;
	
	private List<Scenery> sceneryList;
	

	public List<Scenery> getSceneryList() {
		return sceneryList;
	}

	public void setSceneryList(List<Scenery> sceneryList) {
		this.sceneryList = sceneryList;
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
		return goUI("list.jsp");
	}
	
	public String toHot() {
		sceneryList=sceneryService.getSceneryPageHot(page, rows).getRecordList();
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
		sceneryList=sceneryService.findEntityByHQL("from Scenery s where s.scenery.id=?",model.getId());
		return goUI("jingDianList.jsp");
	}
	
	public void findImg(){
		List<Images> list=imagesService.findEntityByHQL("from Images i where i.scenery.id=?", model.getId());
		Images img=null;
		for (int i = 0; i < list.size(); i++) {
			img=list.get(i);
			img.setImage(sc.getContextPath()+"/"+img.getImage());
		}
		write2Response(list);
	}
}

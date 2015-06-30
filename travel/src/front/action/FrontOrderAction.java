package front.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Collect;
import cn.travel.model.Roombook;
import cn.travel.model.Routebook;
import cn.travel.model.User;
import cn.travel.service.RouteService;

@Controller("frontOrderAction")
@Scope("prototype")
public class FrontOrderAction extends BaseAction<User>{

	@Resource
	private RouteService routeService;
	/**
	 * 路线报名
	 */
	private Routebook routebook;
	
	/**
	 * 房间预订
	 */
	private Roombook roombook;
	/**
	 * 收藏
	 */
	private Collect collect; 
	/**
	 * 报名路线
	 */
	public void doOrderRoute(){
	}
	/**
	 * 收藏路线
	 */
	public void doCollectRoute(){
		
	}
	/**
	 * 预定酒店
	 */
	public void doOrderHotel(){
		
	}
	public Routebook getRoutebook() {
		return routebook;
	}
	public void setRoutebook(Routebook routebook) {
		this.routebook = routebook;
	}
	public RouteService getRouteService() {
		return routeService;
	}
	public void setRouteService(RouteService routeService) {
		this.routeService = routeService;
	}
	public Roombook getRoombook() {
		return roombook;
	}
	public void setRoombook(Roombook roombook) {
		this.roombook = roombook;
	}
	public Collect getCollect() {
		return collect;
	}
	public void setCollect(Collect collect) {
		this.collect = collect;
	}
	
	
}

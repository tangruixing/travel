package front.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Json;
import cn.travel.action.BaseAction;
import cn.travel.model.Route;
import cn.travel.model.Routeplan;
import cn.travel.service.RouteService;
import cn.travel.service.RouteplanService;

@Controller("frontRouteAction")
@Scope("prototype")
public class FrontRouteAction extends BaseAction<Route> {

	@Resource(name = "routeService")
	private RouteService routeService;

	@Resource(name = "routeplanService")
	private RouteplanService routeplanService;
	
	
	private List<Route> hotList;

	
	private int rid;

	/**
	 * 去 旅游线路/自由行
	 * @return
	 */
	public String toIndex(){
		//routeType
		return goUI("index.jsp");
	}
	
	/**
	 * 路线列表
	 * 
	 * @return
	 */
	public String toList() {

		pageBean = routeService.getRoutePageList(this.page,this.rows,model);
		return goUI("list.jsp");
	}

	/**
	 * 热门列表
	 * 
	 * @return
	 */
	public String toHot() {
		hotList = routeService.getRoutePageHot(this.page, this.rows,model).getRecordList();
		return goUI("hot.jsp");
	}

	/**
	 * 详细页面
	 * 
	 * @return
	 */
	public String toDetail() {
		this.model = routeService.getRouteDetail(this.model.getId(),this.loginUser);
		return goUI("detail.jsp");
	}

	public List<Route> getHotList() {
		return hotList;
	}

	public void setHotList(List<Route> hotList) {
		this.hotList = hotList;
	}

	public void loadRouteplanWithRid() {

		j = new Json();
		try {
			List<Routeplan> list = routeplanService.loadRouteplanWithRid(rid);
			j.setObj(list);
			j.setSuccess(true);
			j.setMsg("操作成功");
		} catch (Exception e) {
			j.setMsg("操作失败：" + e.getMessage());
		} finally {
			write2Response(j);
		}
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}
	
	

}

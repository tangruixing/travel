package front.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Travels;
import cn.travel.service.TravelsService;

@Controller("frontTravelsAction")
@Scope("prototype")
public class FrontTravelsAction extends BaseAction<Travels>{
	@Resource(name="travelsService")
	private TravelsService travelsService;
	
	private List<Travels> travelsList;
	public List<Travels> getTravelsList() {
		return travelsList;
	}

	public void setTravelsList(List<Travels> travelsList) {
		this.travelsList = travelsList;
	}

	public String toIndex() {
		return goUI("index.jsp");
	}
	
	public String toList(){		
		pageBean=travelsService.getTravelsPageList(this.page,this.rows);
		return goUI("list.jsp");
	}
	
	public String toHot() {
		travelsList=travelsService.getTravelsPageHot(page, rows).getRecordList();
		return goUI("hot.jsp");
	}
	
	public String toDetail() {
		
		Travels travels=travelsService.getEntity(this.model.getId());
		this.model=travels;
		travels.setClick(model.getClick()+1);
		travelsService.updateEntity(travels);
		return goUI("detail.jsp");
	}
}

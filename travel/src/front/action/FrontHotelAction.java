package front.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.Hotel;
import cn.travel.service.HotelService;

@Controller("frontHotelAction")
@Scope("prototype")
public class FrontHotelAction extends BaseAction<Hotel>{

	
	@Resource(name="hotelService")
	private HotelService hotelService;
	/**
	 * 前台首页列表
	 * @return
	 */
	public String toIndexList(){
		
		pageBean=hotelService.getHotelPageList(this.page,this.rows,model);
		return goUI("index_list.jsp");
	}
	/**
	 * 更多页面
	 * @return
	 */
	public String toMore(){
		return goUI("more.jsp");
	}
	/**
	 * 更多列表页
	 * @return
	 */
	public String toMoreList(){
		pageBean=hotelService.getHotelPageList(page, rows,model);
		return goUI("more_list.jsp");
	}
	
	/**
	 * 酒店详细列表
	 * @return
	 */
	public String toDetail(){
		
		this.model=hotelService.getHotelDetail(this.model.getId());
		return goUI("detail.jsp");
	}
}

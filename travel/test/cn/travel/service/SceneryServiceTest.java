package cn.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.alibaba.fastjson.JSON;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Hotel;
import cn.travel.model.Roomstyle;
import cn.travel.model.Routeplan;
import cn.travel.model.Scenery;

public class SceneryServiceTest extends BaseSpringTest{

	@Resource(name="sceneryService")
	private SceneryService sceneryService;
	@Resource(name="routeplanService")
	private RouteplanService routeplanService;
	
	@Resource(name="roomstyleService")
	private RoomstyleService roomstyleService;
	
	@Resource(name="hotelService")
	private HotelService hotelService;
	
	@Resource(name="messageService")
	private MessageService messageService;
	
	@Test
	public void  getScenery(){
		List<Scenery> list = this.sceneryService.findEntityByHQL("from Scenery");
		logger.info(JSON.toJSON(list));
	}
	@Test
	public void  getRoutePlanByRid(){
		List<Routeplan> list = this.routeplanService.findEntityByHQL("from Routeplan r left outer join fetch r.scenery where r.route.id=?",1);
		logger.info(writeJsonByFilter(list, null, null));
	}
	@Test
	public void getRouteplanGrid(){
		Page p=new Page();
		p.setRows(10);
		p.setPage(1);
		Routeplan r=new Routeplan();
		r.setRouId(1);
		Grid grid = this.routeplanService.getRouteplanGrid(p, r);
		logger.info(writeJsonByFilter(grid, null, null));
	}
	
	@Test
	public void getRoomStyleById(){
		Roomstyle rs = roomstyleService.getEntity(1);
		logger.info(rs.getHotel().getId());
		logger.info(writeJsonByFilter(rs, null, null));
	}
	
	
	@Test
	public void getParentSceHql(){
		/*int parent=1;
		HqlHelper hql=new HqlHelper(Scenery.class, "u")//
				  .addWhereCondition(parent==1?"u.scenery.sceId is null":"u.scenery.sceId is not null");*/
		String hql="from Scenery s where s.scenery.id is null";
		List<Scenery> list = sceneryService.findEntityByHQL(hql);
		logger.info(writeJsonByFilter(list, null, null));
	}
	@Test
	public void getParentSceSql(){
		/*int parent=1;
		HqlHelper hql=new HqlHelper(Scenery.class, "u")//
				  .addWhereCondition(parent==1?"u.scenery.id is null":"u.scenery.id is not null");*/
		String sql="select * from scenery s where s.sceId is null";
		List<Scenery> list = sceneryService.findEntityBySQL(sql);
		logger.info(writeJsonByFilter(list, null, null));
	}
	
	@Test
	public void getHotelDetail(){
		int id=1;
		Hotel hotelDetail = this.hotelService.getHotelDetail(id);
		logger.info(JSON.toJSONString(hotelDetail));
	}
	
	@Test
	public void getMessageGrid(){
		
		Page p=new Page();
		p.setRows(10);
		p.setPage(1);
		Grid grid = this.messageService.getMessageGrid(p, null);
		
		logger.info(writeJsonByFilter(grid, null, null));
	}
}

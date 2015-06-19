package cn.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Routeplan;
import cn.travel.model.Scenery;

import com.alibaba.fastjson.JSON;

public class SceneryServiceTest extends BaseSpringTest{

	@Resource(name="sceneryService")
	private SceneryService sceneryService;
	@Resource(name="routeplanService")
	private RouteplanService routeplanService;
	
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
}

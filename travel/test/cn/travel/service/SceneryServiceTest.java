package cn.travel.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.alibaba.fastjson.JSON;

import cn.travel.model.Routeplan;
import cn.travel.model.Scenery;

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
}

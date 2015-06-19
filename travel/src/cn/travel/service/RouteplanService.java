package cn.travel.service;

import java.util.List;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Routeplan;

public interface RouteplanService extends BaseService<Routeplan>{


	Grid getRouteplanGrid(Page p, Routeplan model);

	void batchRouteplanDelete(String deleteIds);

	List<Routeplan> loadRouteplanWithRid(Integer rid);
	
}

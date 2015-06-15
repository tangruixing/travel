package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Route;

public interface RouteService extends BaseService<Route>{


	Grid getRouteGrid(Page p, Route model);

	void batchRouteDelete(String deleteIds);
	
}

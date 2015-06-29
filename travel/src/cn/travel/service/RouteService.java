package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Route;

public interface RouteService extends BaseService<Route>{


	
	Grid getRouteGrid(Page p, Route model);

	void batchRouteDelete(String deleteIds);

	/**
	 * 前台 旅游线/自由行 列表展示
	 * @param page
	 * @param rows
	 * @param model
	 * @return
	 */
	PageBean getRoutePageList(int page, int rows, Route model);

	/**
	 * 前台  旅游线/自由行 热门展示
	 * @param page
	 * @param rows
	 * @param model
	 * @return
	 */
	PageBean getRoutePageHot(int page, int rows,Route model);
	
}

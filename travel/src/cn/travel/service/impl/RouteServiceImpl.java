
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Route;
import cn.travel.service.RouteService;
import cn.util.HqlHelper;

@Service("routeService")
public class RouteServiceImpl extends BaseServiceImpl<Route> implements RouteService{

	@Resource(name="routeDao")
	public void setDao(BaseDao dao) {
		// TODO Auto-generated method stub
		super.setDao(dao);
		
	}
	
	/**
	 * 如果涉及多表操作 spring 注入 dao
	 */
	/*
	@Resource(name="newsDao")
	private NewsDao newsDao;
	*/

	public Grid getRouteGrid(Page p, Route model) {
		
		HqlHelper hql=new HqlHelper(Route.class, "u")//
					  .addWhereCondition("u.routeType=?", model.getRouteType())//c
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchRouteDelete(String deleteIds) {
		
		String hql="delete from Route u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

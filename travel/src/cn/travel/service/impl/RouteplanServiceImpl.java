
package cn.travel.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Routeplan;
import cn.travel.service.RouteplanService;
import cn.util.HqlHelper;
import cn.util.ValidateUtil;

@Service("routeplanService")
public class RouteplanServiceImpl extends BaseServiceImpl<Routeplan> implements RouteplanService{

	@Resource(name="routeplanDao")
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

	public Grid getRouteplanGrid(Page p, Routeplan model) {
		
		HqlHelper hql=new HqlHelper(Routeplan.class, "u")//
					  .addWhereCondition("u.route.id=?", model.getRouId())//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		Grid grid=this.getPageGrid(p.getPage(), p.getRows(), hql);
		
		List<Routeplan> rows = grid.getRows();
		Routeplan r=null;
		for (int i = 0; i < rows.size(); i++) {
			r = rows.get(i);
			r.setSceId(r.getRoute().getId());
		}
		return grid;
}

	
	public void batchRouteplanDelete(String deleteIds) {
		
		String hql="delete from Routeplan u where u.id in ("+deleteIds+")";
		
		this.dao.batchEntityByHQL(hql);
	}

	public List<Routeplan> loadRouteplanWithRid(Integer rid) {
		
		List<Routeplan> list = this.findEntityByHQL("from Routeplan r left outer join fetch r.scenery where r.route.id=?",rid);
		
		return ValidateUtil.isValid(list)?list:null;
	}
	
	
	
	
	
	
}

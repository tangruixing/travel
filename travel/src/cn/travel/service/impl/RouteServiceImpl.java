
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Constant;
import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.dao.CollectDao;
import cn.travel.model.Collect;
import cn.travel.model.Route;
import cn.travel.model.User;
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
	
	@Resource(name="collectDao")
	private CollectDao collectDao;

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

	public PageBean getRoutePageList(int page, int rows, Route model) {
		HqlHelper hql=new HqlHelper(Route.class, "u")//
					.addWhereCondition(StringUtils.isNotEmpty(model.getRealName()), "u.realName like '%"+model.getRealName()+"%'")//
					.addWhereCondition("u.routeType=?", model.getRouteType());
		return this.getPageBean(page, rows, hql);
	}

	public PageBean getRoutePageHot(int page, int rows,Route model) {
		HqlHelper hql=new HqlHelper(Route.class, "u")//
					.addWhereCondition("u.routeType=?", model.getRouteType())//
					.addWhereCondition("u.hot=true");
		return this.getPageBean(page, rows, hql);
	}

	public Route getRouteDetail(Integer id, User loginUser) {
		Route model = this.getEntity(id);
		
		//自由行：登录用户是否已收藏
		if(loginUser!=null&&model.getRouteType()==Constant.ROUTER_NOPAY){
			Collect col = this.collectDao.canCollect(loginUser.getId(),model.getId());
			if(col!=null){//已经收藏
				model.setCanCollect(false);
			}
		}
		
		return model;
	}
	
	
	
}

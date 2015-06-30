
package cn.travel.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.dao.RouteDao;
import cn.travel.model.Route;
import cn.travel.model.Routebook;
import cn.travel.service.RouteService;
import cn.travel.service.RoutebookService;
import cn.util.HqlHelper;

@Service("routebookService")
public class RoutebookServiceImpl extends BaseServiceImpl<Routebook> implements RoutebookService{

	@Resource(name="routebookDao")
	public void setDao(BaseDao dao) {
		// TODO Auto-generated method stub
		super.setDao(dao);
		
	}
	
	@Resource(name="routeDao")
	private RouteDao routeDao;
	
	/**
	 * 如果涉及多表操作 spring 注入 dao
	 */
	/*
	@Resource(name="newsDao")
	private NewsDao newsDao;
	*/

	public Grid getRoutebookGrid(Page p, Routebook model) {
		
		HqlHelper hql=new HqlHelper(Routebook.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchRoutebookDelete(String deleteIds) {
		
		String hql="delete from Routebook u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}

	public void saveRoombook(Routebook model) throws Exception {
	
		Route route = routeDao.getEntity(model.getRouId());
		
		if(new Date().getTime()>route.getRegDate().getTime()){
			throw new Exception("无法报名,已经超过活动报名时间");
		}
		
		
		int updateNum=route.getNumPeople()-model.getPeopleNum();
		if(updateNum<0){
			throw new Exception("无法报名,已经没有剩余名额可以预定");
		}
		
		route.setNumPeople(updateNum);
		
		this.routeDao.updateEntity(route);
		
		model.setRoute(route);
		model.setTotalPrice(model.getPeopleNum()*route.getMoney());
		
		this.dao.saveEntity(model);
		
	}
	
	
	
}

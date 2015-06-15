
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Scenery;
import cn.travel.service.SceneryService;
import cn.util.HqlHelper;

@Service("sceneryService")
public class SceneryServiceImpl extends BaseServiceImpl<Scenery> implements SceneryService{

	@Resource(name="sceneryDao")
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

	public Grid getSceneryGrid(Page p, Scenery model) {
		
		HqlHelper hql=new HqlHelper(Scenery.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchSceneryDelete(String deleteIds) {
		
		String hql="delete from Scenery u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

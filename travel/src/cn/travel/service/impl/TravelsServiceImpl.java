
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Travels;
import cn.travel.service.TravelsService;
import cn.util.HqlHelper;

@Service("travelsService")
public class TravelsServiceImpl extends BaseServiceImpl<Travels> implements TravelsService{

	@Resource(name="travelsDao")
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

	public Grid getTravelsGrid(Page p, Travels model) {
		
		HqlHelper hql=new HqlHelper(Travels.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchTravelsDelete(String deleteIds) {
		
		String hql="delete from Travels u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

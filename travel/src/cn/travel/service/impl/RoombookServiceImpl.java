
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Roombook;
import cn.travel.service.RoombookService;
import cn.util.HqlHelper;

@Service("roombookService")
public class RoombookServiceImpl extends BaseServiceImpl<Roombook> implements RoombookService{

	@Resource(name="roombookDao")
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

	public Grid getRoombookGrid(Page p, Roombook model) {
		
		HqlHelper hql=new HqlHelper(Roombook.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchRoombookDelete(String deleteIds) {
		
		String hql="delete from Roombook u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

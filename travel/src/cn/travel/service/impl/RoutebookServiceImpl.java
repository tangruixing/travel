
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Routebook;
import cn.travel.service.RoutebookService;
import cn.util.HqlHelper;

@Service("routebookService")
public class RoutebookServiceImpl extends BaseServiceImpl<Routebook> implements RoutebookService{

	@Resource(name="routebookDao")
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

	public Grid getRoutebookGrid(Page p, Routebook model) {
		
		HqlHelper hql=new HqlHelper(Routebook.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchRoutebookDelete(String deleteIds) {
		
		String hql="delete from Routebook u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

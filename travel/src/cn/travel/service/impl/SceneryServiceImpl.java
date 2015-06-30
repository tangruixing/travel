
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Constant;
import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.model.Hotel;
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

	public Grid getSceneryGrid(Page p, Scenery model,int type) {
		
		HqlHelper hql=new HqlHelper(Scenery.class, "u")//
					  .addWhereCondition(type==Constant.SCENERY_PARENT,"u.scenery.id is null")//景区
					  .addWhereCondition(type==Constant.SCENERY_CHILD,"u.scenery.id is not null")//景点
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchSceneryDelete(String deleteIds) {
		
		String hql="delete from Scenery u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	public PageBean getSceneryPageList(int page, String pointName,
			String areaName) {
		HqlHelper hql=new HqlHelper(Scenery.class, "s")//
					 .addWhereCondition(StringUtils.isNotBlank(pointName),"s.realName=?", pointName);
/*					 .addWhereCondition(StringUtils.isNotBlank(areaName),"s.realName", params)*/
		
		return this.getPageBean(page, 4,hql);
	}
	
	public PageBean getSceneryPageList(int page, int rows) {
		HqlHelper hql=new HqlHelper(Scenery.class, "s");		
		return this.getPageBean(page,rows,hql);
	}
	
	public PageBean getSceneryPageHot(int page, int rows){
		HqlHelper hql=new HqlHelper(Scenery.class, "s")
				.addWhereCondition("s.suggest=true");
		return this.getPageBean(page,rows,hql);
	}
}


package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.dao.ImagesDao;
import cn.travel.dao.SceneryDao;
import cn.travel.model.Images;
import cn.travel.model.Scenery;
import cn.travel.service.ImagesService;
import cn.util.HqlHelper;

@Service("imagesService")
public class ImagesServiceImpl extends BaseServiceImpl<Images> implements ImagesService{

	@Resource(name="imagesDao")
	public void setDao(BaseDao dao) {
		// TODO Auto-generated method stub
		super.setDao(dao);
		
	}
	
	@Resource(name="sceneryDao")
	private SceneryDao sceneryDao;
	
	/**
	 * 如果涉及多表操作 spring 注入 dao
	 */
	/*
	@Resource(name="newsDao")
	private NewsDao newsDao;
	*/

	public Grid getImagesGrid(Page p, Images model) {
		
		HqlHelper hql=new HqlHelper(Images.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchImagesDelete(String deleteIds) {
		
		String hql="delete from Images u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}

	public PageBean getSceneryPageList(int page, String pointName,
			String areaName) {
		HqlHelper hql=new HqlHelper(Scenery.class, "s")//
					 .addWhereCondition(StringUtils.isNotBlank(pointName),"s.realName=?", pointName);
/*					 .addWhereCondition(StringUtils.isNotBlank(areaName),"s.realName", params)*/
		
		return sceneryDao.getPageBean(page, hql);
	}
	
	
	
}

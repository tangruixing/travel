
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.model.News;
import cn.travel.model.Scenery;
import cn.travel.service.NewsService;
import cn.util.HqlHelper;

@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService{

	@Resource(name="newsDao")
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

	public Grid getNewsGrid(Page p, News model) {
		
		HqlHelper hql=new HqlHelper(News.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchNewsDelete(String deleteIds) {
		
		String hql="delete from News u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	public PageBean getNewsPageList(int page, int rows) {
		HqlHelper hql=new HqlHelper(News.class, "n")
				.addOrderByProperty("n.publicTime",false);	
		return this.getPageBean(page,rows,hql);
	}
	
	public PageBean getNewsPageHot(int page, int rows){
		HqlHelper hql=new HqlHelper(News.class, "n")
				.addWhereCondition("n.hot=true");
		return this.getPageBean(page,rows,hql);
	}
}

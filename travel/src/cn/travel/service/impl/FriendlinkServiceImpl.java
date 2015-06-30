
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.model.Friendlink;
import cn.travel.service.FriendlinkService;
import cn.util.HqlHelper;

@Service("friendlinkService")
public class FriendlinkServiceImpl extends BaseServiceImpl<Friendlink> implements FriendlinkService{

	@Resource(name="friendlinkDao")
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

	public Grid getFriendlinkGrid(Page p, Friendlink model) {
		
		HqlHelper hql=new HqlHelper(Friendlink.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}
	
	public PageBean getFriendlinkPageList(int page, int rows) {
		HqlHelper hql=new HqlHelper(Friendlink.class, "f");
		
		return this.getPageBean(page,rows,hql);
	}
	
	public void batchFriendlinkDelete(String deleteIds) {
		
		String hql="delete from Friendlink u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

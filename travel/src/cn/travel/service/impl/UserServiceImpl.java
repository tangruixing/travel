
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.User;
import cn.travel.service.UserService;
import cn.util.HqlHelper;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Resource(name="userDao")
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

	public Grid getUserGrid(Page p, User model) {
		
		HqlHelper hql=new HqlHelper(User.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchUserDelete(String deleteIds) {
		
		String hql="delete from User u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}
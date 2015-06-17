
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
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

	public User login(String mobile, String pwd) throws Exception {
		// TODO Auto-generated method stub
		
		pwd=DigestUtils.md5Hex(pwd);
		
		String hql="from User u where u.mobile=? and u.pwd=?";
		User user = (User) this.uniqueResult(hql, mobile,pwd);
		if(user==null){
			throw new Exception("用户名密码错误");
		}else{
			return user;
		}
	}

	public void editPassword(String newPwd) {
		newPwd=DigestUtils.md5Hex(newPwd);
		String hql="update User u where u.pwd=?";
		this.batchEntityByHQL(hql, newPwd);
	}

	
	
	
	
	
}

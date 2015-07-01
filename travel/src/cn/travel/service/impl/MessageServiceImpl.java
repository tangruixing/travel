
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.model.Message;
import cn.travel.model.User;
import cn.travel.service.MessageService;
import cn.travel.service.UserService;
import cn.util.HqlHelper;

@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService{

	@Resource(name="messageDao")
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
	
	@Resource(name="userService")
	private UserService userService;

	public Grid getMessageGrid(Page p, Message model) {
		
	/*	HqlHelper hql=new HqlHelper(Message.class, "u")// 0：用户没有问题  1：留言未回复 2：已回复留言
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());*/
		
		HqlHelper hql=new HqlHelper(User.class,"u")//
				   .addWhereCondition("u.id =(select m.user.id from Message m order by m.createDate asc)")//
				  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return userService.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchMessageDelete(String deleteIds) {
		
		String hql="delete from Message u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	public PageBean getMessagePageList(int page, int rows, User model) {
		
		HqlHelper hql=new HqlHelper(Message.class,"m")//
					.addWhereCondition("m.user.id=?", model.getId())
					.addOrderByProperty("m.createDate",false);
		
		return this.getPageBean(page, rows, hql);
	}
	
}


package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.dao.UserDao;
import cn.travel.model.Message;
import cn.travel.model.User;
import cn.travel.service.MessageService;
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

	
	@Resource(name="userDao")
	private UserDao userDao;

	public Grid getMessageGrid(Page p, Message model) {
		
	/*	HqlHelper hql=new HqlHelper(Message.class, "u")// 0：用户没有问题  1：留言未回复 2：已回复留言
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());*/
		
		HqlHelper hql=new HqlHelper(User.class,"u")//
				   .addWhereCondition("u.message=1")//
				  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return userDao.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchMessageDelete(String deleteIds) {
		
		String hql="delete from Message u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	

	public PageBean lookMessagePageList(int page, int rows, User model) {

		if(model.getMessage()==2){
			userDao.batchEntityByHQL("update User u set u.message=0 where u.id=?", model.getId());			
		}
		HqlHelper hql=new HqlHelper(Message.class,"m")//
					.addWhereCondition("m.user.id=?", model.getId())
					.addOrderByProperty("m.createDate",false);		
		return this.getPageBean(page, rows, hql);
	}

	public void saveMsg(Message model,Integer id) {
		// TODO Auto-generated method stub
		dao.saveEntity(model);
		userDao.batchEntityByHQL("update User u set u.message=1 where u.id=?", id);
	}


	public PageBean adminLookMessageList(int page, int rows,Message model) {
		HqlHelper hql=new HqlHelper(Message.class,"m")//
				.addWhereCondition("m.user.id=?", model.getUserId())
				.addOrderByProperty("m.createDate",false);		
		return this.getPageBean(page,rows,hql);
	}


	public void adminReply(Message model) {
		
		Integer userId = model.getUserId();
		userDao.batchEntityByHQL("update User u set u.message=2 where u.id=?",userId);
		this.saveEntity(model);
	}
	
	
	
}

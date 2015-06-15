
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Comment;
import cn.travel.service.CommentService;
import cn.util.HqlHelper;

@Service("commentService")
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService{

	@Resource(name="commentDao")
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

	public Grid getCommentGrid(Page p, Comment model) {
		
		HqlHelper hql=new HqlHelper(Comment.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchCommentDelete(String deleteIds) {
		
		String hql="delete from Comment u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

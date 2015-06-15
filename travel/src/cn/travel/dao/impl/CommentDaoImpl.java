package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.CommentDao;
import cn.travel.model.Comment;

@Repository("commentDao")
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao{

}

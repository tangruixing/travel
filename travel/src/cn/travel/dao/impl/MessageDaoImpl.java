package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.MessageDao;
import cn.travel.model.Message;

@Repository("messageDao")
public class MessageDaoImpl extends BaseDaoImpl<Message> implements MessageDao{

}

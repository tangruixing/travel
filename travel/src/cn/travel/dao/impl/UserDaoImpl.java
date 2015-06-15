package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.UserDao;
import cn.travel.model.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

}

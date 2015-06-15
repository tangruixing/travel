package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.RoutebookDao;
import cn.travel.model.Routebook;

@Repository("routebookDao")
public class RoutebookDaoImpl extends BaseDaoImpl<Routebook> implements RoutebookDao{

}

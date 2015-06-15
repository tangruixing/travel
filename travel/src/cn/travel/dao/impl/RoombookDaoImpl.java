package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.RoombookDao;
import cn.travel.model.Roombook;

@Repository("roombookDao")
public class RoombookDaoImpl extends BaseDaoImpl<Roombook> implements RoombookDao{

}

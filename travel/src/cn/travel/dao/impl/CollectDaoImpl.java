package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.CollectDao;
import cn.travel.model.Collect;

@Repository("collectDao")
public class CollectDaoImpl extends BaseDaoImpl<Collect> implements CollectDao{

}

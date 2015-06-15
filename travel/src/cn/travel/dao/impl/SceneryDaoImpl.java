package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.SceneryDao;
import cn.travel.model.Scenery;

@Repository("sceneryDao")
public class SceneryDaoImpl extends BaseDaoImpl<Scenery> implements SceneryDao{

}

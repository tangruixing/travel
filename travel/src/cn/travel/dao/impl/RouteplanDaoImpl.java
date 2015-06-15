package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.RouteplanDao;
import cn.travel.model.Routeplan;

@Repository("routeplanDao")
public class RouteplanDaoImpl extends BaseDaoImpl<Routeplan> implements RouteplanDao{

}

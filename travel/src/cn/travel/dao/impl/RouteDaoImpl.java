package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.RouteDao;
import cn.travel.model.Route;

@Repository("routeDao")
public class RouteDaoImpl extends BaseDaoImpl<Route> implements RouteDao{

}

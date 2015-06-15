package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.TravelsDao;
import cn.travel.model.Travels;

@Repository("travelsDao")
public class TravelsDaoImpl extends BaseDaoImpl<Travels> implements TravelsDao{

}

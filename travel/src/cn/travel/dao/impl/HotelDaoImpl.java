package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.HotelDao;
import cn.travel.model.Hotel;

@Repository("hotelDao")
public class HotelDaoImpl extends BaseDaoImpl<Hotel> implements HotelDao{

}

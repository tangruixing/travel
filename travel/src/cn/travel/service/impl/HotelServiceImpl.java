
package cn.travel.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.model.Hotel;
import cn.travel.service.HotelService;
import cn.util.HqlHelper;
import cn.util.ValidateUtil;

@Service("hotelService")
public class HotelServiceImpl extends BaseServiceImpl<Hotel> implements HotelService{

	@Resource(name="hotelDao")
	public void setDao(BaseDao dao) {
		// TODO Auto-generated method stub
		super.setDao(dao);
		
	}
	
	/**
	 * 如果涉及多表操作 spring 注入 dao
	 */
	/*
	@Resource(name="newsDao")
	private NewsDao newsDao;
	*/

	public Grid getHotelGrid(Page p, Hotel model) {
		
		HqlHelper hql=new HqlHelper(Hotel.class, "u")
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchHotelDelete(String deleteIds) {
		
		String hql="delete from Hotel u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}

	public PageBean getHotelPageList(int page, int rows,Hotel model) {
		HqlHelper hql=new HqlHelper(Hotel.class, "s")//
					  .addWhereCondition(StringUtils.isNotEmpty(model.getRealName()), "s.realName like '%"+model.getRealName()+"%'");
		
		return this.getPageBean(page,rows,hql);
	}

	public Hotel getHotelDetail(Integer id) {
		
		String hql="from Hotel h left outer join fetch h.roomstyles  where h.id=?";
		List<Hotel> hotelList = this.findEntityByHQL(hql, id);
		return ValidateUtil.isValid(hotelList)?hotelList.get(0):null;
	}
	
	
}

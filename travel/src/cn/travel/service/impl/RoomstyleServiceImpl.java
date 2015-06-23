
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.model.Roomstyle;
import cn.travel.service.RoomstyleService;
import cn.util.HqlHelper;

@Service("roomstyleService")
public class RoomstyleServiceImpl extends BaseServiceImpl<Roomstyle> implements RoomstyleService{

	@Resource(name="roomstyleDao")
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

	public Grid getRoomstyleGrid(Page p, Roomstyle model) {
		
		HqlHelper hql=new HqlHelper(Roomstyle.class, "u")//
					  .addWhereCondition("u.hotel.id=?", model.getHotId())//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchRoomstyleDelete(String deleteIds) {
		
		String hql="delete from Roomstyle u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}
	
	
	
}

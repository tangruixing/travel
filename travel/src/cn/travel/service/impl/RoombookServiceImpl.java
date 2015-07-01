
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.dao.RoomstyleDao;
import cn.travel.model.Roombook;
import cn.travel.model.Roomstyle;
import cn.travel.service.RoombookService;
import cn.util.HqlHelper;

@Service("roombookService")
public class RoombookServiceImpl extends BaseServiceImpl<Roombook> implements RoombookService{

	@Resource(name="roombookDao")
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
	
	@Resource(name="roomstyleDao")
	private RoomstyleDao roomstyleDao;

	public Grid getRoombookGrid(Page p, Roombook model) {
		
		HqlHelper hql=new HqlHelper(Roombook.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchRoombookDelete(String deleteIds) {
		
		String hql="delete from Roombook u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}

	public void saveRoombook(Roombook model) throws Exception {
		
		//房型
		Roomstyle roomstyle = this.roomstyleDao.getEntity(model.getRooId());
		roomstyle.getId();
		
		int updateRoomNum=roomstyle.getNumber()-model.getRoomNum();
		
		if(updateRoomNum<0){
			throw new Exception("没用空房间了");
		}
		
		int totalPeopleNum=roomstyle.getLimitPerson()*model.getRoomNum();

		if(model.getPeopleNum()>totalPeopleNum){
			throw new Exception("入住人数超过允许最大人数("+totalPeopleNum+")");
		}
		
		
		roomstyle.setNumber(updateRoomNum);
		
		
		
		model.setMoney(model.getRoomNum()*model.getDay()*roomstyle.getPrice());
		
		this.roomstyleDao.updateEntity(roomstyle);
		
		this.saveEntity(model);
		
	}
	
	
	
}

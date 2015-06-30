
package cn.travel.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.dao.BaseDao;
import cn.travel.dao.CollectDao;
import cn.travel.model.Collect;
import cn.travel.service.CollectService;
import cn.util.HqlHelper;

@Service("collectService")
public class CollectServiceImpl extends BaseServiceImpl<Collect> implements CollectService{

	@Resource(name="collectDao")
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

	public Grid getCollectGrid(Page p, Collect model) {
		
		HqlHelper hql=new HqlHelper(Collect.class, "u")//
					  .addOrderByProperty(StringUtils.isNotBlank(p.getSort()),p.getSort(),p.getOrder());
		
		return this.getPageGrid(p.getPage(), p.getRows(), hql);
	}

	
	public void batchCollectDelete(String deleteIds) {
		
		String hql="delete from Collect u where u.id in ("+deleteIds+") ";
		
		this.dao.batchEntityByHQL(hql);
	}

	public void saveCollect(Collect model) throws Exception {
		// TODO Auto-generated method stub
		Collect collect = ((CollectDao)this.dao).canCollect(model.getUser().getId(), model.getRouId());
		if(collect!=null){
			throw new Exception("已经收藏过了,请不要再次收藏");
		}
		this.dao.saveEntity(model);
	}
	
	
	
}

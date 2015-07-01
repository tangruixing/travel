package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.CollectDao;
import cn.travel.model.Collect;

@Repository("collectDao")
public class CollectDaoImpl extends BaseDaoImpl<Collect> implements CollectDao{

	public Collect canCollect(Integer userid, Integer rid) {
		// TODO Auto-generated method stub
		String hql="from Collect c where c.user.id=? and c.route.id=?";
		return (Collect) this.uniqueResult(hql, userid,rid);
	}

}

package cn.travel.dao;

import cn.travel.model.Collect;

public interface CollectDao extends BaseDao<Collect>{

	Collect canCollect(Integer userid, Integer rid);

}

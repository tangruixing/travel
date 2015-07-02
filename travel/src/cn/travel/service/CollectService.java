package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Collect;

public interface CollectService extends BaseService<Collect>{


	Grid getCollectGrid(Page p, Collect model);

	void batchCollectDelete(String deleteIds);

	void saveCollect(Collect model) throws Exception;

	PageBean getRoutePageList(int page, int i, Integer id);
	
}

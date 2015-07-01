package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Routebook;

public interface RoutebookService extends BaseService<Routebook>{


	Grid getRoutebookGrid(Page p, Routebook model);

	void batchRoutebookDelete(String deleteIds);

	void saveRoombook(Routebook model) throws Exception;
	
}

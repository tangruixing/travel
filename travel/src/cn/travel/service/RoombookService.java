package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Roombook;

public interface RoombookService extends BaseService<Roombook>{


	Grid getRoombookGrid(Page p, Roombook model);

	void batchRoombookDelete(String deleteIds);
	
}

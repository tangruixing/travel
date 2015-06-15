package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Travels;

public interface TravelsService extends BaseService<Travels>{


	Grid getTravelsGrid(Page p, Travels model);

	void batchTravelsDelete(String deleteIds);
	
}

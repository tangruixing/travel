package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Hotel;

public interface HotelService extends BaseService<Hotel>{


	Grid getHotelGrid(Page p, Hotel model);

	void batchHotelDelete(String deleteIds);
	
}

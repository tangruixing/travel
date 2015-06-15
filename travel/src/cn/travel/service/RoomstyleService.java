package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Roomstyle;

public interface RoomstyleService extends BaseService<Roomstyle>{


	Grid getRoomstyleGrid(Page p, Roomstyle model);

	void batchRoomstyleDelete(String deleteIds);
	
}

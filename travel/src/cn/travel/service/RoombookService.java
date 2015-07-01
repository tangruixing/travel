package cn.travel.service;

import java.util.Date;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Roombook;

public interface RoombookService extends BaseService<Roombook>{


	Grid getRoombookGrid(Page p, Roombook model);

	void batchRoombookDelete(String deleteIds);

	void saveRoombook(Roombook model) throws Exception;
	
	PageBean getRoombookPageListed(int page, int rows, Date now,Integer id);
	PageBean getUnRoombookPageList(int page, int rows, Date now,Integer id);
}

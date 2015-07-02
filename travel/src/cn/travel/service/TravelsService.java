package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Travels;

public interface TravelsService extends BaseService<Travels>{


	Grid getTravelsGrid(Page p, Travels model);

	void batchTravelsDelete(String deleteIds);
	PageBean getTravelsPageList(int page, int rows);
	PageBean getTravelsPageHot(int page, int rows);

	PageBean getTravelsPageList(int page, int i, Integer id);
}

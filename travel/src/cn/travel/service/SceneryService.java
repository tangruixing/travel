package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Scenery;

public interface SceneryService extends BaseService<Scenery>{


	Grid getSceneryGrid(Page p, Scenery model);

	void batchSceneryDelete(String deleteIds);

	PageBean getSceneryPageList(int page, String pointName, String areaName);
	
}

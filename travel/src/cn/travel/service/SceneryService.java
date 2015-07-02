package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Scenery;

public interface SceneryService extends BaseService<Scenery>{


	Grid getSceneryGrid(Page p, Scenery model,int type);

	void batchSceneryDelete(String deleteIds);

	PageBean getSceneryPageList(int page,String areaName);
	
	PageBean getSceneryPageList(int page, int rows);
	
	PageBean getSceneryPageHot(int page, int rows);
	
}

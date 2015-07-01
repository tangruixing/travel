package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.News;

public interface NewsService extends BaseService<News>{


	Grid getNewsGrid(Page p, News model);

	void batchNewsDelete(String deleteIds);
	PageBean getNewsPageList(int page, int rows);
	PageBean getNewsPageHot(int page, int rows);
}

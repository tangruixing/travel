package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.News;

public interface NewsService extends BaseService<News>{


	Grid getNewsGrid(Page p, News model);

	void batchNewsDelete(String deleteIds);
	
}

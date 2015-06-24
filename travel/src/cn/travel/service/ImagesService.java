package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Images;

public interface ImagesService extends BaseService<Images>{


	Grid getImagesGrid(Page p, Images model);

	void batchImagesDelete(String deleteIds);

	PageBean getImagesListBySid(int page,Integer sid);
	
}

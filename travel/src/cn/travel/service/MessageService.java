package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Message;

public interface MessageService extends BaseService<Message>{


	Grid getMessageGrid(Page p, Message model);

	void batchMessageDelete(String deleteIds);
	
}

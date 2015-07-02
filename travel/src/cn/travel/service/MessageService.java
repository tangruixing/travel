package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.model.PageBean;
import cn.travel.model.Message;
import cn.travel.model.User;

public interface MessageService extends BaseService<Message>{


	Grid getMessageGrid(Page p, Message model);

	void batchMessageDelete(String deleteIds);
	PageBean lookMessagePageList(int page, int rows, User model);

	void saveMsg(Message model, Integer id);

	PageBean adminLookMessageList(int page, int rows, Message model);

	void adminReply(Message model);
}

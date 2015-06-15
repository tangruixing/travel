package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.User;

public interface UserService extends BaseService<User>{


	Grid getUserGrid(Page p, User model);

	void batchUserDelete(String deleteIds);
	
}

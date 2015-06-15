package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Friendlink;

public interface FriendlinkService extends BaseService<Friendlink>{


	Grid getFriendlinkGrid(Page p, Friendlink model);

	void batchFriendlinkDelete(String deleteIds);
	
}

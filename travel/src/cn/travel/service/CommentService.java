package cn.travel.service;

import cn.model.Grid;
import cn.model.Page;
import cn.travel.model.Comment;

public interface CommentService extends BaseService<Comment>{


	Grid getCommentGrid(Page p, Comment model);

	void batchCommentDelete(String deleteIds);
	
}

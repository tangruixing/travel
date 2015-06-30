package front.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.News;
import cn.travel.service.NewsService;

@Controller("frontNewsAction")
@Scope("prototype")
public class FrontNewsAction extends BaseAction<News>{
	@Resource(name="newsService")
	private NewsService newsService;
	
public String toIndexList(){
		
		pageBean=newsService.getNewsPageList(this.page,this.rows);
		return goUI("index_list.jsp");
	}
}

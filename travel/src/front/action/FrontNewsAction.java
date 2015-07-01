package front.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.travel.action.BaseAction;
import cn.travel.model.News;
import cn.travel.model.Scenery;
import cn.travel.service.NewsService;

@Controller("frontNewsAction")
@Scope("prototype")
public class FrontNewsAction extends BaseAction<News>{
	@Resource(name="newsService")
	private NewsService newsService;
	
	private List<News> newsList;
	
	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	public String toIndexList(){
		
		pageBean=newsService.getNewsPageList(this.page,this.rows);
		return goUI("index_list.jsp");
	}
	
	public String toList(){		
		pageBean=newsService.getNewsPageList(this.page,this.rows);
		return goUI("list.jsp");
	}
	
	public String toMore(){
		return goUI("index.jsp");
	}
	
	public String toHot() {
		newsList=newsService.getNewsPageHot(page, rows).getRecordList();
		return goUI("hot.jsp");
	}
	
	public String toDetail() {
		
		News news=newsService.getEntity(this.model.getId());
		this.model=news;
		news.setClick(model.getClick()+1);
		newsService.updateEntity(news);
		return goUI("detail.jsp");
	}
}

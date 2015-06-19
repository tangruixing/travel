package cn.travel.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.model.Grid;
import cn.model.Json;
import cn.travel.model.Routeplan;
import cn.travel.service.RouteplanService;

@Controller("routeplanAction")
@Scope("prototype")
public class RouteplanAction extends BaseAction<Routeplan>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(RouteplanAction.class);

	
	@Resource(name="routeplanService")
	private RouteplanService routeplanService;
	
	/**
	 * 路线id
	 */
	private Integer rid;
	/**
	 * 线路名字
	 */
	private String rname;
	/**
	 * 
	 */
	private static final long serialVersionUID = -210663201283533496L;

	//访问路径：http://../travel/routeplan_toIndex.do
	public String toIndex() {
		logger.info("Routeplan_toIndex");
		return goUI("Routeplan.jsp");//后台路径 /WEB-INF/back/routeplan/Routeplan.jsp
	}

	/**
	 * 列表显示
	 */
	public void doList() {
		Grid grid=routeplanService.getRouteplanGrid(p,model);
		write2Response(grid);
		
	}

	/**
	 * 删除操作
	 */
	public void doDeletes() {
		
		j=new Json();
		try{			
			this.routeplanService.batchRouteplanDelete(deleteIds);
			j.setSuccess(true);
			j.setMsg("删除成功");
		}catch(Exception e){
			j.setMsg("失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
		
		
		
	}

	
	/**
	 * 保存/更新操作
	 */
	public void doSaveOrUpdate() {
		
		j=new Json();
		try{		
			/*if(this.model.getSceId()==null){
				String name = this.model.getSceneryName();
				this.model.setSceId((Integer.parseInt(name)));
			}*/
			routeplanService.saveOrUpdateEntity(this.model);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}
	
	
	public void loadRouteplanWithRid(){
		
		j=new Json();
		try{			
			List<Routeplan> list=routeplanService.loadRouteplanWithRid(rid);
			j.setObj(list);
			j.setSuccess(true);
			j.setMsg("操作成功");
		}catch(Exception e){
			j.setMsg("操作失败："+e.getMessage());
		}finally{
			write2Response(j);
		}
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	
	
	
	
	
}

package cn.travel.action;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import cn.model.Json;
import cn.model.Page;
import cn.travel.model.User;
import cn.util.ConfigUtil;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 抽象 action 的超类，专门用于继承
 * @author always
 *
 * @param <T>
 */

@SuppressWarnings("unchecked")
public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>,Preparable,ServletResponseAware,SessionAware{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(BaseAction.class);

	/**
	 * 
	 */
	private static final long serialVersionUID = -7929921984913691177L;

	/**
	 * 模型驱动
	 */
	protected T model;
	/**
	 * 返回json
	 */
	protected Json j;
	
	/**
	 * 返回jsp页面
	 */
	protected String resultUI;
	
	/**
	 * 查询关键字
	 */
	protected String searchKey;
	

	/**
	 * easyui 列表相关查询参数
	 */
	protected int page = 1;// 当前页
	protected int rows = 10;// 每页显示记录数
	protected String sort;// 排序字段
	protected String order = "asc";// asc/desc
	protected Page p=new Page();
	
	protected String deleteIds;
	
	protected HttpServletResponse response;


	protected Map<String, Object> session;
	
	public BaseAction(){
		try {
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class<T> modelClass = (Class<T>) type.getActualTypeArguments()[0];
			if(model==null){
				model=modelClass.newInstance();
				logger.info("实例化一个模型:"+modelClass.getSimpleName());
			}else{
				logger.info("复用一个模型驱动:"+modelClass.getSimpleName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	}
	
	public void prepare() throws Exception {
		
	}
	
	protected String goUI(String resultUI){
		
		this.resultUI=resultUI;
		
		return "goUI";
	}
	
	protected void write2Response(Object obj){
		try{
			String str=JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd HH:mm:ss");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(str);
			response.getWriter().flush(); 
		}catch(IOException e){
			logger.info("json 返回异常:"+e.getMessage());
		}finally{
			try {
				response.getWriter().close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

	public  T getModel(){
		return model;
	}

	public Json getJ() {
		return j;
	}

	public void setJ(Json j) {
		this.j = j;
	}

	public String getResultUI() {
		return resultUI;
	}

	public void setResultUI(String resultUI) {
		this.resultUI = resultUI;
	}

	public void setServletResponse(HttpServletResponse response) {
		
		this.response=response;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		p.setPage(this.page);
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
		p.setRows(this.rows);
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
		if(StringUtils.isNotBlank(this.sort)){
			p.setSort(this.sort);			
		}
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
		p.setOrder(this.order);
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setModel(T model) {
		this.model = model;
	}

	public Page getP() {
		return p;
	}

	public void setP(Page p) {
		this.p = p;
	}

	public String getDeleteIds() {
		return deleteIds;
	}

	public void setDeleteIds(String deleteIds) {
		this.deleteIds = deleteIds;
	}

	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	
	public User getSessionUser(){
		 Object obj = session.get(ConfigUtil.loginUserKey);
		 if(obj!=null){
			 return (User)obj;
		 }
		 return null;
	}
	
	public void removeSessionUser(){

		 if(this.getSessionUser()==null){
			 return;			 
		 }
		 session.remove(ConfigUtil.loginUserKey);
	}
	
	public int getSessionUserId(){
		return this.getSessionUser().getId();
	}
	
	public int getSessionUserRole(){
		return this.getSessionUser().getRole();
	}
	
	

	
	
}

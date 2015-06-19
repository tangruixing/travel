package cn.travel.action;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import cn.model.Json;
import cn.model.Page;
import cn.travel.model.User;
import cn.util.ConfigUtil;
import cn.util.FastjsonFilter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
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
public abstract class BaseAction<T> extends ActionSupport 
		implements	ModelDriven<T>,Preparable,
					ServletResponseAware,SessionAware,ServletContextAware,ServletRequestAware,
					UserAware{
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
	protected ServletContext sc;


	protected Map<String, Object> session;

	/**
	 * 通过登录拦截器注入
	 */
	protected User loginUser;

	private String resultAction;

	private String namespaceAction;

	private HttpServletRequest request;

	
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
	
	
	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @param includesProperties
	 *            需要转换的属性
	 * @param excludesProperties
	 *            不需要转换的属性
	 */
	public void writeJsonByFilter(Object object, String[] includesProperties, String[] excludesProperties) {
		try {
			FastjsonFilter filter = new FastjsonFilter();// excludes优先于includes
			if (excludesProperties != null && excludesProperties.length > 0) {
				filter.getExcludes().addAll(Arrays.<String> asList(excludesProperties));
			}
			if (includesProperties != null && includesProperties.length > 0) {
				filter.getIncludes().addAll(Arrays.<String> asList(includesProperties));
			}
			logger.info("对象转JSON：要排除的属性[" + excludesProperties + "]要包含的属性[" + includesProperties + "]");
			String json;
			String User_Agent = request.getHeader("User-Agent");
			if (StringUtils.indexOfIgnoreCase(User_Agent, "MSIE 6") > -1) {
				// 使用SerializerFeature.BrowserCompatible特性会把所有的中文都会序列化为\\uXXXX这种格式，字节数会多一些，但是能兼容IE6
				json = JSON.toJSONString(object, filter, SerializerFeature.WriteDateUseDateFormat, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.BrowserCompatible);
			} else {
				// 使用SerializerFeature.WriteDateUseDateFormat特性来序列化日期格式的类型为yyyy-MM-dd hh24:mi:ss
				// 使用SerializerFeature.DisableCircularReferenceDetect特性关闭引用检测和生成
				json = JSON.toJSONString(object, filter, SerializerFeature.WriteDateUseDateFormat, SerializerFeature.DisableCircularReferenceDetect);
			}
			logger.info("转换后的JSON字符串：" + json);
			getResponse().setContentType("text/html;charset=utf-8");
			getResponse().getWriter().write(json);
			getResponse().getWriter().flush();
			getResponse().getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public void writeJson(Object object) {
		writeJsonByFilter(object, null, null);
	}

	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @param includesProperties
	 *            需要转换的属性
	 */
	public void writeJsonByIncludesProperties(Object object, String[] includesProperties) {
		writeJsonByFilter(object, includesProperties, null);
	}
	
	
	
	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @throws IOException
	 */
	protected void write2Response(Object object){
		writeJsonByFilter(object, null, null);
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
	
	

	
	public void removeSessionUser(){

		 if(this.loginUser==null){
			 return;			 
		 }
		 session.remove(ConfigUtil.loginUserKey);
	}

	public void setUser(User user) {
		this.loginUser=user;
	}
	
	public String goAction(String resultAction){
		return this.goAction("/", resultAction);
	}
	
	public String goAction(String namespaceAction,String resultAction){
		
		this.namespaceAction=namespaceAction;
		this.resultAction=resultAction;
		return "goAction";
	}

	public String getResultAction() {
		return resultAction;
	}

	public void setResultAction(String resultAction) {
		this.resultAction = resultAction;
	}

	public String getNamespaceAction() {
		return namespaceAction;
	}

	public void setNamespaceAction(String namespaceAction) {
		this.namespaceAction = namespaceAction;
	}

	public void setServletContext(ServletContext sc) {
		// TODO Auto-generated method stub
		this.sc=sc;
	}

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	
	
	
	

	
	
}

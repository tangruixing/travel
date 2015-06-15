package cn.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

/**
 * 用于辅助生成HQL语句和参数列�?
 * @author Always
 *
 */
public class HqlHelper {

	private String fromCase;
	private String whereCase="";
	private String orderByCase="";
	private String limitCase="";
	
	private String alias;
	private List<Object> parameters=new ArrayList<Object>();//参数列表
	
	/**
	 * 
	 * @param clazz  类名
	 * @param alias  别名
	 */
	public HqlHelper(Class clazz,String alias){
		this.alias=alias;
		fromCase=" From " +clazz.getSimpleName()+" "+alias;
	}
	
	public HqlHelper(Class clazz,String alias,String leftJoins){
		this.alias=alias;
		if(StringUtils.isNotEmpty(leftJoins)){
			fromCase=" From " +clazz.getSimpleName()+" "+alias+" "+leftJoins;
		}else{
			fromCase=" From " +clazz.getSimpleName()+" "+alias;
		}
		
	}
	
	/**
	 * 拼接Where子句
	 * @param condition
	 * @param params
	 */
	public HqlHelper addWhereCondition(String condition,Object... params){
		//whereClause +="AND"+condition
		if(whereCase.length()==0){
			whereCase=" WHERE "+condition;
		}else{
			whereCase+=" AND "+condition;
		}
		
		if(params!=null && params.length>0){
			for(Object param:params){
				this.parameters.add(param);
			}
		}
		
		return this;
	}
	/**
	 * 如果第一参数为true，拼接Where子句
	 * @param append
	 * @param condition
	 * @param params
	 */
	public HqlHelper addWhereCondition(boolean append,String condition,Object... params){
		//whereClause +="AND"+condition
		if(append){
			addWhereCondition(condition, params);;
		}
		return this;
	}
	
	
	/**
	 * 拼接Orderby子句
	 * @param propertyName
	 * @param isAsc
	 */
	public HqlHelper addOrderByProperty(String propertyName,boolean isAsc){
		if(orderByCase.length()==0){
			orderByCase=" ORDER BY "+propertyName+(isAsc ?" ASC ":" DESC ");
		}else{
			orderByCase+=", "+propertyName+(isAsc ?" ASC ":" DESC ");
		}
		
		return this;
	}
	/**
	 * 拼接Orderby子句
	 * @param sort
	 * 			order by sort order
	 * @param order
	 */
	public HqlHelper addOrderByProperty(String sort,String order){
		if(orderByCase.length()==0){
			orderByCase=" ORDER BY "+sort+" "+order;
		}else{
			orderByCase+=", "+sort+" "+order;
		}
		
		return this;
	}
	
	/**
	 *  如果第一参数为true，拼接Orderby子句
	 * @param append
	 * @param propertyName
	 * @param isAsc
	 */
	public HqlHelper addOrderByProperty(boolean append,String propertyName,boolean isAsc){
		if(append){			
			addOrderByProperty(propertyName, isAsc);
		}
		return this;
	}
	/**
	 *  
	 * @param append
	 * 			参数为true，拼接Orderby子句
	 * @param sort
	 * 			要排序的字段
	 * @param order
	 * 			按照�?么排�?
	 */
	public HqlHelper addOrderByProperty(boolean append,String sort,String order){
		if(append){			
			addOrderByProperty(sort, order);
		}
		return this;
	}
	/**
	 * 拼接limit语句
	 * @param limitString
	 * @return
	 */
	public HqlHelper addLimit(String limitString){
		
		limitCase=" "+limitString;
		return this;
	}
	
	/**
	 * 获取查询数据列表的HQL语句
	 * @return
	 */
	public String getQueryListHql(){
		return " SELECT DISTINCT "+this.alias+fromCase+whereCase+orderByCase+limitCase;
	}
	/**
	 * 获取查询总记录数的HQL语句
	 * @return
	 */
	public String getQueryCountHql(){
		return "SELECT DISTINCT COUNT(*) "+ fromCase+whereCase;
	}

	public List<Object> getParameters() {
		return parameters;
	}
	
	
}

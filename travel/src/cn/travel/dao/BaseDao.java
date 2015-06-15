package cn.travel.dao;


import java.util.List;

import cn.model.Grid;
import cn.model.PageBean;
import cn.util.HqlHelper;

/**
 * dao 接口
 * @author always
 *
 * @param <T>
 */
public interface BaseDao<T> {
	/**
	 * 保存实体
	 * @param t
	 */
	public void saveEntity(T t);
	/**
	 * 更新实体
	 * @param t
	 */
	public void updateEntity(T t);
	/**
	 * 保存或者更新实体
	 * @param t
	 */
	public void saveOrUpdateEntity(T t);
	/**
	 * 删除实体
	 * @param t
	 */
	public void deleteEntity(T t);
	/**
	 * 按照hql语句批处理实体
	 * @param hql
	 * @param objects
	 */
	public void batchEntityByHQL(String hql,Object ...objects);
	
	public void batchEntityBySQL(String sql,Object...objects);
	/**
	 * 
	 * @param id
	 * @return
	 * 		  2,找不到：返回null
	 */
	public T getEntity(Integer id);
	/**
	 * 
	 * @param id
	 * @return
	 * 		1,代理对象 2,找不到：抛出异常
	 */
	public T loadEntity(Integer id);
	/**
	 * 
	 * @param hql
	 * @param objects
	 * @return
	 */
	public List<T> findEntityByHQL(String hql,Object ...objects);
	
	/**
	 * 
	 * @param hql
	 * @param objects
	 * @return
	 * 		the single result or null
	 */
	public Object uniqueResult(String hql,Object ...objects);
	
	/**
	 * 
	 * @param sql
	 * @param objects
	 * @return
	 */
	public List<T> findEntityBySQL(String sql, Object ...objects);
	
	/**
	 * 
	 * @param start
	 * @param hqlHelper
	 * @return
	 */
	public PageBean getPageBean(int currentPage, HqlHelper hqlHelper);
	
	/**
	 * 
	 * @param pageSize
	 * @param start
	 * @param hqlHelper
	 * @return
	 */
	public PageBean getPageBean(int pageSize,int currentPage, HqlHelper hqlHelper);
	
	/**
	 * 
	 * @param page
	 * 		当前页
	 * @param rows
	 * 		每页记录数
	 * @param hqlHelper
	 * 	
	 * @return
	 */
	public Grid getPageGrid(int page,int rows,HqlHelper hqlHelper);
	
	
}

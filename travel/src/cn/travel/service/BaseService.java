package cn.travel.service;

import java.util.List;

import cn.model.Grid;
import cn.model.PageBean;
import cn.util.HqlHelper;

public interface BaseService<T> {
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
	 * @param start 起始记录数
	 * @param hqlHelper
	 * @return
	 */
	public PageBean getPageBean(int start, HqlHelper hqlHelper);
	
	public PageBean getPageBean(int pageSize,int start, HqlHelper hqlHelper);
	
	public Grid getPageGrid(int page,int rows,HqlHelper hqlHelper);
	
}

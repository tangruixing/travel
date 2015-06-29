package cn.travel.service.impl;

import java.util.List;

import javax.annotation.Resource;

import cn.model.Grid;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.travel.service.BaseService;
import cn.util.HqlHelper;

/**
 * 抽象 service 实现，用于继承
 * @author always
 *
 * @param <T>
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	
	protected BaseDao<T> dao;
	
	
	/**
	 *	按名称注入：方法名-->dao
	 *	按类型：参数类型-->BaseDao-->找到4个 不唯一 抛异常
	 *			解决办法。重写注解 
	 */
	@Resource
	public void setDao(BaseDao dao){
		this.dao=dao;
	}
	
	public void saveEntity(T t) {
		
		this.dao.saveEntity(t);
	}

	public void updateEntity(T t) {
		
		this.dao.updateEntity(t);
	}

	public void saveOrUpdateEntity(T t) {
		
		this.dao.saveOrUpdateEntity(t);
	}

	public void deleteEntity(T t) {
		
		dao.deleteEntity(t);
	}

	public void batchEntityByHQL(String hql, Object... objects) {
		
		dao.batchEntityByHQL(hql, objects);
	}
	
	

	public List<T> findEntityBySQL(String sql, Object... objects) {
		// TODO Auto-generated method stub
		return dao.findEntityBySQL(sql, objects);
	}

	public T getEntity(Integer id) {
		
		return dao.getEntity(id);
	}

	public T loadEntity(Integer id) {
		
		return dao.loadEntity(id);
	}

	public List<T> findEntityByHQL(String hql, Object... objects) {
		
		return dao.findEntityByHQL(hql, objects);
	}

	public Object uniqueResult(String hql, Object... objects) {
		
		return dao.uniqueResult(hql, objects);
	}

	public PageBean getPageBean(int currentPage, HqlHelper hqlHelper) {
		return dao.getPageBean(currentPage, hqlHelper);
	}

	public PageBean getPageBean(int currentPage, int pageSize, HqlHelper hqlHelper) {
		return dao.getPageBean(currentPage, pageSize, hqlHelper);
	}

	public Grid getPageGrid(int page, int rows, HqlHelper hqlHelper) {
		// TODO Auto-generated method stub
		return dao.getPageGrid(page, rows, hqlHelper);
	}

	
	
}

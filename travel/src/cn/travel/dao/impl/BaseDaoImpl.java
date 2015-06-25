package cn.travel.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import cn.model.Grid;
import cn.model.PageBean;
import cn.travel.dao.BaseDao;
import cn.util.ConfigUtil;
import cn.util.HqlHelper;

/**
 * dao 基类实现
 * @author always
 *
 * @param <T>
 */
@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T> implements BaseDao<T>{

	
	@Resource(name="sessionFactory")
	private SessionFactory sf;
	private Class<T> clazz;

	public BaseDaoImpl(){
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class<T>) type.getActualTypeArguments()[0];
		System.out.println("clazz:"+clazz+",实际type:"+type.getActualTypeArguments()+",泛型："+type);
	}
	
	public void saveEntity(T t) {
		
		sf.getCurrentSession().save(t);
	}

	public void updateEntity(T t) {
		
		sf.getCurrentSession().update(t);
	}

	public void saveOrUpdateEntity(T t) {
		
		sf.getCurrentSession().saveOrUpdate(t);
	}

	public void deleteEntity(T t) {
		
		sf.getCurrentSession().delete(t);
	}

	public void batchEntityByHQL(String hql, Object... objects) {
		
		Query query = sf.getCurrentSession().createQuery(hql);
		int len=objects.length;
		for(int i=0;i<len;i++){
			query.setParameter(i, objects[i]);
		}
		query.executeUpdate();
	}

	public void batchEntityBySQL(String sql,Object...objects){
		
		Query query=sf.getCurrentSession().createSQLQuery(sql);
		int len=objects.length;
		for(int i=0;i<len;i++){
			query.setParameter(i, objects[i]);
		}
		query.executeUpdate();
	}
	
	public T getEntity(Integer id) {
		
		//在超类中得到每个子类所制定的泛型
		return (T) sf.getCurrentSession().get(clazz, id);
	}

	public T loadEntity(Integer id) {
		
		return (T) sf.getCurrentSession().load(clazz, id);
	}

	public List<T> findEntityByHQL(String hql, Object... objects) {
		Query query = sf.getCurrentSession().createQuery(hql);
		int len=objects.length;
		for(int i=0;i<len;i++){
			query.setParameter(i, objects[i]);
		}
		return query.list();
	}

	public Object uniqueResult(String hql, Object... objects) {
		
		Query query = sf.getCurrentSession().createQuery(hql);
		int len=objects.length;
		for(int i=0;i<len;i++){
			query.setParameter(i, objects[i]);
		}
		return query.uniqueResult();
	}

	public List<T> findEntityBySQL(String sql, Object... objects) {
		Query query = sf.getCurrentSession().createSQLQuery(sql);
		int len=objects.length;
		for(int i=0;i<len;i++){
			query.setParameter(i, objects[i]);
		}
		return query.list();
	}

	
	public PageBean getPageBean(int currentPage, HqlHelper hqlHelper) {
		int pageSize = Integer.parseInt(ConfigUtil.get("pageSize"));
		return this.getPageBean(currentPage,pageSize , hqlHelper);
	}

	public PageBean getPageBean(int currentPage,int pageSize, HqlHelper hqlHelper) {
		System.out.println("----->新的分页方法");
		List<Object> parameters = hqlHelper.getParameters();
		// 查询数据总记录数
		Query countQuery = sf.getCurrentSession().createQuery(
				hqlHelper.getQueryCountHql());// 生成查询对象
		for (int i = 0; i < parameters.size(); i++) {// 设置参数
			countQuery.setParameter(i, parameters.get(i));
		}

		int recordCount = ((Long) countQuery.uniqueResult())//
				.intValue();

		// 查询数据列表
		Query listQuery = sf.getCurrentSession().createQuery(// 生成查询对象
				hqlHelper.getQueryListHql());
		
		for (int i = 0; i < parameters.size(); i++) {// 设置参数
			listQuery.setParameter(i, parameters.get(i));
		}
		
		
		
		List recordList = listQuery
				.setFirstResult((currentPage - 1) * pageSize)// (pageNum-1)*pageSize+1-1
				.setMaxResults(pageSize).list();
		
		return new PageBean(currentPage, pageSize, recordList, recordCount);
	}

	
	public Grid getPageGrid(int page, int rows, HqlHelper hqlHelper) {
		System.out.println("easyui分页方法");
		List<Object> parameters = hqlHelper.getParameters();
		// 查询数据总记录数
		Query countQuery = sf.getCurrentSession().createQuery(
				hqlHelper.getQueryCountHql());// 生成查询对象
		for (int i = 0; i < parameters.size(); i++) {// 设置参数
			countQuery.setParameter(i, parameters.get(i));
		}

		long total = (Long) countQuery.uniqueResult();

		// 查询数据列表
		Query listQuery = sf.getCurrentSession().createQuery(// 生成查询对象
				hqlHelper.getQueryListHql());
		
		for (int i = 0; i < parameters.size(); i++) {// 设置参数
			listQuery.setParameter(i, parameters.get(i));
		}
		
		
		
		List recordList = listQuery
				.setFirstResult((page - 1) * rows)// (pageNum-1)*pageSize+1-1
				.setMaxResults(rows).list();
		
		return new Grid(total, recordList);
	}

	
	
	
	
}

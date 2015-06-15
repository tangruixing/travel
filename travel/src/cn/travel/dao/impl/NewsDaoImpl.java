package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.NewsDao;
import cn.travel.model.News;

@Repository("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<News> implements NewsDao{

}

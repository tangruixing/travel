package cn.travel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.travel.dao.ImagesDao;
import cn.travel.model.Images;

@Repository("imagesDao")
public class ImagesDaoImpl extends BaseDaoImpl<Images> implements ImagesDao{

}

package cn.travel.service;

import java.util.Arrays;

import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.util.FastjsonFilter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class BaseSpringTest {

	protected static final Logger logger=Logger.getLogger(BaseSpringTest.class);
	
	

	protected String writeJsonByFilter(Object object, String[] includesProperties, String[] excludesProperties) {
		FastjsonFilter filter = new FastjsonFilter();// excludes优先于includes
		if (excludesProperties != null && excludesProperties.length > 0) {
			filter.getExcludes().addAll(Arrays.<String> asList(excludesProperties));
		}
		if (includesProperties != null && includesProperties.length > 0) {
			filter.getIncludes().addAll(Arrays.<String> asList(includesProperties));
		}
		String json = JSON.toJSONString(object, filter, SerializerFeature.WriteDateUseDateFormat);
		return json;
	}

}

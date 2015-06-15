package cn.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 项目参数工具�?
 * 
 * @author 孙宇
 * 
 */
public class ConfigUtil {

	private static Properties config=new Properties();
	
	static{
		try {
			InputStream in=ConfigUtil.class.getClassLoader().getResourceAsStream("config.properties");
			config.load(in);
		} catch (IOException e) {
			throw new ExceptionInInitializerError(e);
		}
	
	}

	/**
	 * 获得sessionInfo名字
	 * 
	 * @return
	 */
	public static final String getSessionInfoName() {
		return config.getProperty("sessionInfoName");
	}

	/**
	 * 通过键获取�??
	 * 
	 * @param key
	 * @return
	 */
	public static final String get(String key) {
		return config.getProperty(key);
	}

	public static final String getAdminName() {
		return config.getProperty("adminName");
	}

	public static String getAdminPwd() {
		return config.getProperty("adminPwd");
	}
	public static int getPageSize(){
		return Integer.parseInt(config.getProperty("pageSize"));
	}

}

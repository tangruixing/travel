package cn.travel.dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 测试数据源
 * @author always
 *
 */
public class TestDataSource {

	@Test
	public void getConn() throws SQLException{
		ApplicationContext ac=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		DataSource ds=(DataSource) ac.getBean("dataSource");
		System.out.println("数据源配置完成，数据库连接成功："+ds.getConnection());
	}
}

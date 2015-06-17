package cn.travel.service;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

import cn.model.Constant;
import cn.travel.model.User;
import cn.util.ConfigUtil;

public class UserServiceTest extends BaseSpringTest {

	@Resource(name="userService")
	private UserService userService;
	
	@Test
	public void saveUser(){
		  User admin=new User(ConfigUtil.getAdminName(),DigestUtils.md5Hex(ConfigUtil.getAdminPwd()),Constant.ROLE_SUPER);
		  userService.saveEntity(admin);
	}
}

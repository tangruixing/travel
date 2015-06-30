package cn.model;

public class Constant {

	/**
	 * 超级管理员
	 */
	public static int ROLE_SUPER=0;
	/**
	 * 管理员
	 */
	public static int ROLE_ADMIN=1;
	/**
	 * 普通用户
	 */
	public static int ROLE_MEMBER=2;
	
	
	/**
	 * 线路：针对普通用户
	 */
	public static int ROUTER_PAY=0;
	/**
	 * 线路：针对自由行用户
	 */
	public static int ROUTER_NOPAY=1;
	
	/**
	 * 景区+景点
	 */
	public static int SCENERY_ALL=0;
	
	/**
	 * 景区
	 */
	public static int SCENERY_PARENT=1;
	/**
	 * 景点
	 */
	public static int SCENERY_CHILD=2;
	
	
	//留言未被管理员查看
	public static int MESSAGE_UNSTATUS=0;
	
	//留言已被管理员查看
		public static int MESSAGE_STATUS=1;
}

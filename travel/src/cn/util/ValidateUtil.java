package cn.util;

import java.util.Collection;

/**
 * 校验工具类
 * @author always
 *
 */
public class ValidateUtil {

	/**
	 * 判断字符串有效性
	 * @param str
	 * @return
	 * 		
	 */
	public static boolean isValid(String str){
		
		if(str==null||"".equals(str.trim())){
			return false;
		}
		return true;
	}
	/**
	 * 集合的有效性
	 * @param col
	 * @return
	 * 		如果集合不存在，或者集合中没有元素，返回 false
	 * 		否则返回 true
	 */
	public static boolean isValid(Collection col){
		
		if(col==null||col.isEmpty()){
			return false;
		}
		return true;
	}
	public static boolean isValid(Object[] array) {
		// TODO Auto-generated method stub
		if(array==null||array.length<=0){
			return false;
		}
		return true;
	}
}

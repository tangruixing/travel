package cn.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * 数据工具类
 * @author always
 *
 */
public class DataUtil {
	/**
	 * 采用Md5加密
	 * @param src
	 * @return
	 */
	public static String md5(String src){
		try {
			
			StringBuffer buffer=new StringBuffer();
			char [] chars={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] target = md.digest(src.getBytes());//16
			
			for(byte b:target){//16*2
				//System.out.println("字节b:"+b);
				//高4位
				buffer.append(chars[b>>4&0x0F]);
				//低4位
				buffer.append(chars[b&0x0F]);
			}
			return buffer.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Serializable deeplyCopy(Serializable src){
		ByteArrayOutputStream baos=null;
		ObjectOutputStream oos=null;
		ObjectInputStream ois=null;
		try {
			baos=new ByteArrayOutputStream();
			oos=new ObjectOutputStream(baos);
			oos.writeObject(src);
			byte[] byteArray = baos.toByteArray();
			
			ois=new ObjectInputStream(new ByteArrayInputStream(byteArray));
			Serializable copyObejct = (Serializable) ois.readObject();
			
			return copyObejct;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ois.close();
				oos.close();
				baos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public static <T> Collection<T> removeRepeat(Collection<T> col) {
		
		Set<T> set = new HashSet<T>(col);
		
		return set;
	}
}

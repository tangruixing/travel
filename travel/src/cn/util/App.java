package cn.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class App {

	public static void main(String [] args) throws NoSuchAlgorithmException{
		
		StringBuffer buffer=new StringBuffer();
		char [] chars={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
		byte [] src="123".getBytes();//49,50,51
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] target = md.digest(src);
		System.out.println("源-->长度："+src.length+"byte:"+target);
		System.out.println("目标-->长度："+target.length+"byte:"+target.toString());
		
		for(byte b:target){//16*2
			System.out.println("字节b:"+b);
			//高4位
			buffer.append(chars[b>>4&0x0F]);
			//低4位
			buffer.append(chars[b&0x0F]);
		}
		System.out.println(buffer.toString());
	}
}

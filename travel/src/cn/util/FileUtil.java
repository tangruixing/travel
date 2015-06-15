/*package cn.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

*//**
 * Created by always_w_u on 2014/12/10.
 * 
 * 
 * web 文件上传 和 删除
 * 	 虚拟相对路径：virtualRelativePath 例如：/update/sourceDir/targetFile
 * 	 真实绝对路径: realAbsolutePath 例如:c:\\xxxx\\xxx\\xx\\xx
 * 
 * 	在网络上所有的资源文件，例如:http://host/contextPath/index.html，是一个虚拟路径
 *  相应的在服务器上，有一个真实的路径
 * 	 临时文件：tempFile
 * 	 源文件名称：sourceFileName
 *   
 * 	上传：绝对路径 + 源文件 + 源文件名
 * 	删除：绝对路径 
 * 			从数据得到相对路径，得到真是路径
 * 		 	String deleteRealPath=sc.getRealPath(relativePath);
 *//*
public class FileUtil {

	*//**
	 * Windows：'\\'
	 * Linux:'/'
	 *//*
	private static final String FILESEPARATOR = File.separator;
	private static final String VIRTUALSEPARATOR="/";
	private static final String UPLOADDIR="/upload";
	private static Logger log=Logger.getLogger(FileUtil.class);
	
	*//**
	 * 
	 * @param virtualPath
	 * 			例如: /host/contextPath
	 * @return
	 * 			win:\\host\\contextPath
	 *//*
	public static String  parseRealPath(String virtualPath){
		*//**
		 * String string="java/java";
		 * System.out.println(string.replaceAll("\\/", "\\\\"));
		 * System.out.println(string.replace("/", "\\"));
		 * System.out.println(string.replace("/", File.separator));
		 *//*
		return virtualPath.replace(VIRTUALSEPARATOR,FILESEPARATOR);
	}
	
	
	
	 * private String
	 * webrootUrl=request.getSession().getServletContext().getRealPath("/");
	 
	public static void deleteFile(String realAbsolutePath) throws IOException {
	
		Files.delete(Paths.get(realAbsolutePath));

	}

	public static String toRelativePath(String absolutePath) {
		absolutePath = absolutePath.replace('\\', '/');
		return absolutePath.substring(absolutePath.indexOf("/upload"));
	}

	*//**
	 * 
	 * @param sourceFile
	 * 			源文件 path
	 * @param sourceFileName
	 * 			源文件名字
	 * @param realAbsoluteDir
	 * 			上传文件的目录
	 * @return
	 * 			上传文件 path
	 *//*
	public static Path uploadFile(Path sourceFile, String sourceFileName,
			String realAbsoluteDir) {

		Path targetPath = null;
		try {
			
			Path targetDir =createUploadTargetDir(realAbsoluteDir);
			
			targetPath=Paths.get(targetDir.toString(), createUploadTargetFileName(sourceFileName));
			
			targetPath = Files.move(sourceFile, targetPath,
					StandardCopyOption.REPLACE_EXISTING);

			System.out.println("上传的目录路径：" + targetPath.getParent() + ",文件路径：" + targetPath.toString());
		} catch (final IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return targetPath;

	}
	

	*//**
	 * 
	 * @param realDirPath
	 * 			要创建的目录的真实路径
	 * @return
	 * @throws IOException
	 *//*
	public static Path createUploadTargetDir(String realDirPath)throws IOException {

		Path dir = Paths.get(realDirPath);

		if (Files.notExists(dir)) {
			dir = Files.createDirectories(dir);

		}
		return dir;
	}

	
	
	*//**
	 * 
	 * @param sourceFileName
	 * 			源文件名
	 * @param realAbsoluteDir
	 * 			
	 * @return
	 *//*
	public static String createUploadTargetFileName(String sourceFileName) {
		
		String ext=sourceFileName.substring(sourceFileName.lastIndexOf("."));
		
		return System.nanoTime()+ext;
		
	}
	

	*//**
	 * 解决struts2 下(IE,Firefox)下载文件名乱码
	 * 
	 * @param filename
	 *            文件名
	 * @return
	 * @throws Exception
	 *//*
	public static String toEncode(HttpServletRequest request,String filename) throws Exception {


		System.out.println("解决struts2�?(IE,Firefox)下载文件名乱�?:" + filename);
		String Agent = request.getHeader("User-Agent");
		if (null != Agent) {
			Agent = Agent.toLowerCase();
			if (Agent.indexOf("firefox") != -1) {
				filename = new String(filename.getBytes(), "iso8859-1");
			} else if (Agent.indexOf("msie") != -1) {
				filename = java.net.URLEncoder.encode(filename, "UTF-8");
			} else {
				filename = java.net.URLEncoder.encode(filename, "UTF-8");
			}
		}
		return filename;
	}


	

}
*/
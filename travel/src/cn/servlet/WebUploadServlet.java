package cn.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;

public class WebUploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public WebUploadServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		System.out.println("文件上传");
	
		String baseUrl="/images/upload/";
		
		Enumeration enu=request.getParameterNames();
		while(enu.hasMoreElements()){
		String paraName=(String)enu.nextElement();
		System.out.println(paraName+": "+request.getParameter(paraName));
		}
		
		DiskFileItemFactory factory=new DiskFileItemFactory();
		String type = request.getParameter("type");
		if(StringUtils.isEmpty(type)){
			type="temp";
		}
		String path = this.getServletContext().getRealPath(baseUrl+type);
		File f=new File(path);
		
		if(!f.exists()){
			f.mkdirs();
		}
		factory.setRepository(new File(path));
		//设置内存中缓存区的大小，默认10K  
		factory.setSizeThreshold(1024*1024);
		
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		
		try {
			List<FileItem> list = upload.parseRequest(request);
			String name=null;
			String value=null;
			int start=0;
			String filename=null;
			for (FileItem item : list) {
				name=item.getFieldName();
				if(item.isFormField()){
					value=item.getString();
					System.out.println(value);
					request.setAttribute(name, value);
				}else{
					value=item.getName();
					start=value.lastIndexOf("\\");
					filename=value.substring(start+1);
					request.setAttribute(name, filename);
					try {
						item.write(new File(path, filename));
						//response
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				
				//其他处理
				
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/* request.setCharacterEncoding("utf-8");//防止中文名乱码
		 Enumeration enu=request.getParameterNames();
			while(enu.hasMoreElements()){
			String paraName=(String)enu.nextElement();
			System.out.println(paraName+": "+request.getParameter(paraName));
			}
	        int sizeThreshold=1024*6; //缓存区大小
	        String basePath = this.getServletContext().getRealPath("/upload/");
	        File repository = new File(basePath); //缓存区目录
	        long sizeMax = 1024 * 1024 * 2;//设置文件的大小为2M
	        final String allowExtNames = "jpg,gif,bmp,rar,rar,txt,docx";
	        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
	        diskFileItemFactory.setRepository(repository);
	        diskFileItemFactory.setSizeThreshold(sizeThreshold);
	        ServletFileUpload servletFileUpload=new ServletFileUpload(diskFileItemFactory);
	        servletFileUpload.setSizeMax(sizeMax);
	        
	        List<FileItem> fileItems = null;
	        try{
	            fileItems = servletFileUpload.parseRequest(request);
	            
	            for(FileItem fileItem:fileItems){
	                long size=0;
	                String filePath = fileItem.getName();
	                System.out.println(filePath);
	                if(filePath==null || filePath.trim().length()==0)
	                    continue;
	                String fileName=filePath.substring(filePath.lastIndexOf(File.separator)+1);
//	                String fileName=String.valueOf(System.currentTimeMillis());
	                String extName=filePath.substring(filePath.lastIndexOf(".")+1);
//	                fileName+="."+extName;
	                if(allowExtNames.indexOf(extName)!=-1)
	                {
	                    try {
	                        fileItem.write(new File(basePath+File.separator+fileName));
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                }
	                else{
	                    throw new FileUploadException("file type is not allowed");
	                }
	            }
	        }catch(FileSizeLimitExceededException e){
	            System.out.println("file size is not allowed");
	        }catch(FileUploadException e1){
	            e1.printStackTrace();
	        }*/
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

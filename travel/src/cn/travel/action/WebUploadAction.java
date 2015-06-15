package cn.travel.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import cn.util.web.WebUploadUtil;

@Controller("webUploadAction")
@Scope("prototype")
public class WebUploadAction implements ServletRequestAware{

	
	public MultipartFile file;
	public String destDir;
	private HttpServletRequest request;
	
	public void upload(){
		
		WebUploadUtil webUploadUtil=new WebUploadUtil();
		try {
			webUploadUtil.upload(file, "upload", request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	
	
	
	
	
}

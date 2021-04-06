package com.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	
	
	public static String fileUpload(MultipartFile file, HttpServletRequest request) throws IOException{
		System.out.println("QaFileUploadUtil.qaFileUpload SUCCESS >>> : ");
		
		String realname = null;
		String orgname = file.getOriginalFilename();
		
		if(orgname != null && (!orgname.equals(""))){
			realname = System.currentTimeMillis() + "_" + orgname;
			
			
			String docRoot = request.getSession().getServletContext().getRealPath("/fileupload");
			System.out.println("docRoot confirm >>> : " + docRoot);
			
			File qaFileDir = new File(docRoot);
			if(!qaFileDir.exists()){
				qaFileDir.mkdir();
			}
			File qaFileAdd = new File(docRoot + "/" + realname);
			System.out.println("qaFileAdd confirm >>> : " + qaFileAdd);
			file.transferTo(qaFileAdd);
		}
		
		return realname;
	}
	

}

package com.api;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.apache.cxf.io.CachedOutputStreamCallback;
import org.apache.cxf.message.Message;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class test
 */
@WebServlet("/PublicData5.do")
public class PublicData5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicData5() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String contentId=request.getParameter("contentId");
		String contenttypeId=request.getParameter("contenttypeId");
		System.out.println("PublicDate5.contentId >>> : " + contentId);
		System.out.println("PublicDate5.contentId >>> : " + contenttypeId);
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=";
		String serviceKey = "";
		String parameter = "";
		
		//serviceKey = URLEncoder.encode(serviceKey,"UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("PublicData5.do SUCCESS >>> :  ");
		
		parameter = parameter + "&" + "contentTypeId="+contenttypeId;
		parameter = parameter + "&" + "contentId="+contentId;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide&introYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		
		addr = addr + serviceKey + parameter;
		System.out.println("PublicData5.addr >>> : "+addr);
		URL url = new URL(addr);

		
//		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

		InputStream in = url.openStream(); 
//		CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
	    
		String mbos = bos1.toString("UTF-8");
		System.out.println("mbos: "+mbos);
	    
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
//		json.put("data", data);
		System.out.println("json: "+json);
		
	}
}

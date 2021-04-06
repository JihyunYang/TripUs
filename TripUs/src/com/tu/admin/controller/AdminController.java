package com.tu.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.common.Paging;
import com.file.FileUploadUtil;
import com.tu.admin.service.AdminService;
import com.tu.admin.vo.AdHistoryBoardVo;
import com.tu.admin.vo.AdminVo;
import com.tu.faboard.service.FaBoardService;
import com.tu.faboard.vo.FaVO;
import com.tu.ntboard.service.NtBoardService;
import com.tu.ntboard.vo.NtBoardVO;
import com.tu.qaboard.service.QaBoardService;
import com.tu.qaboard.vo.QaBoardVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	//constructor field
	private static final String CONTEXT_PATH = "admin";
	
	@Autowired 
	private NtBoardService ntBoardService;
	
	@Autowired 
	private FaBoardService faBoardService;
	
	@Autowired
	private QaBoardService qaBoardService;
	
	@Autowired
	private AdminService adminService;
	
	//nt start 
	//full post page
	@RequestMapping("/adntBoardList")  
	public ModelAndView adntBoardList(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("AdminController.adntBoardList SUCCESS >>> : ");
		System.out.println(ntvo.getNtsearchcondition());
		System.out.println(ntvo.getNtsearchkeyword());
		System.out.println(ntvo.getNtid());
			
		
		int pageNum = 0;
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		page = ntvo.getPageno()== 0? startPage : ntvo.getPageno(); 
		ntvo.setPageno(page);
		List<NtBoardVO> ntList =  ntBoardService.ntBoardList(ntvo);
		
		System.out.println(ntList);
		System.out.println("ntList.size()" + ntList.size());
		
		ModelAndView mav = new ModelAndView();
	
		Map map = new HashMap();
		
		map.put("pageno", page);
		System.out.println("pageno >>> : " + page);
		
		map.put("totalcount", ntList.size());
		System.out.println("totalcount >>> : " + ntList.size());
		
		List pagingList = ntBoardService.ntBoardListCount(map);
		System.out.println("pagingList >>> : " + pagingList);
		System.out.println("pagingList.size() >>> : " + pagingList.size());
		
		
		if(pagingList != null && pagingList.size() > 0 ){

			mav.addObject("listCc", pagingList.get(0));
			
			for(int j=0; j< pagingList.size(); j++){
				NtBoardVO pgVo = null;
				pgVo = (NtBoardVO)pagingList.get(j);
				totalCount = Integer.valueOf(pgVo.getTotalcount());
				System.out.println("totalCount >>> : "+totalCount);
				pageNum = page;
				System.out.println("pageNum >>> : "+pageNum);
			}
			
			int[] rlt = Paging.getPagingNum(totalCount, pageNum);
			System.out.println("rlt: "+ rlt);
			if(rlt.length == 4){
				startPage = rlt[0];
				endPage = rlt[1];
				totalPage = rlt[2];
				page = rlt[3];
				System.out.println("startPage: "+ startPage);
				System.out.println("endPage: "+ endPage);
				System.out.println("totalPage: "+ totalPage);
				System.out.println("page: "+ page);
			}
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			mav.addObject("page", page);
			mav.addObject("ntBoardLists", ntList);
			mav.addObject("ntBoardListCont",ntList);
			mav.addObject("ntsearchcondition", ntvo.getNtsearchcondition());
			mav.addObject("ntsearchkeyword", ntvo.getNtsearchkeyword());
			mav.addObject("ntBoardListAll", ntvo);
		}else{
			System.out.println("pagingList null");
		}
		mav.setViewName(CONTEXT_PATH + "/adntBoardList");
			
		return mav;
	}
	
	
	//insert Write Form page
	@RequestMapping("/adntBoardSelect") 
	public ModelAndView adntBoardSelect(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("AdminController.adntBoardSelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
			
		if (ntvo.getNtno().equals("")) {
			mav.addObject("ntMode","ntInsert");
		}else{
			mav.addObject("NtBoardUpdate", ntBoardService.ntBoardDetail(ntvo));
			mav.addObject("ntMode", "ntUpdate");
		}
			mav.setViewName(CONTEXT_PATH + "/adntBoardInsert");
			
			return mav;
		}
		
		
	//detail page
	@RequestMapping("/adntBoardDetail")
	public ModelAndView adntBoardDetail(@ModelAttribute NtBoardVO ntvo, HttpServletRequest request, 
									  HttpServletResponse response, HttpSession session) {
		System.out.println("AdminController.adntBoardDetail SUCCESS >>> : ");
		System.out.println(ntvo.getNtno());
	  	
		//setting for hit Start
			//get saved cookie
			Cookie[] ntCookie = request.getCookies();
			String ntCookieValue = null;
			
			for(int i=0; i<ntCookie.length; i++) {
				ntCookieValue = ntCookie[0].getValue();
				System.out.println("AdminController.adntBoardDetail ntCookieValue confirm >>> : " + ntCookieValue);
			}
			
			//cookie insert session
			if(session.getAttribute(ntvo.getNtno() + ":cookie") == null) {
				session.setAttribute(ntvo.getNtno() + ":cookie", ntvo.getNtno() + ":" + ntCookieValue );
			} else { 
				 session.setAttribute(ntvo.getNtno() + ":cookie ex", session.getAttribute(ntvo.getNtno() + ":cookie"));
				 
				 if(!session.getAttribute(ntvo.getNtno() + ":cookie").equals(ntvo.getNtno() + ":" + ntCookieValue)) {
			            session.setAttribute(ntvo.getNtno() + ":cookie", ntvo.getNtno() + ":" + ntCookieValue);
			         }
			}
			
			if(!session.getAttribute(ntvo.getNtno() + ":cookie").equals(session.getAttribute(ntvo.getNtno() + ":cookie ex"))) {
		         int resultSession = ntBoardService.ntUpdateViewCnt(ntvo);
		      }
		//setting for hit End
		
		ModelAndView mav = new ModelAndView();
	  	
		mav.addObject("ntBoardDetail",ntBoardService.ntBoardDetail(ntvo)); 
	  	mav.setViewName(CONTEXT_PATH + "/adntBoardDetail");
	  	System.out.println(session.getAttribute(ntvo.getNtno() + ":cookie") + "�꽭�뀡1");
	    System.out.println(session.getAttribute(ntvo.getNtno() + ":cookie ex") + "�꽭�뀡2"); 
	  	
	    return mav;
	}

	//insert function
	@RequestMapping("/adntBoardInsert") 
	public ModelAndView adntBoardInsert(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("AdminController.adntBoardInsert SUCCESS >>> : ");
					
		ntvo.setNthit("0");
					
		String ntResultStr = "";
		int result = ntBoardService.ntBoardInsert(ntvo);

		if(result > 0) {
			ntResultStr = "Post registration was successful.";
		} else {
			ntResultStr = "Post registration failed.";
		  }
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ntResultStr);
		mav.setViewName(CONTEXT_PATH + "/adntResult");
				
		return mav;
	}	
		
	//update function
	@RequestMapping("/adntBoardUpdate")
	public ModelAndView adntBoardUpdate(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("AdminController.adntBoardUpdate SUCCESS >>> : ");
		System.out.println("AdminController.adntBoardUpdate ntno confirm >>> :  "+ ntvo.getNtno());
	      
		String ntResultStr ="";
		int result =  ntBoardService.ntBoardUpdate(ntvo);
		
		if (result > 0) {
			ntResultStr = "Post edit was successful.";
		} else {
			ntResultStr = "Editing post failed.";
		 }
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ntResultStr);
		mav.setViewName(CONTEXT_PATH + "/adntResult");
	    
		return mav;
	}
	   
	 //delete function
	 @RequestMapping("/adntBoardDelete")
	 public ModelAndView adntBoardDelete(@ModelAttribute NtBoardVO ntvo) {
		 System.out.println("AdminController.adntBoardDelete SUCCESS >>> : ");
		 
		  String ntResultStr ="";
	      int result = ntBoardService.ntBoardDelete(ntvo);
	      
	      if (result > 0) {
	    	  ntResultStr = "Successfully deleted post.";
		  } else {
			  ntResultStr = "Deleting a post failed.";
			}
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("result", ntResultStr);
	      mav.setViewName(CONTEXT_PATH + "/adntResult");
	     
	      return mav;
	   }
	 
	//nt end
	 
	 
	//qa start
	//full post page
	@RequestMapping("/adqaBoardList")
	public ModelAndView adqaBoardList(@ModelAttribute QaBoardVO qavo) {
		System.out.println("AdminController.adqaBoardList SUCCESS >>> : ");
	
		int pageNum = 0;
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		
		page = qavo.getPageno()== 0? startPage : qavo.getPageno(); 
		qavo.setPageno(page);
		
		List<QaBoardVO> qaList = qaBoardService.qaBoardList(qavo);
		System.out.println("AdminController.adqaBoardList qaList confirm >>> : " + qaList);
		System.out.println("AdminController.adqaBoardList qaList.size confirm >>> : " + qaList.size());
		
		
		ModelAndView mav = new ModelAndView();
	
		Map map = new HashMap();
		
		map.put("pageno", page);
		System.out.println("pageno >>> : " + page);
		
		map.put("totalcount", qaList.size());
		System.out.println("totalcount >>> : " + qaList.size());
		
		List pagingList = qaBoardService.qaBoardListCount(map);
		System.out.println("pagingList >>> : " + pagingList);
		System.out.println("pagingList.size() >>> : " + pagingList.size());
		
		
		if(pagingList != null && pagingList.size() > 0 ){

			mav.addObject("listCc", pagingList.get(0));
			
			for(int j=0; j< pagingList.size(); j++){
				QaBoardVO pgVo = null;
				pgVo = (QaBoardVO)pagingList.get(j);
				totalCount = Integer.valueOf(pgVo.getTotalcount());
				System.out.println("totalCount >>> : "+totalCount);
				pageNum = page;
				System.out.println("pageNum >>> : "+pageNum);
			}
			
			int[] rlt = Paging.getPagingNum(totalCount, pageNum);
			System.out.println("rlt: "+ rlt);
			if(rlt.length == 4){
				startPage = rlt[0];
				endPage = rlt[1];
				totalPage = rlt[2];
				page = rlt[3];
				System.out.println("startPage: "+ startPage);
				System.out.println("endPage: "+ endPage);
				System.out.println("totalPage: "+ totalPage);
				System.out.println("page: "+ page);
			}
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			mav.addObject("page", page);
			mav.addObject("qaBoardLists", qaList);
			mav.addObject("qaBoardListCount", qaList.size());
			mav.addObject("qaBoardListAll", qavo);
			mav.addObject("qaBoardList", qaList);
			mav.addObject("qasearchcondition", qavo.getQasearchcondition());
			mav.addObject("qasearchkeyword", qavo.getQasearchkeyword());
		}else{
			System.out.println("pagingList null");
		}
		mav.setViewName(CONTEXT_PATH + "/adqaBoardList"); 
		
		return mav ;
	}
	
	//insert Write Form page
	@RequestMapping("/adqaBoardSelect")
	public ModelAndView adqaBoardSelect(@ModelAttribute QaBoardVO qavo) {
		System.out.println("AdminController.adqaBoardSelect SUCCESS >>> : ");
		
		ModelAndView mav = new ModelAndView();
		
		//To distinguish buttons
		if(qavo.getQano().equals("")) {
			mav.addObject("qaMode", "qaInsert");
		} else {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaMode", "qaUpdate");
		}
		mav.setViewName(CONTEXT_PATH + "/adqaBoardInsert");
		
		return mav;
	}
	
	//insert function
	@RequestMapping("/adqaBoardInsert") 
	//MultipartFile file need for fileupload set
	public ModelAndView adqaBoardInsert(@ModelAttribute QaBoardVO qavo, MultipartFile file,HttpServletRequest request) throws IOException {
		System.out.println("AdminController.adqaBoardInsert SUCCESS >>> : ");
		System.out.println("AdminController.adqaBoardInsert qavo confirm >>> : " + qavo);	
			
			//file upload set
			if(!file.isEmpty()){
				//db saved real file upload name
				String qaRealnameSave = FileUploadUtil.fileUpload(file, request);
				
				//qaRealnameSave value set in vo file
				qavo.setQaimage(qaRealnameSave);
				System.out.println("AdminControllerqavo.qaBoardInsert qaRealnameSave confirm" + qaRealnameSave);
			}else{
				qavo.setQaimage(qavo.getQaimage());
				System.out.println("AdminControllerqavo.qaBoardInsert qavo.getQaimage() confirm" + qavo.getQaimage());
			} 
			
			//this is used to prevent error 
			if(qavo.getQareplycontent() == null || qavo.getQareplycontent() == ""){
				qavo.setQareplycontent("");
			}
			
			//this is the reply setting
			if (request.getParameter("qaReplyMode").equals("qaReInsert")) {
				qavo.setQaref(qavo.getQano());
				System.out.println(">>>>>>>>>>>>>>>>>>>>"  + qavo.getQano());
				qavo.setQastep(1);
			} else {
				String qano = qaBoardService.qaBoardQaNoSelect();
				qavo.setQaref(qano);
				qavo.setQastep(0);
			}
			
			String qaResultStr = "";
			int result = qaBoardService.qaBoardInsert(qavo);
		
			if(result > 0) {
				qaResultStr = "Post registration was successful.";
			} else {
				qaResultStr = "Post registration failed.";
			  }
						
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", qaResultStr);
			mav.setViewName(CONTEXT_PATH + "/adqaResult");
					
			return mav;
		}	
	
	//Reply insert Write Form page
	@RequestMapping("/adqaBoardReplySelect")
	public ModelAndView adqaBoardReplySelect(@ModelAttribute QaBoardVO qavo) {
		System.out.println("AdminController.adqaBoardReplySelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
		System.out.println("AdminController.adqaBoardReplySelect getQareplycontent confirm >>>" + qavo.getQareplycontent());
		if(qavo.getQareplycontent().equals("")) {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaReplyMode", "qaReplyInsert");
		} else {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaReplyMode", "qaReplyUpdate");
		}
		mav.setViewName(CONTEXT_PATH + "/adqaBoardInsert");
			
		return mav;
	}
	
	//detail page
	@RequestMapping("/adqaBoardDetail")
	public ModelAndView adqaBoardDetail(@ModelAttribute QaBoardVO qavo, HttpServletRequest request,
			                          HttpServletResponse response, HttpSession session) {
		System.out.println("AdminController.adqaBoardDetail SUCCESS >>> : ");
		System.out.println(qavo);
		
		ModelAndView mav = new ModelAndView();
	  	mav.addObject("qaBoardDetail",qaBoardService.qaBoardDetail(qavo)); 
	  	mav.setViewName(CONTEXT_PATH + "/adqaBoardDetail");
	    return mav;
	}

	//update function
	@RequestMapping("/adqaBoardUpdate")
	//MultipartFile file need for fileupload set
	public ModelAndView adqaBoardUpdate(@ModelAttribute QaBoardVO qavo,  MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("AdminController.adqaBoardUpdate SUCCESS >>> : ");
		System.out.println("AdminController.adqaBoardUpdate qavo confirm >>> : " + qavo);			
		System.out.println("AdminController.adqaBoardUpdate getOriginalFilename confirm >>> : " + file.getOriginalFilename());			
		if(!file.isEmpty()){
			//db saved real fileupload name
			String qaRealnameSave = FileUploadUtil.fileUpload(file, request);
			qavo.setQaimage(qaRealnameSave);			
		}else{
			qavo.setQaimage(qavo.getQaimage());
		} 
		if(qavo.getQareplycontent() == null || qavo.getQareplycontent() == "" ){
			qavo.setQareplycontent("");
		}
		String qaResultStr = "";
		int result = qaBoardService.qaBoardUpdate(qavo);
		if(result > 0) {
			qaResultStr = "Post edit was successful.";
		} else {
			qaResultStr = "Editing post failed.";
		  }
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", qaResultStr);
		mav.setViewName(CONTEXT_PATH + "/adqaResult");
				
		return mav;
	}
	
	//delete function
	@RequestMapping("/adqaBoardDelete")
	public ModelAndView adqaBoardDelete(@ModelAttribute QaBoardVO qavo) {
		System.out.println("AdminController.adqaBoardDelete SUCCESS >>> : ");
		System.out.println("AdminController.adqaBoardDelete qavo confirm >>> : " + qavo);			
		
		QaBoardVO qavo1 = qaBoardService.qaBoardDetail(qavo);
		qavo.setQaref(qavo1.getQaref());
		
		String qaResultStr = "";
		int result = qaBoardService.qaBoardDelete(qavo);
		if(result > 0) {
			qaResultStr = "Successfully deleted post.";
			System.out.println(qaResultStr);
		} else {
			qaResultStr = "Deleting a post failed.";
			System.out.println(qaResultStr);
		  }
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", qaResultStr);
		mav.setViewName(CONTEXT_PATH + "/adqaResult");
				
		return mav;
	}
	 
	//qa end

	
	//faq start
	//full post page
	@RequestMapping("/adfaBoardList") 
	public ModelAndView adfaBoardList(@ModelAttribute FaVO fvo,
			//@RequestParam(defaultValue = "1", required = false, value = "pageno") int pageNo, // /faBoardList? -> pageno = 1
			HttpServletRequest request){
		System.out.println("AdminController.adfaBoardList SUCCESS >>> : ");
		
		System.out.println("AdminController.adfaBoardList fvo.getFasearchcondition() value confirm >>> : " + fvo.getFasearchcondition());
		System.out.println("AdminController.adfaBoardList fvo.getFasearchkeyword() value confirm >>> : " + request.getParameter("fasitename"));
	
		


		int pageNum = 0;
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		page = fvo.getPageno()== 0? startPage : fvo.getPageno(); 
		fvo.setPageno(page);
		List<FaVO> faList =  faBoardService.faBoardList(fvo);
		ModelAndView mav = new ModelAndView();
	
		Map map = new HashMap();
		
		map.put("pageno", page);
		System.out.println("pageno >>> : " + page);
		
		map.put("totalcount", faList.size());
		System.out.println("totalcount >>> : " + faList.size());
		
		List pagingList = faBoardService.faBoardListCount(map);
		System.out.println("pagingList >>> : " + pagingList);
		System.out.println("pagingList.size() >>> : " + pagingList.size());
		


		
		if(pagingList != null && pagingList.size() > 0 ){

			mav.addObject("listCc", pagingList.get(0));
			
			for(int j=0; j< pagingList.size(); j++){
				FaVO pgVo = null;
				pgVo = (FaVO)pagingList.get(j);
				totalCount = Integer.valueOf(pgVo.getTotalcount());
				System.out.println("totalCount >>> : "+totalCount);
				pageNum = page;
				System.out.println("pageNum >>> : "+pageNum);
			}
			
			int[] rlt = Paging.getPagingNum(totalCount, pageNum);
			System.out.println("rlt: "+ rlt);
			if(rlt.length == 4){
				startPage = rlt[0];
				endPage = rlt[1];
				totalPage = rlt[2];
				page = rlt[3];
				System.out.println("startPage: "+ startPage);
				System.out.println("endPage: "+ endPage);
				System.out.println("totalPage: "+ totalPage);
				System.out.println("page: "+ page);
			}
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			mav.addObject("page", page);
			mav.addObject("faBoardLists", faList);
			mav.addObject("faBoardListCount", faList.size());
			System.out.println("faList.size()" + faList.size());
			mav.addObject("faBoardListAll", fvo);
			mav.addObject("fasearchcondition", fvo.getFasearchcondition());
			mav.addObject("fasearchkeyword", fvo.getFasearchkeyword());
		}else{
			System.out.println("pagingList null");
		}
		
		
		System.out.println("faList.size()" + faList.size());
		
		mav.setViewName(CONTEXT_PATH + "/adfaBoardList");
		
		return mav;
	}
	
	//insert Write Form page
	@RequestMapping("/adfaBoardSelect") 
	public ModelAndView adfaBoardSelect(@ModelAttribute FaVO fvo, HttpServletRequest request) {
		System.out.println("AdminController.adfaBoardSelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
			
		if(fvo.getFano().equals("")) {
			mav.addObject("faMode","faInsert");
		} else {
			mav.addObject("FaVo",faBoardService.faBoardSelect(fvo));
			if(request.getParameter("faMode").equals("faUpdate")){
				mav.addObject("faMode", "faUpdate");
			}else{
				mav.addObject("faMode", "faDelete");
			}
		}
		mav.setViewName(CONTEXT_PATH + "/adfaBoardWrite");
			
		return mav;
	}
		
	//insert function
	@RequestMapping("/adfaBoardInsert")
	public ModelAndView adfaBoardInsert(@ModelAttribute FaVO fvo) {
		System.out.println("AdminController.adfaBoardInsert SUCCESS >>> : ");
		
		String faResultStr = "";
		int result = faBoardService.faBoardInsert(fvo);
		
		if(result > 0) {
			faResultStr = "Post registration was successful.";
		} else {
			faResultStr = "Post registration failed.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/adfaResult");
		
		return mav;
	}
	
	//update function
	@RequestMapping("/adfaBoardUpdate")
	public ModelAndView adfaBoardUpdate(@ModelAttribute FaVO fvo) {
		System.out.println("AdminController.adfaBoardUpdate SUCCESS >>> : ");
		
			
		String faResultStr = "";
		int result = faBoardService.faBoardUpdate(fvo);
			
		if(result > 0) {
			faResultStr = "Post edit was successful.";
		} else {
			faResultStr = "Editing post failed.";
		}
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/adfaResult");
	
		return mav;
	}
		
		
	//delete function
	@RequestMapping("/adfaBoardDelete")
	public ModelAndView adfaBoardDelete(@ModelAttribute FaVO fvo) {
		System.out.println("AdminController.adfaBoardDelete SUCCESS >>> : ");
			
		String faResultStr = "";
		int result = faBoardService.faBoardDelete(fvo);
			
		if(result > 0) {
			faResultStr = "Successfully deleted post.";
		} else {
			faResultStr = "Successfully deleted post.";
		}
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/adfaResult");
	
		return mav;
	}
	
	//faq end
	
	//mem
	//full memberlist page
	@RequestMapping(value = "/adlistMember")
	public ModelAndView adlistMember(@ModelAttribute AdminVo adminvo){
		System.out.println("AdminController adlistMember SUCCESS >>> : ");
		System.out.println("AdminController adlistMember param >>>\n"+ adminvo);
		
		
		int pageNum = 0;
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		page = adminvo.getPageno()== 0? startPage : adminvo.getPageno(); 
		adminvo.setPageno(page);
		
		List<AdminVo> adlist = adminService.adlistMember(adminvo);
		System.out.println(adlist);
		System.out.println("ntList.size()" + adlist.size());
		
		ModelAndView mav = new ModelAndView();
	
		Map map = new HashMap();
		
		map.put("pageno", page);
		System.out.println("pageno >>> : " + page);
		
		map.put("totalcount", adlist.size());
		System.out.println("totalcount >>> : " + adlist.size());
		
		List pagingList = adminService.adlistMemberCount(map);
		System.out.println("pagingList >>> : " + pagingList);
		System.out.println("pagingList.size() >>> : " + pagingList.size());
		
		
		if(pagingList != null && pagingList.size() > 0 ){

			mav.addObject("listCc", pagingList.get(0));
			
			for(int j=0; j< pagingList.size(); j++){
				AdminVo pgVo = null;
				pgVo = (AdminVo)pagingList.get(j);
				totalCount = Integer.valueOf(pgVo.getTotalcount());
				System.out.println("totalCount >>> : "+totalCount);
				pageNum = page;
				System.out.println("pageNum >>> : "+pageNum);
			}
			
			int[] rlt = Paging.getPagingNum(totalCount, pageNum);
			System.out.println("rlt: "+ rlt);
			if(rlt.length == 4){
				startPage = rlt[0];
				endPage = rlt[1];
				totalPage = rlt[2];
				page = rlt[3];
				System.out.println("startPage: "+ startPage);
				System.out.println("endPage: "+ endPage);
				System.out.println("totalPage: "+ totalPage);
				System.out.println("page: "+ page);
			}
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			mav.addObject("page", page);
			mav.addObject("admemberListCont",adlist);
			mav.addObject("admemberList",adlist);
			mav.addObject("adyn",adminvo.getMdeleteyn()); // �궘�젣�븳 y,n�쓽 媛� 
			mav.addObject("adsearchcondition", adminvo.getAdsearchcondition());
			mav.addObject("adsearchkeyword", adminvo.getAdsearchkeyword());
		}else{
			System.out.println("pagingList null");
		}

		mav.setViewName(CONTEXT_PATH + "/adinsert_list");
		return mav;
	}
	//mem
	
	//admin history 
	//full adhistoryBoardList page
	@RequestMapping(value = "/adhistoryBoardList")
	public ModelAndView adhistoryBoardList(@ModelAttribute AdHistoryBoardVo adhistoryvo){
		System.out.println("AdminController adhistoryBoardList SUCCESS >>> : ");
		System.out.println("AdminController adhistoryBoardList param >>>\n"+ adhistoryvo);
		
		int pageNum = 0;
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		
		page = adhistoryvo.getPageno()== 0? startPage : adhistoryvo.getPageno(); 
		adhistoryvo.setPageno(page);
		
		List<AdHistoryBoardVo> adhistoryList = adminService.adhistoryBoardList(adhistoryvo);
		
		
		ModelAndView mav = new ModelAndView();
	
		Map map = new HashMap();
		
		map.put("pageno", page);
		System.out.println("pageno >>> : " + page);
		
		map.put("totalcount", adhistoryList.size());
		System.out.println("totalcount >>> : " + adhistoryList.size());
		
		List pagingList = adminService.adhistoryBoardListCount(map);
		System.out.println("pagingList >>> : " + pagingList);
		System.out.println("pagingList.size() >>> : " + pagingList.size());
		
		
		if(pagingList != null && pagingList.size() > 0 ){

			mav.addObject("listCc", pagingList.get(0));
			
			for(int j=0; j< pagingList.size(); j++){
				AdHistoryBoardVo pgVo = null;
				pgVo = (AdHistoryBoardVo)pagingList.get(j);
				totalCount = Integer.valueOf(pgVo.getTotalcount());
				System.out.println("totalCount >>> : "+totalCount);
				pageNum = page;
				System.out.println("pageNum >>> : "+pageNum);
			}
			
			int[] rlt = Paging.getPagingNum(totalCount, pageNum);
			System.out.println("rlt: "+ rlt);
			if(rlt.length == 4){
				startPage = rlt[0];
				endPage = rlt[1];
				totalPage = rlt[2];
				page = rlt[3];
				System.out.println("startPage: "+ startPage);
				System.out.println("endPage: "+ endPage);
				System.out.println("totalPage: "+ totalPage);
				System.out.println("page: "+ page);
			}
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			mav.addObject("page", page);
			mav.addObject("adhistoryBoardLists", adhistoryList);
			mav.addObject("adhistoryBoardListCount", adhistoryList.size());
			mav.addObject("adhistoryBoardListAll", adhistoryvo);
			mav.addObject("adhistoryBoardList",adhistoryList);
			mav.addObject("adhistorysearchcondition", adhistoryvo.getAdhistorysearchcondition());
			mav.addObject("adhistorysearchkeyword", adhistoryvo.getAdhistorysearchkeyword());
		}else{
			System.out.println("pagingList null");
		}
		

		mav.setViewName(CONTEXT_PATH+"/adhistoryBoardList");
		return mav;
	} 
	
	//insert Write Form page
	@RequestMapping(value = "/adhistoryBoardSelect")
	public ModelAndView adhistoryBoardSelect(@ModelAttribute AdHistoryBoardVo adhistoryvo){
		System.out.println("AdminController adhistoryBoardSelect SUCCESS >>> : ");
		System.out.println("AdminController adhistoryBoardSelect param >>>\n"+ adhistoryvo);
		
		ModelAndView mav = new ModelAndView();
		//To distinguish buttons
		if(adhistoryvo.getAdhistoryno().equals("")) {
			mav.addObject("adhistoryMode", " adhistoryInsert");
		} else {
			mav.addObject("adhistoryBoardUpdate", adminService.adhistoryBoardDetail(adhistoryvo));
			mav.addObject("adhistoryMode", " adhistoryUpdate");
		}
		
		mav.setViewName(CONTEXT_PATH+"/adhistoryBoardInsert");
		return mav;
	} 
	
	//insert function
	@RequestMapping("/adhistoryBoardInsert") 
	//MultipartFile file need for fileupload set
	public ModelAndView adqaBoardInsert(@ModelAttribute AdHistoryBoardVo adhistoryvo, MultipartFile file,HttpServletRequest request) throws IOException {
		System.out.println("AdminController.adqaBoardInsert SUCCESS >>> : ");
		System.out.println("AdminController.adqaBoardInsert adhistoryvo confirm >>> : " + adhistoryvo);	
			
			//file upload set
			if(!file.isEmpty()){
				//db saved real file upload name
				String qaRealnameSave = FileUploadUtil.fileUpload(file, request);
				
				//qaRealnameSave value set in vo file
				adhistoryvo.setAdhistoryfile(qaRealnameSave);
				System.out.println("AdminControllerqavo.adqaBoardInsert file confirm" + qaRealnameSave);
			}else{
				adhistoryvo.setAdhistoryfile(adhistoryvo.getAdhistoryfile());
				System.out.println("AdminControllerqavo.adqaBoardInsert adhistoryvo.adhistoryfile confirm" + adhistoryvo.getAdhistoryfile());
			} 
			
			
			String qaResultStr = "";
			int result = adminService.adhistoryBoardInsert(adhistoryvo);
		
			if(result > 0) {
				qaResultStr = "Post registration was successful.";
			} else {
				qaResultStr = "Post registration failed.";
			  }
						
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", qaResultStr);
			mav.setViewName(CONTEXT_PATH + "/adhistoryResult");
					
			return mav;
		}	
	
	
		//detail page
		@RequestMapping("/adhistoryBoardDetail")
		public ModelAndView adhistoryBoardDetail(@ModelAttribute AdHistoryBoardVo adhistoryvo, HttpServletRequest request,
				                          HttpServletResponse response, HttpSession session) {
			System.out.println("AdminController.adhistoryBoardDetail SUCCESS >>> : ");
			System.out.println(adhistoryvo);
			
			ModelAndView mav = new ModelAndView();
		  	mav.addObject("adhistoryBoardDetail",adminService.adhistoryBoardDetail(adhistoryvo)); 
		  	mav.setViewName(CONTEXT_PATH + "/adhistoryBoardDetail");
		    return mav;
		}

		//update function
		@RequestMapping("/adhistoryBoardUpdate")
		//MultipartFile file need for fileupload set
		public ModelAndView adhistoryBoardUpdate(@ModelAttribute AdHistoryBoardVo adhistoryvo, MultipartFile file, HttpServletRequest request) throws IOException {
			System.out.println("AdminController.adqaBoardUpdate SUCCESS >>> : ");
			System.out.println("AdminController.adqaBoardUpdate qavo confirm >>> : " + adhistoryvo);			
			System.out.println("AdminController.adqaBoardUpdate getOriginalFilename confirm >>> : " + file.getOriginalFilename());	
			
			//file upload set
			if(!file.isEmpty()){
				//db saved real file upload name
				String qaRealnameSave = FileUploadUtil.fileUpload(file, request);
				
				//qaRealnameSave value set in vo file
				adhistoryvo.setAdhistoryfile(qaRealnameSave);
				System.out.println("AdminControllerqavo.adhistoryBoardUpdate file confirm" + qaRealnameSave);
			}else{
				adhistoryvo.setAdhistoryfile(adhistoryvo.getAdhistoryfile());
				System.out.println("AdminControllerqavo.adhistoryBoardUpdate adhistoryvo.adhistoryfile confirm" + adhistoryvo.getAdhistoryfile());
			} 

			String qaResultStr = "";
			int result = adminService.adhistoryBoardUpdate(adhistoryvo);
			if(result > 0) {
				qaResultStr = "Post edit was successful.";
			} else {
				qaResultStr = "Editing post failed.";
			  }
						
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", qaResultStr);
			mav.setViewName(CONTEXT_PATH + "/adhistoryResult");
					
			return mav;
		}
		
		//delete function
		@RequestMapping("/adhistoryBoardDelete")
		public ModelAndView adhistoryBoardDelete(@ModelAttribute AdHistoryBoardVo adhistoryvo) {
			System.out.println("AdminController.adhistoryBoardDelete SUCCESS >>> : ");
			System.out.println("AdminController.adhistoryBoardDelete adhistoryvo confirm >>> : " + adhistoryvo);			
			

			String qaResultStr = "";
			int result = adminService.adhistoryBoardDelete(adhistoryvo);
			if(result > 0) {
				qaResultStr = "Successfully deleted post.";
				System.out.println(qaResultStr);
			} else {
				qaResultStr = "Deleting a post failed.";
				System.out.println(qaResultStr);
			  }
						
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", qaResultStr);
			mav.setViewName(CONTEXT_PATH + "/adhistoryResult");
					
			return mav;
		}
	
	//admin history 
}

package com.tu.ntboard.controller;

/**
FileName (파일명): NtBoardController.java
Explanation (설명): NtBoardController page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/
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
import org.springframework.web.servlet.ModelAndView;

import com.common.Paging;
import com.tu.ntboard.service.NtBoardService;
import com.tu.ntboard.vo.NtBoardVO;

@Controller
@RequestMapping(value="/notice")
public class NtBoardController {
	
	//constructor field
	private static final String CONTEXT_PATH = "notice";
	
	@Autowired 
	private NtBoardService ntBoardService;
	
	//Notice Main Page
	@RequestMapping("/ntBoardList") 
	public ModelAndView ntBoardList(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("NtBoardController.ntBoardList SUCCESS >>> : ");
		System.out.println("NtBoardController.ntBoardList ntvo.getNtsearchcondition() confirm >>> : " + ntvo.getNtsearchcondition());
		System.out.println("NtBoardController.ntBoardList ntvo.getNtsearchkeyword() confirm >>> : " + ntvo.getNtsearchkeyword());
		System.out.println("NtBoardController.ntBoardList ntvo.getNtid() confirm >>> : " + ntvo.getNtid());
		
		int pageNum = 0;
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		page = ntvo.getPageno()== 0? startPage : ntvo.getPageno(); 
		ntvo.setPageno(page);
		
		List<NtBoardVO> ntList =  ntBoardService.ntBoardList(ntvo);
			System.out.println("NtBoardController.ntBoardList ntList confirm >>> : " + ntList);
			System.out.println("NtBoardController.ntBoardList ntList.size() confirm >>> : " + ntList.size());
		
		ModelAndView mav = new ModelAndView();
		
		Map map = new HashMap();
		map.put("pageno", page);
			System.out.println("NtBoardController.ntBoardList pageno confirm >>> : " + page);
		map.put("totalcount", ntList.size());
			System.out.println("NtBoardController.ntBoardList ntList.size() confirm >>> : " + ntList.size());
		
		List pagingList = ntBoardService.ntBoardListCount(map);
			System.out.println("NtBoardController.ntBoardList pagingList confirm >>> : " + pagingList);
			System.out.println("NtBoardController.ntBoardList pagingList.size() confirm >>> : " + pagingList.size());
		
			if(pagingList != null && pagingList.size() > 0 ) {
				mav.addObject("listCc", pagingList.get(0));
				
				for(int j=0; j<pagingList.size(); j++) {
					NtBoardVO pgVo = null;
					pgVo = (NtBoardVO)pagingList.get(j);
					totalCount = Integer.valueOf(pgVo.getTotalcount());
						System.out.println("NtBoardController.ntBoardList totalCount confirm >>> : " + totalCount);
					pageNum = page;
						System.out.println("NtBoardController.ntBoardList pageNum confirm >>> : " + pageNum);
				}//End of for block
				
				int[] rlt = Paging.getPagingNum(totalCount, pageNum);
					System.out.println("NtBoardController.ntBoardList rlt confirm >>> : " + rlt);
				
					if(rlt.length == 4) {
						startPage = rlt[0];
						endPage = rlt[1];
						totalPage = rlt[2];
						page = rlt[3];
							System.out.println("NtBoardController.ntBoardList startPage confirm >>> : " + startPage);
							System.out.println("NtBoardController.ntBoardList endPage confirm >>> :" + endPage);
							System.out.println("NtBoardController.ntBoardList totalPage confirm >>> :" + totalPage);
							System.out.println("NtBoardController.ntBoardList page confirm >>> :" + page);
					}//End of if block
				mav.addObject("startPage", startPage);
				mav.addObject("endPage", endPage);
				mav.addObject("totalPage", totalPage);
				mav.addObject("page", page);
				mav.addObject("ntBoardLists", ntList);
				mav.addObject("ntBoardListCont",ntList);
				mav.addObject("ntsearchcondition", ntvo.getNtsearchcondition());
				mav.addObject("ntsearchkeyword", ntvo.getNtsearchkeyword());
				mav.addObject("ntBoardListAll", ntvo);
			} else {
				System.out.println("NtBoardController.ntBoardList pagingList null");
			}//End of if block
		mav.setViewName(CONTEXT_PATH + "/ntBoardList");
			
		return mav;
	}//End of ntBoardList method block
			
	//Notice Insert Write Form Page
	@RequestMapping("/ntBoardSelect") 
	public ModelAndView ntBoardSelect(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("NtBoardController.ntBoardSelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
		
		if (ntvo.getNtno().equals("")) {
			mav.addObject("ntMode","ntInsert");
		} else {
			mav.addObject("NtBoardUpdate", ntBoardService.ntBoardDetail(ntvo));
			mav.addObject("ntMode", "ntUpdate");
		  }
		mav.setViewName(CONTEXT_PATH + "/ntBoardInsert");
		return mav;
	}
	
	//Notice Insert Page
	@RequestMapping("/ntBoardInsert") 
	public ModelAndView ntBoardInsert(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("NtBoardController.ntBoardInsert SUCCESS >>> : ");
						
		ntvo.setNthit("0");
						
		String ntResultStr = "";
		int result = ntBoardService.ntBoardInsert(ntvo);

		if(result > 0) {
			ntResultStr = "Post registration was successful.";
		} else {
			ntResultStr = "Post registration failed.";
		}//End of if block
						
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ntResultStr);
		mav.setViewName(CONTEXT_PATH + "/ntResult");
					
		return mav;
	}//End of ntBoardInser method block
		
	//Notice Detail Page
	@RequestMapping("/ntBoardDetail")
	public ModelAndView ntBoardDetail(@ModelAttribute NtBoardVO ntvo, HttpServletRequest request, 
									  HttpServletResponse response, HttpSession session) {
		System.out.println("NtBoardController.ntBoardDetail SUCCESS >>> : ");
		System.out.println("NtBoardController.ntBoardDetail ntvo.getNtno() >>> : " + ntvo.getNtno());
	  	
		//setting for hit Start
		//get saved cookie
		Cookie[] ntCookie = request.getCookies();
		String ntCookieValue = null;
			
			for(int i=0; i<ntCookie.length; i++) {
				ntCookieValue = ntCookie[0].getValue();
				System.out.println("NtBoardController.ntBoardDetail ntCookieValue confirm >>> : " + ntCookieValue);
			}//End of for block
			
			//cookie insert session
			if(session.getAttribute(ntvo.getNtno() + ":cookie") == null) {
				session.setAttribute(ntvo.getNtno() + ":cookie", ntvo.getNtno() + ":" + ntCookieValue );
			} else { 
				 session.setAttribute(ntvo.getNtno() + ":cookie ex", session.getAttribute(ntvo.getNtno() + ":cookie"));
				 
				 if(!session.getAttribute(ntvo.getNtno() + ":cookie").equals(ntvo.getNtno() + ":" + ntCookieValue)) {
			            session.setAttribute(ntvo.getNtno() + ":cookie", ntvo.getNtno() + ":" + ntCookieValue);
			     }//End of if block
			}//End of if block
			
			if(!session.getAttribute(ntvo.getNtno() + ":cookie").equals(session.getAttribute(ntvo.getNtno() + ":cookie ex"))) {
		         int resultSession = ntBoardService.ntUpdateViewCnt(ntvo);
		    }//End of if block
		//setting for hit End
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ntBoardDetail",ntBoardService.ntBoardDetail(ntvo)); 
	  	mav.setViewName(CONTEXT_PATH + "/ntBoardDetail");
	  		System.out.println("NtBoardController.ntBoardDetail session1 >>> : " + session.getAttribute(ntvo.getNtno() + ":cookie"));
	  		System.out.println("NtBoardController.ntBoardDetail session2 >>> : " + session.getAttribute(ntvo.getNtno() + ":cookie ex")); 
	  	
	    return mav;
	}//End of ntBoardDetail method block

	//Notice Update Page
	@RequestMapping("/ntBoardUpdate")
	public ModelAndView ntBoardUpdate(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("NtBoardController.ntBoardUpdate SUCCESS >>> : ");
		System.out.println("NtBoardController.ntBoardUpdate ntno confirm >>> :  "+ ntvo.getNtno());
	      
		String ntResultStr ="";
		int result =  ntBoardService.ntBoardUpdate(ntvo);
		
		if (result > 0) {
			ntResultStr = "Post edit was successful.";
		} else {
			ntResultStr = "Editing post failed.";
		}//End of if block
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ntResultStr);
		mav.setViewName(CONTEXT_PATH + "/ntResult");
	    
		return mav;
	}//End of ntBoardUpdate method block
	   
	//Notice Delete Page
	@RequestMapping("/ntBoardDelete")
	public ModelAndView ntBoardDelete(@ModelAttribute NtBoardVO ntvo) {
		System.out.println("NtBoardController.ntBoardDelete SUCCESS >>> : ");
		 
		String ntResultStr ="";
	    int result = ntBoardService.ntBoardDelete(ntvo);
	      
	    if (result > 0) {
	    	ntResultStr = "Successfully deleted post.";
		} else {
			ntResultStr = "Deleting a post failed.";
		}//End of if block
	      
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("result", ntResultStr);
	    mav.setViewName(CONTEXT_PATH + "/ntResult");
	     
	    return mav;
	}//End of ntBoardDelete method block
}//End of NtBoardController class block

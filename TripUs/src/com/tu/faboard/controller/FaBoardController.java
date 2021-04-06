package com.tu.faboard.controller;

/**
FileName (파일명): FaBoardController.java
Explanation (설명): FaBoardController page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.Paging;
import com.tu.faboard.service.FaBoardService;
import com.tu.faboard.vo.FaVO;

@Controller
@RequestMapping(value="/faq")
public class FaBoardController{
		
	//constructor field
	private static final String CONTEXT_PATH = "faq";
	
	@Autowired 
	private FaBoardService faBoardService;
	
	//FAQ Main Page
	@RequestMapping("/faBoardList") 
	public ModelAndView faBoardList(@ModelAttribute FaVO fvo, HttpServletRequest request) {
		System.out.println("FaBoardController.faBoardList SUCCESS >>> : ");
		System.out.println("FaBoardController.faBoardList fvo value confirm >>> : " + fvo);
		System.out.println("FaBoardController.faBoardList fvo.getFasearchcondition() value confirm >>> : " + fvo.getFasearchcondition());
		System.out.println("FaBoardController.faBoardList request.getParameter(fasitename) confirm >>> : " + request.getParameter("fasitename"));
	
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
			System.out.println("FaBoardController.faBoardList pageno confirm >>> : " + page);
		
		map.put("totalcount", faList.size());
			System.out.println("FaBoardController.faBoardList totalcount confirm >>> : " + faList.size());
			
		List pagingList = faBoardService.faBoardListCount(map);
			System.out.println("FaBoardController.faBoardList pagingList confirm >>> : " + pagingList);
			System.out.println("FaBoardController.faBoardList pagingList.size() cofirm >>> : " + pagingList.size());
	
		if(pagingList != null && pagingList.size() > 0 ) {
			mav.addObject("listCc", pagingList.get(0));

			for(int j=0; j< pagingList.size(); j++) {
				FaVO pgVo = null;
				pgVo = (FaVO)pagingList.get(j);
				totalCount = Integer.valueOf(pgVo.getTotalcount());
					System.out.println("FaBoardController.faBoardList totalCount confirm >>> : " + totalCount);
				pageNum = page;
					System.out.println("FaBoardController.faBoardList pageNum cofirm >>> : " + pageNum);
			}//End of for block
			
			int[] rlt = Paging.getPagingNum(totalCount, pageNum);
				System.out.println("FaBoardController.faBoardList rlt cofirm >>> : " + rlt);
				
				if(rlt.length == 4) {
					startPage = rlt[0];
					endPage = rlt[1];
					totalPage = rlt[2];
					page = rlt[3];
						System.out.println("FaBoardController.faBoardList startPage cofirm >>> : "+ startPage);
						System.out.println("FaBoardController.faBoardList endPage cofirm >>> : "+ endPage);
						System.out.println("FaBoardController.faBoardList totalPage cofirm >>> : "+ totalPage);
						System.out.println("FaBoardController.faBoardList page cofirm >>> : "+ page);
				}//End of if block
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			mav.addObject("page", page);
			mav.addObject("faBoardLists", faList);
			mav.addObject("faBoardListCount", faList.size());
			mav.addObject("faBoardListAll", fvo);
			mav.addObject("fasearchcondition", fvo.getFasearchcondition());
			mav.addObject("fasearchkeyword", fvo.getFasearchkeyword());
		} else {
			System.out.println("pagingList null");
		}//End of if block
		mav.setViewName(CONTEXT_PATH + "/faBoardList");
		
		return mav;
	}//End of faBoardList method block
	
	//FAQ Insert Write Form page 
	@RequestMapping("/faBoardSelect") 
	public ModelAndView faBoardSelect(@ModelAttribute FaVO fvo, HttpServletRequest request) {
		System.out.println("FaBoardController.faBoardSelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
			
			if(fvo.getFano().equals("")) {
				mav.addObject("faMode","faInsert");
			} else {
				mav.addObject("FaVo",faBoardService.faBoardSelect(fvo));
				
				if(request.getParameter("faMode").equals("faUpdate")){
					mav.addObject("faMode", "faUpdate");
				} else {
					mav.addObject("faMode", "faDelete");
				}//End of if block
			}//End of if block
		mav.setViewName(CONTEXT_PATH + "/faBoardWrite");
			
		return mav;
	}//End of faBoardSelect method block
		
	//FAQ Insert Page
	@RequestMapping("/faBoardInsert")
	public ModelAndView faBoardInsert(@ModelAttribute FaVO fvo) {
		System.out.println("FaBoardController.faBoardInsert SUCCESS >>> : ");
		
		String faResultStr = "";
		int result = faBoardService.faBoardInsert(fvo);
		
			if(result > 0) {
				faResultStr = "Post registration was successful.";
			} else {
				faResultStr = "Post registration failed.";
			}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/faResult");
		
		return mav;
	}//End of faBoardInsert method block
	
	//FAQ Update Page
	@RequestMapping("/faBoardUpdate")
	public ModelAndView faBoardUpdate(@ModelAttribute FaVO fvo) {
		System.out.println("FaBoardController.faBoardUpdate SUCCESS >>> : ");
		
		String faResultStr = "";
		int result = faBoardService.faBoardUpdate(fvo);
			
			if(result > 0) {
				faResultStr = "Post edit was successful.";
			} else {
				faResultStr = "Editing post failed.";
			}//End of if block
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/faResult");
	
		return mav;
	}//End of faBoardUpdate method block
		
	//FAQ Delete Page
	@RequestMapping("/faBoardDelete")
	public ModelAndView faBoardDelete(@ModelAttribute FaVO fvo) {
		System.out.println("FaBoardController.faBoardDelete SUCCESS >>> : ");
			
		String faResultStr = "";
		int result = faBoardService.faBoardDelete(fvo);
			
			if(result > 0) {
				faResultStr = "Successfully deleted post.";
			} else {
				faResultStr = "Successfully deleted post.";
			}//End of if block
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/faResult");
	
		return mav;
	}//End of faBoardDelete method block
}//End of FaBoardController class block
	

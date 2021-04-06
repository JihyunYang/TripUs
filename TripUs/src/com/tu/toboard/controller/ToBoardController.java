package com.tu.toboard.controller;

/**
FileName (파일명) : ToBoardController.java
Explanation (설명): ToBoardController page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
*/

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tu.comment.vo.CommentVO;
import com.tu.toboard.service.ToBoardService;
import com.tu.toboard.vo.ToBoardVO;

@Controller
@RequestMapping(value = "/toBoard")
public class ToBoardController {
	
	//constructor field
	private static final String CONTEXT_PATH = "toBoard";

	@Autowired
	private ToBoardService toBoardService;

	//Tour Main Page
	@RequestMapping(value="/toBoardList")
	public ModelAndView toBoardList(@ModelAttribute ToBoardVO tovo) {
		System.out.println("Controller.toBoardList SUCCESS >>> : ");
	
		List<ToBoardVO> toList1 = toBoardService.toBoardList(tovo);
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("toBoardList", toList1);
		mav.setViewName(CONTEXT_PATH + "/toBoardList");
		
		return mav;
	}//End of toBoardList method block
	
	//Tour ResAreaSub Page
	@RequestMapping(value = "/resAreaSub", produces = "application/json; charset=UTF8")
	@ResponseBody
	public ModelAndView goAreaSelectPage(int areaCode,int sigunguCode) {
		System.out.println("Controller.goAreaSelectPage SUCCESS >>> : ");
		System.out.print("Controller.goAreaSelectPage.areaCode confirm >>> : " + areaCode);
		System.out.print("Controller.goAreaSelectPage.sigunguCode confirm >>> : " + sigunguCode);

		ModelAndView mav = new ModelAndView();

		mav.addObject("sigunguCode", sigunguCode);
		mav.addObject("areaCode", areaCode);
		mav.setViewName(CONTEXT_PATH + "/resAreaSub");
		
		return mav;
	}//End of goAreaSelectPage method block
	
	//Tour Detail page
	@RequestMapping(value = "/toBoardDetail", produces = "application/json; charset=UTF8")
	public ModelAndView toBoardDetail(int contentid) {
		System.out.println("Controller.toBoardDetail SUCCESS >>> : ");
		System.out.println("Controller.toBoardDetail.contentid confirm >>> : " + contentid);
		
		/*The value contained in ModelAndview can be used by going to jsp and using EL format
		 (ModelAndview에 담긴 값은 jsp에 가서 EL형식을 이용해서 사용할 수 있다)*/
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentid", contentid);
		mav.setViewName(CONTEXT_PATH + "/toBoardDetail");
				
		return mav;
	}//End of toBoardDetail method block
}//End of ToBoardController class block

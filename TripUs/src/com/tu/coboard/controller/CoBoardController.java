package com.tu.coboard.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tu.coboard.service.CoBoardService;
import com.tu.coboard.vo.CoBoardVO;

/**
클래스명 : CoBoardController
날 짜 : 2019-09-03
작성자명 : 김 해 원
*/

@Controller
@RequestMapping(value="/coBoard")
public class CoBoardController {
	private static final String CONTEXT_PATH="coBoard";
		
	@Autowired
	private CoBoardService coBoardService;
	
	//Recommended Course Main Page
	@RequestMapping(value="/coRecommendMainBoard")
	public ModelAndView coRecommendMainBoard(@ModelAttribute CoBoardVO cvo) {
		System.out.println("Controller.coRecommendMainBoard SUCCESS >>> : ");
				
		List<CoBoardVO> coList = coBoardService.coRecommendMainBoard(cvo);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("coRecommendMainBoard", coList);
		mav.setViewName(CONTEXT_PATH + "/coRecommendMainBoard");
			
		return mav;
	}//end of recommendMainBoard method block
		
	
	
	@RequestMapping(value="/goBoard", produces = "application/json; charset=utf8")
	public ModelAndView goBoardPage(@ModelAttribute CoBoardVO cvo){
		System.out.println("controller�쓽 goBoardPage吏꾩엯");
		List<CoBoardVO> list = new ArrayList<CoBoardVO>();
		list = coBoardService.selectContentID(cvo);
		System.out.println("list: " +list);
		CoBoardVO cVO1 = new CoBoardVO();
		cVO1 = list.get(0);
		System.out.println("cVO1 : "+cVO1.toString());
		String contentid = cVO1.getContentid();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/board");
		mav.addObject("viewno",cvo.getViewno());
		mav.addObject("contentid",contentid);
		return mav;
	}
	@RequestMapping(value="/goCourseMain")
	public ModelAndView goCourseMainPage(@ModelAttribute CoBoardVO cvo){
		System.out.println("controller�쓽 goCourseMainPage吏꾩엯");
		List<CoBoardVO> list = coBoardService.coBoardList(cvo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/courseMain");
		mav.addObject("coBoardList",list);
		
		return mav;
	}
	@RequestMapping(value="/goMap")
	public ModelAndView goMapPage(@ModelAttribute CoBoardVO cvo){
		System.out.println("controller�쓽 goMapPage吏꾩엯");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/map");
		
		return mav;
	}
	
	// 吏��뿭蹂� �젙蹂� 由ъ뒪�듃 �솕硫댁쑝濡� �씠�룞
	@RequestMapping(value="/coAreaSub", produces = "application/json; charset=utf8")
	@ResponseBody
	public ModelAndView coAreaSubPage(int areaCode){
		System.out.println("controller�쓽  coAreaSubPage 吏꾩엯 >>> ");
		System.out.println("coAreaSubPage > areaCode >>> " + areaCode);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/coAreaSub");
		mav.addObject("areaCode",areaCode);
		return mav;
	}
	
	// 肄붿뒪> 吏��뿭 > �긽�꽭�럹�씠吏� �씠�룞
	@RequestMapping(value="/goAreaBoard", produces = "application/json; charset=utf8")
	public ModelAndView goAreaBoardPage(int contentid){
		System.out.println("controller�쓽 goAreaBoardPage吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		System.out.println("contentid : " + contentid);
		mav.setViewName(CONTEXT_PATH+"/coAreaBoard");
		mav.addObject("contentid",contentid);
		return mav;
		}
}

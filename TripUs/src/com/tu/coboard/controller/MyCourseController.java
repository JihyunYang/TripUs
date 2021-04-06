package com.tu.coboard.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tu.coboard.service.MyCourseService;
import com.tu.coboard.vo.MyCourseVO;


/**
클래스명 : MyCourseController
날 짜 : 2019-09-10
작성자명 : 김 해 원
*/


@Controller
@RequestMapping(value="/myCourse")
public class MyCourseController {
	private static final String CONTEXT_PATH="myCourse";
		
	@Autowired
	private MyCourseService myCourseService;
	
		
	@RequestMapping("/plusCourse")
	@ResponseBody
	public String plusCourse(@ModelAttribute MyCourseVO mvo,Model model,HttpServletRequest request){
		System.out.println("controller의 plusCourse진입");
		System.out.println("컨트롤러로 넘어온 mcitem : "+mvo.getMcitem());
		System.out.println("컨트롤러로 넘어온 mctitle : "+mvo.getMctitle());
		System.out.println("컨트롤러로 넘어온 mccontentid : "+mvo.getMccontentid());
		HttpSession session = request.getSession();
		String mid =(String)session.getAttribute("mid");
		mvo.setMcid(mid);
		System.out.println("mvo : "+mvo);
		int result = myCourseService.insertCourse(mvo);
		System.out.println("result : "+result);
		if(result ==1){
			return "true";
		}else{
			return "false";
		}
		
	}
	@RequestMapping("/updateCourse")
	@ResponseBody
	public String updateCourse(@ModelAttribute MyCourseVO mvo,Model model,HttpServletRequest request){
		System.out.println("controller의 updateCourse진입");
		System.out.println("컨트롤러로 넘어온 mcno : "+mvo.getMcno());
		System.out.println("컨트롤러로 넘어온 mcitem : "+mvo.getMcitem());
		System.out.println("컨트롤러로 넘어온 mctitle : "+mvo.getMctitle());
		System.out.println("컨트롤러로 넘어온 mccontentid : "+mvo.getMccontentid());
		System.out.println("컨트롤러로 너어온 삭제할 id : "+mvo.getId());
		int item = Integer.parseInt(mvo.getMcitem());
		int index = Integer.parseInt(mvo.getId());
		String contentid = mvo.getMccontentid();
		String[] cont = contentid.split(",");
		String result ="";
		for(int i=0; i<item; i++){
			if(i!=index){
				result+=cont[i];
			}
			if(i!=item-1 && i!=index){
				result+=",";
			}
		}
		item--;
		System.out.println(index+"번째 원소 뺀 contentid : "+result);
		mvo.setMcitem(String.valueOf(item));
		mvo.setMccontentid(result);
		model.addAttribute("mcno",mvo.getMcno());
		model.addAttribute("mcitem",mvo.getMcitem());
		model.addAttribute("mccontentid",mvo.getMccontentid());
		int result1 = myCourseService.updateCourse(mvo);
		System.out.println("result1 : "+result1);
		if(result1 ==1){
			return "true";
		}else{
			return "false";
		}
		
	}
	
	
	@RequestMapping(value="/goMyCourseMain")
	public ModelAndView goMyCourseMainPage(@ModelAttribute MyCourseVO mvo,HttpServletRequest request){
		System.out.println("controller의 goMyCourseMainPage진입");
		HttpSession session = request.getSession();
		String mid =(String)session.getAttribute("mid");
		
		ModelAndView mav = new ModelAndView();
		if(mid!=null){//로그인 한 경우
			System.out.println("세션에 저장된 mid : "+mid);
			mvo.setMcid(mid);
			
			List<MyCourseVO> list = myCourseService.myCourseList(mvo);
			System.out.println("myCourseList함수 실행 후 결과 list : "+list);
			mav.addObject("myCourseList",list);
		}else{//로그인 안 한 경우
			mav.addObject("myCourseList","DOLOGIN");
		}
		mav.setViewName(CONTEXT_PATH+"/myCourseMain");
		
		return mav;
	}
	
	@RequestMapping(value="/goMcBoard", produces = "application/json; charset=utf8")
	public ModelAndView goMcBoardPage(@ModelAttribute MyCourseVO mvo){
		System.out.println("controller의 goMcBoardPage진입");
	
		System.out.println("컨트롤러로 들어온 mcno : "+mvo.getMcno()+" , mcitem : "+mvo.getMcitem()+" , mccontentid : "+mvo.getMccontentid());
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/mcBoard");
		mav.addObject("mcno",mvo.getMcno());
		mav.addObject("mcitem",mvo.getMcitem());
		mav.addObject("mccontentid",mvo.getMccontentid());
		return mav;
	}
	@RequestMapping(value="/goDIY", produces = "application/json; charset=utf8")
	public ModelAndView goDIYPage(@ModelAttribute MyCourseVO mvo){
		System.out.println("controller의 goDIYPage진입");
	
		System.out.println("컨트롤러로 들어온 mcno : "+mvo.getMcno()+" , mcitem : "+mvo.getMcitem()+" , mccontentid : "+mvo.getMccontentid());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/diy");
		mav.addObject("mcno",mvo.getMcno());
		mav.addObject("mcitem",mvo.getMcitem());
		mav.addObject("mccontentid",mvo.getMccontentid());
		return mav;
	}
	@RequestMapping(value="/goMap")
	public ModelAndView goMapPage(@ModelAttribute MyCourseVO mvo){
		System.out.println("controller의 goMapPage진입");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/map");
		
		return mav;
	}
}

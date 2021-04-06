package com.tu.lp.controller;

/**
�겢�옒�뒪紐� : LoginController
�궇 吏� : 2019-08-27
�옉�꽦�옄紐� : 源� �빐 �썝
*/

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mail.GenerateCertNumber;
import com.tu.coboard.vo.CoBoardVO;
import com.tu.lp.service.LoginService;
import com.tu.mem.vo.MemberVO;

@Controller
@RequestMapping(value="/login")
public class LoginController{
	private static final String CONTEXT_PATH="login";
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/memberLogin")
	@ResponseBody
	public String memberLogin(@ModelAttribute MemberVO mvo,HttpServletRequest request){
		System.out.println("controller�쓽 memberLogin吏꾩엯");
		System.out.println("而⑦듃濡ㅻ윭濡� �꽆�뼱�삩 �엯�젰�븳 mid : "+mvo.getMid());
		System.out.println("而⑦듃濡ㅻ윭濡� �꽆�뼱�삩 �엯�젰�븳 mpw : "+mvo.getMpw());
		
		HttpSession session = request.getSession();
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = loginService.login(mvo);
		int size=list.size();
		System.out.println("list : "+list);
		System.out.println("list.size() : "+size);
		
		
		if(size ==1){
			MemberVO mVO1 = new MemberVO();
			mVO1 = list.get(0);
			System.out.println("mVO1 : "+mVO1.toString());
			String mno = mVO1.getMno();
			String mname = mVO1.getMname();
			String mgrade = mVO1.getMgrade();
			String memail = mVO1.getMemail();
			String mid = mVO1.getMid();
			String mnick = mVO1.getMnick();
			String mprofile = mVO1.getMprofile();
			session.setAttribute("mno",mno);
			session.setAttribute("mid", mid);
			session.setAttribute("mname", mname);
			session.setAttribute("mgrade",mgrade);
			session.setAttribute("memail",memail);
			session.setAttribute("mnick",mnick);
			session.setAttribute("mprofile",mprofile);
			return "true";
		}
		else{
			return "false";
		}
	}
	@RequestMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(@ModelAttribute MemberVO mvo,Model model){
		
		System.out.println("controller�쓽 emailCheck吏꾩엯");
		System.out.println("而⑦듃濡ㅻ윭濡� �꽆�뼱�삩 �엯�젰�븳 memail : "+mvo.getMemail());
		List<MemberVO> list = loginService.emailCheck(mvo);
		
		if(list.size() ==1){
			GenerateCertNumber gcn = new GenerateCertNumber();
			String num = gcn.excuteGenerate();
			return num;
		}
		else{
			return "false";
		}
	}
	@RequestMapping("/equalCheck")
	@ResponseBody
	public String equalCheck(@ModelAttribute MemberVO mvo,Model model){

		System.out.println("controller�쓽 equalCheck吏꾩엯");
		List<MemberVO> list = loginService.searchPW(mvo);
		
		if(list.size() ==1){
			GenerateCertNumber gcn = new GenerateCertNumber();
			String num = gcn.excuteGenerate();
			return num;
		}
		else{
			return "false";
		}
	}
	@RequestMapping("/changePW")
	@ResponseBody
	public String changePW(@ModelAttribute MemberVO mvo,Model model){
		String resultStr="";
		System.out.println("controller�쓽 changePW吏꾩엯");
		int result = loginService.changePW(mvo);
		System.out.println("changePW�쓽 result : "+result);
		if(result >0) resultStr="Complete!";
		else resultStr="FALSE.....";

		
			return resultStr;
		
	}
	@RequestMapping("/logout")
	public ModelAndView logout(@ModelAttribute MemberVO mvo,HttpServletRequest request){
		System.out.println("controller�쓽 logout吏꾩엯");
		
		HttpSession hs = request.getSession(true);
		String mid =(String)hs.getAttribute("mid");

		ModelAndView mav = new ModelAndView();
		if(mid==null){
			System.out.println("濡쒓렇�씤 �븞�릺�뼱�엳�쓬!");
			mav.addObject("result","�꽭�뀡�뾾�쓬");
		}
		else{
			System.out.println("濡쒓렇�븘�썐 �븷 mid : "+mid);
			hs.invalidate();
			System.out.println("hs �궘�젣�븿");
			System.out.println("濡쒓렇�븘�썐 �꽦怨�");
			mav.addObject("result","濡쒓렇�븘�썐�꽦怨�");
		}
		mav.setViewName("../../main");

		return mav;
	}

	@RequestMapping("/memberDelete")
	@ResponseBody
	public String memberDelete(@ModelAttribute MemberVO mvo,Model model,HttpServletRequest request){
		System.out.println("controller�쓽 delete吏꾩엯");
		HttpSession hs = request.getSession(true);
		String resultStr="";
		int result = loginService.memberDelete(mvo);
		
		if(result>0){ resultStr="TRUE"; hs.invalidate();}
		else resultStr= "FALSE";
		
		return resultStr;
	}
	
	/*
	 * --------------------�씠�룞 紐⑹쟻 �븿�닔�뱾-------------------------
	 */
	//濡쒓렇�씤�뤌 遺�瑜대뒗 �븿�닔
	@RequestMapping("/goLogin")
	public ModelAndView goLogin(){
		System.out.println("controller�쓽 goLogin吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/login");
		//�꽭�뀡 �엳�쑝硫� 濡쒓렇�씤�럹�씠吏�濡� �젒洹� 紐삵븯�룄濡� �꽭�뀡�쟻�슜�맂寃� �궗�슜�빐�빞�븿!!(�굹以묒뿉)

		return mav;
	}
	@RequestMapping("/goIdFindPrint")
	public ModelAndView goIdFindPrintPage(@ModelAttribute MemberVO mvo){
		System.out.println("controller�쓽 goIdFindPrintPage吏꾩엯");
		List<MemberVO> list = loginService.searchID(mvo);
		ModelAndView mav = new ModelAndView();
		System.out.println("print媛��뒗 而⑦듃濡ㅻ윭濡� �뱾�뼱�삩 email : "+mvo.getMemail());
		mav.addObject("searchIDList",list);
		mav.setViewName(CONTEXT_PATH+"/idFindPrint");

		return mav;
	}
	@RequestMapping("/goSendMail")
	public ModelAndView goSendMailPage(@ModelAttribute MemberVO mvo){
		System.out.println("controller�쓽 goSendMailPage吏꾩엯");
		List<MemberVO> list = loginService.searchID(mvo);
		ModelAndView mav = new ModelAndView();
		String memail = mvo.getMemail();
		System.out.println("semdMail濡� 媛��뒗 memail : "+memail);
		System.out.println("sendMail媛��뒗 而⑦듃濡ㅻ윭濡� �뱾�뼱�삩 number : "+mvo.getNumber());
		mav.addObject("searchIDList",list);
		mav.addObject("memail",memail);
		mav.setViewName(CONTEXT_PATH+"/sendMail");

		return mav;
	}
	//濡쒓렇�씤�럹�씠吏�濡� 媛��뒗 �븿�닔
	@RequestMapping("/loginPage")
	public ModelAndView goLoginPage(){
		System.out.println("controller�쓽 goLoginPage吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/memberLogin");
		//�꽭�뀡 �엳�쑝硫� 濡쒓렇�씤�럹�씠吏�濡� �젒洹� 紐삵븯�룄濡� �꽭�뀡�쟻�슜�맂寃� �궗�슜�빐�빞�븿!!(�굹以묒뿉)

		return mav;
	}
	//id李얘린 �럹�씠吏�濡� 媛��뒗 �븿�닔
	@RequestMapping("/goIdFind")
	public ModelAndView goIdFindPage(){
		System.out.println("controller�쓽 goIdFindPage吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/idFind");

		return mav;
	}
	//id李얘린 �떆 硫붿씪�솗�씤李�(�럹�씠吏�)濡� 媛��뒗 �븿�닔
	@RequestMapping("/goTestMail")
	public ModelAndView goTestMailPage(@ModelAttribute MemberVO mvo){
		System.out.println("controller�쓽 goTestMailPage吏꾩엯");
		String number = mvo.getNumber();
		String memail = mvo.getMemail();
		System.out.println("而⑦듃濡ㅻ윭濡� �뱾�뼱�삩 memail : "+memail);
		System.out.println("而⑦듃濡ㅻ윭濡� 諛쏆븘�삩 number : "+number);
		ModelAndView mav = new ModelAndView();
		mav.addObject("number",number);
		mav.addObject("memail",memail);
		mav.setViewName(CONTEXT_PATH+"/test_mail");

		return mav;
	}
	//PW李얘린 �럹�씠吏�濡� 媛��뒗 �븿�닔
	@RequestMapping("/goSearchPW")
	public ModelAndView goSearchPWPage(){
		System.out.println("controller�쓽 goSearchPWPage吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/pwFind");

		return mav;
	}
	//index.jsp 濡� 媛��뒗 �븿�닔
	@RequestMapping("/goIndex")
	public ModelAndView goIndexPage(){
		System.out.println("Controller�쓽 goIndexPage吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../../main");
		return mav;
	}
	//DeleteNotice.jsp 濡� 媛��뒗 �븿�닔
	@RequestMapping("/goDeleteNotice")
	public ModelAndView goDeleteNoticePage(){
		System.out.println("Controller�쓽 goDeleteNoticePage吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/deleteNotice");
		return mav;
	}
	//DeleteNotice.jsp 濡� 媛��뒗 �븿�닔
	@RequestMapping("/goMemberDelete")
	public ModelAndView goMemberDeletePage(){
		System.out.println("Controller�쓽 goMemberDeletePage吏꾩엯");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/memberDelete");
		return mav;
	}
}
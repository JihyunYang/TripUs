package com.tu.lp.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.tu.lp.oauth.bo.NaverLoginBO;

@Controller
@RequestMapping(value = "/login")
public class NaverLoginController {
	private static final String CONTEXT_PATH="login";
	
	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;

	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	
	 //로그인 첫 화면 요청 메소드
	@RequestMapping(value="/naverLogin",method = { RequestMethod.GET, RequestMethod.POST })
		public String naverLogin(Model model, HttpSession session) {
			System.out.println("NaverLoginController naverLogin() >>> ");
	        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	        System.out.println("NaverLoginController naverLogin() naverAuthUrl >>> " + naverAuthUrl);
	        //네이버 
	        model.addAttribute("url", naverAuthUrl);
	        /* 생성한 인증 URL을 View로 전달 */
	        return CONTEXT_PATH+"/naverlogin";
	    }
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value="/callback")
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		System.out.println("NaverLoginController callback() >>> ");
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		// 로그인한 사용자의 모든 정보가 JSON타입으로 저장되어 있음
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		
		// 내가 원하는 정보 (이름)만 JSON타입에서 String타입으로 바꿔 가져오기 위한 작업
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(apiResult);
			System.out.println("obj >>> " + obj);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return new ModelAndView(CONTEXT_PATH+"/callback", "result", apiResult);
	}
	
}

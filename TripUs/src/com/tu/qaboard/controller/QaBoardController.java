package com.tu.qaboard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.tu.qaboard.service.QaBoardService;
import com.tu.qaboard.vo.QaBoardVO;

@Controller
@RequestMapping(value = "/qna")
public class QaBoardController {
	
	//constructor field
	private static final String CONTEXT_PATH = "qna";
	
	@Autowired
	private QaBoardService qaBoardService;
	
	//full post page
	@RequestMapping("/qaBoardList")
	public ModelAndView qaBoardList(@ModelAttribute QaBoardVO qavo) {
		System.out.println("QaBoardController.qaBoardList SUCCESS >>> : ");
		
		int pageNum = 0;
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		
		page = qavo.getPageno()== 0? startPage : qavo.getPageno(); 
		qavo.setPageno(page);
		
		List<QaBoardVO> qaList = qaBoardService.qaBoardList(qavo);
			System.out.println("QaBoardController.qaBoardList qaList confirm >>> : " + qaList);
			System.out.println("QaBoardController.qaBoardList qaList.size confirm >>> : " + qaList.size());
		
		ModelAndView mav = new ModelAndView();
	
		Map map = new HashMap();
		map.put("pageno", page);
			System.out.println("QaBoardController.qaBoardList pageno confirm >>> : " + page);
			
		map.put("totalcount", qaList.size());
			System.out.println("QaBoardController.qaBoardList totalcount confirm >>> : " + qaList.size());
		
		List pagingList = qaBoardService.qaBoardListCount(map);
			System.out.println("QaBoardController.qaBoardList pagingList confirm >>> : " + pagingList);
			System.out.println("QaBoardController.qaBoardList pagingList.size() confirm >>> : " + pagingList.size());
		
			if(pagingList != null && pagingList.size() > 0 ) {
				mav.addObject("listCc", pagingList.get(0));
			
				for(int j=0; j< pagingList.size(); j++) {
					QaBoardVO pgVo = null;
					pgVo = (QaBoardVO)pagingList.get(j);
					totalCount = Integer.valueOf(pgVo.getTotalcount());
						System.out.println("QaBoardController.qaBoardList totalCount confirm >>> : " + totalCount);
					pageNum = page;
						System.out.println("QaBoardController.qaBoardList pageNum confirm >>> : " + pageNum);
				}//End of for block
			
				int[] rlt = Paging.getPagingNum(totalCount, pageNum);
					System.out.println("QaBoardController.qaBoardList rlt confirm >>> : " + rlt);
			
				if(rlt.length == 4) {
					startPage = rlt[0];
					endPage = rlt[1];
					totalPage = rlt[2];
					page = rlt[3];
						System.out.println("QaBoardController.qaBoardList startPage confirm >>> : " + startPage);
						System.out.println("QaBoardController.qaBoardList endPage confirm >>> : " + endPage);
						System.out.println("QaBoardController.qaBoardList totalPage confirm >>> : " + totalPage);
						System.out.println("QaBoardController.qaBoardList page confirm >>> : " + page);
				}//End of if block
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
			} else {
				System.out.println("QaBoardController.qaBoardList pagingList null");
			}//End of if block
		mav.setViewName(CONTEXT_PATH + "/qaBoardList"); 
		
		return mav ;
	}//End of qaBoardList method block
	
	//QnA Insert Write Form page
	@RequestMapping("/qaBoardSelect")
	public ModelAndView qaBoardSelect(@ModelAttribute QaBoardVO qavo) {
		System.out.println("QaBoardController.qaBoardSelect SUCCESS >>> : ");
		
		ModelAndView mav = new ModelAndView();
			//To distinguish buttons (버튼을 구별)
			if(qavo.getQano().equals("")) {
				mav.addObject("qaMode", "qaInsert");
			} else {
				mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
				mav.addObject("qaMode", "qaUpdate");
			}//End of if block
		mav.setViewName(CONTEXT_PATH + "/qaBoardInsert");
		
		return mav;
	}//End of qaBoardSelect method block
	
	//QnA Insert Page 
		@RequestMapping("/qaBoardInsert") 
		//MultipartFile file need for fileupload set
		public ModelAndView qaBoardInsert(@ModelAttribute QaBoardVO qavo, MultipartFile file,HttpServletRequest request) throws IOException {
			System.out.println("QaBoardController.qaBoardInsert SUCCESS >>> : ");
			System.out.println("QaBoardController.qaBoardInsert qavo confirm >>> : " + qavo);	
				
				//file upload set
				if(!file.isEmpty()) {
					//db saved real file upload name
					String qaRealnameSave = FileUploadUtil.fileUpload(file, request);
					
					//qaRealnameSave value set in vo file
					qavo.setQaimage(qaRealnameSave);
						System.out.println("QaBoardControllerqavo.qaBoardInsert qaRealnameSave confirm >>> : " + qaRealnameSave);
				} else {
					qavo.setQaimage(qavo.getQaimage());
						System.out.println("QaBoardControllerqavo.qaBoardInsert qavo.getQaimage() confirm >>> : " + qavo.getQaimage());
				}//End of if block
				
				//this is used to prevent error (오류를 방지하는 데 사용된다.)
				if(qavo.getQareplycontent() == null || qavo.getQareplycontent() == ""){
					qavo.setQareplycontent("");
				}//End of if block
				
				//Settings for replies (답글을 위한 설정)
				if(request.getParameter("qaReplyMode").equals("qaReInsert")) {
					qavo.setQaref(qavo.getQano());
						System.out.println("QaBoardControllerqavo.qaBoardInsert qavo.getQano() confirm >>> : " + qavo.getQano());
					qavo.setQastep(1);
				} else {
					String qano = qaBoardService.qaBoardQaNoSelect();
						System.out.println("QaBoardControllerqavo.qaBoardInsert qano confirm >>> : " + qano);
					qavo.setQaref(qano);
					qavo.setQastep(0);
				}//End of if block
				
				String qaResultStr = "";
				int result = qaBoardService.qaBoardInsert(qavo);
			
					if(result > 0) {
						qaResultStr = "Post registration was successful.";
					} else {
						qaResultStr = "Post registration failed.";
					}//End of if block
							
				ModelAndView mav = new ModelAndView();
				mav.addObject("result", qaResultStr);
				mav.setViewName(CONTEXT_PATH + "/qaResult");
						
				return mav;
		}//End of qaBoardInsert method block
	
	//Reply Insert Write Form page
	@RequestMapping("/qaBoardReplySelect")
	public ModelAndView qaBoardReplySelect(@ModelAttribute QaBoardVO qavo) {
		System.out.println("QaBoardController.qaBoardReplySelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
			System.out.println("QaBoardController.qaBoardReplySelect getQareplycontent confirm >>>" + qavo.getQareplycontent());
			
			if(qavo.getQareplycontent().equals("")) {
				mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
				mav.addObject("qaReplyMode", "qaReplyInsert");
			} else {
				mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
				mav.addObject("qaReplyMode", "qaReplyUpdate");
			}//End of if block
		mav.setViewName(CONTEXT_PATH + "/qaBoardInsert");
			
		return mav;
	}//End of qaBoardReplySelect method block
	
	//QnA Detail Page
	@RequestMapping("/qaBoardDetail")
	public ModelAndView qaBoardDetail(@ModelAttribute QaBoardVO qavo, HttpServletRequest request,
			                           HttpServletResponse response, HttpSession session) {
		System.out.println("QaBoardController.qaBoardDetail SUCCESS >>> : ");
		System.out.println("QaBoardController.qaBoardDetail qavo confirm >>> : " + qavo);
		
		ModelAndView mav = new ModelAndView();
	  	mav.addObject("qaBoardDetail",qaBoardService.qaBoardDetail(qavo)); 
	  	mav.setViewName(CONTEXT_PATH + "/qaBoardDetail");
	    
	  	return mav;
	}//End of qaBoardDetail method block

	//QnA Update Page
	@RequestMapping("/qaBoardUpdate")
	//MultipartFile file need for file upload set
	public ModelAndView qaBoardUpdate(@ModelAttribute QaBoardVO qavo,  MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("QaBoardController.qaBoardUpdate SUCCESS >>> : ");
		System.out.println("QaBoardController.qaBoardUpdate qavo confirm >>> : " + qavo);			
		System.out.println("QaBoardController.qaBoardUpdate getOriginalFilename confirm >>> : " + file.getOriginalFilename());			
		
		if(!file.isEmpty()) {
			//db saved real file upload name
			String qaRealnameSave = FileUploadUtil.fileUpload(file, request);
			qavo.setQaimage(qaRealnameSave);			
		} else {
			qavo.setQaimage(qavo.getQaimage());
		}//End of if block
		
		//this is used to prevent error (오류를 방지하는 데 사용된다.)
		if(qavo.getQareplycontent() == null || qavo.getQareplycontent() == "" ) {
			qavo.setQareplycontent("");
		}//End of if block
		
		String qaResultStr = "";
		int result = qaBoardService.qaBoardUpdate(qavo);
			if(result > 0) {
				qaResultStr = "Post edit was successful.";
			} else {
				qaResultStr = "Editing post failed.";
			}//End of if block
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", qaResultStr);
		mav.setViewName(CONTEXT_PATH + "/qaResult");
				
		return mav;
	}//End of qaBoardUpdate method block
	
	//QnA Delete Page
	@RequestMapping("/qaBoardDelete")
	public ModelAndView qaBoardDelete(@ModelAttribute QaBoardVO qavo) {
		System.out.println("QaBoardController.qaBoardDelete SUCCESS >>> : ");
		System.out.println("QaBoardController.qaBoardDelete qavo confirm >>> : " + qavo);			
		
		QaBoardVO qavo1 = qaBoardService.qaBoardDetail(qavo);
		qavo.setQaref(qavo1.getQaref());
		
		String qaResultStr = "";
		int result = qaBoardService.qaBoardDelete(qavo);
			if(result > 0) {
				qaResultStr = "Successfully deleted post.";
				System.out.println("QaBoardController.qaBoardDelete qaResultStr confirm >>> : " + qaResultStr);
			} else {
				qaResultStr = "Deleting a post failed.";
				System.out.println("QaBoardController.qaBoardDelete qaResultStr confirm >>> : " + qaResultStr);
			}//End of if block
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", qaResultStr);
		mav.setViewName(CONTEXT_PATH + "/qaResult");
				
		return mav;
	}//End of qaBoardDelete method block
}//End of QaBoardController class block

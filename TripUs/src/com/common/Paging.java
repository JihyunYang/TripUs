package com.common;

public abstract class Paging{
	
	//한 페이지에 출력될 게시물 수 : COUNTLIST
	public static final int COUNTLIST = 10;
	//한 화면에 출력될 페이지 수 : COUNTPAGE
	public static final int COUNTPAGE = 5;


	public static int[] getPagingNum(int pagingTotalCnt, int pagingCurrentPage){
		//log
		System.out.println("Paging.getPagingNum() 진입");
		System.out.println("pagingTotalCnt: "+ pagingTotalCnt);
		System.out.println("pagingCurrentPage: "+ pagingCurrentPage);
		
		//지역변수 선언
		//총 게시물 : totalCount
		//총 페이지 : totalPage
		//현재 페이지 번호 : page
		//시작페이지 번호 : startPage
		//끝 페이지 번호 : endPage
		
		int totalCount = 0;
		int totalPage = 0;
		int page = 0;
		int startPage = 1;
		int endPage = 0;
		
		totalCount = pagingTotalCnt;
		page = pagingCurrentPage;
		
		//총페이지 = 총게시물 / 한 페이지에 출력될 게시물 수
		totalPage = totalCount / COUNTLIST;
		
		// 총 게시물이 한 페이지에 출력될 게시물 수로 나눈 수가 정수가 아닐때
		if(totalCount % COUNTLIST > 0){
			totalPage++;
		}
		// 현재 페이지 보다 총 페이지가 작을때
		if(totalPage < page){
			page = totalPage;
		}
		
		startPage = ((page -1)/COUNTPAGE)*COUNTPAGE+1;
		endPage = startPage + COUNTPAGE -1;
		
		// 끝 페이지번호가 총 페이지보다 클 때(마지막 페이지 보정)
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		int rlt[] = {startPage, endPage, totalPage, page};
		
		return rlt;
		
	}// end of getPagingNum()
}// end of Paging class

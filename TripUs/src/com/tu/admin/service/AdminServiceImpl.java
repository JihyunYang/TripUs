package com.tu.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.admin.dao.AdminDao;
import com.tu.admin.vo.AdHistoryBoardVo;
import com.tu.admin.vo.AdminVo;

@Service
@Transactional 
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<AdminVo> adlistMember(AdminVo adminvo) {
		System.out.println("AdminServiceImpl adlistMember SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adlistMember param >>>\n"+ adminvo);
		return adminDao.adlistMember(adminvo);
	}

	@Override
	public List<AdHistoryBoardVo> adhistoryBoardList(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminServiceImpl adhistoryBoardList SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adhistoryBoardList param >>>\n"+ adhistoryvo);
		return adminDao.adhistoryBoardList(adhistoryvo);
	}


	@Override
	public int adhistoryBoardInsert(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminServiceImpl adhistoryBoardInsert SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adhistoryBoardInsert param >>>\n"+ adhistoryvo);
		return adminDao.adhistoryBoardInsert(adhistoryvo);
	}

	@Override
	public Object adhistoryBoardDetail(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminServiceImpl adhistoryBoardDetail SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adhistoryBoardDetail param >>>\n"+ adhistoryvo);
		return adminDao.adhistoryBoardDetail(adhistoryvo);
	}

	@Override
	public int adhistoryBoardUpdate(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminServiceImpl adhistoryBoardUpdate SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adhistoryBoardUpdate param >>>\n"+ adhistoryvo);
		return adminDao.adhistoryBoardUpdate(adhistoryvo);
	}

	@Override
	public int adhistoryBoardDelete(AdHistoryBoardVo adhistoryvo) {
		System.out.println("AdminServiceImpl adhistoryBoardDelete SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adhistoryBoardDelete param >>>\n"+ adhistoryvo);
		return adminDao.adhistoryBoardDelete(adhistoryvo);
	}

	@Override
	public List adhistoryBoardListCount(Map map) {
		System.out.println("AdminServiceImpl adhistoryBoardListCount SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adhistoryBoardListCount param >>>\n"+ map);
		return adminDao.adhistoryBoardListCount(map);
	}

	@Override
	public List adlistMemberCount(Map map) {
		System.out.println("AdminServiceImpl adlistMemberCount SUCCESS >>> : ");
		System.out.println("AdminServiceImpl adlistMemberCount param >>>\n"+ map);
		return adminDao.adlistMemberCount(map);
	}

}

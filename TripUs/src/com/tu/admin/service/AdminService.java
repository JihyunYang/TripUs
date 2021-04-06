package com.tu.admin.service;

import java.util.List;
import java.util.Map;

import com.tu.admin.vo.AdHistoryBoardVo;
import com.tu.admin.vo.AdminVo;

public interface AdminService {

	public List<AdminVo> adlistMember(AdminVo adminvo);

	public List<AdHistoryBoardVo> adhistoryBoardList(AdHistoryBoardVo adhistoryvo);


	public int adhistoryBoardInsert(AdHistoryBoardVo adhistoryvo);

	public Object adhistoryBoardDetail(AdHistoryBoardVo adhistoryvo);

	public int adhistoryBoardUpdate(AdHistoryBoardVo adhistoryvo);

	public int adhistoryBoardDelete(AdHistoryBoardVo adhistoryvo);

	public List adhistoryBoardListCount(Map map);

	public List adlistMemberCount(Map map);

}

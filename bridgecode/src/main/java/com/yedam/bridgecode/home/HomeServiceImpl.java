package com.yedam.bridgecode.home;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.member.MemberVO;

@Service("homeService")
public class HomeServiceImpl implements HomeService{

	//DAO를 호출하는 부분
	@Autowired private HomeMapper homeDAO;

	@Override
	public List<Map<String, Object>> bestMemberList(MemberVO vo) {
		return homeDAO.bestMemberList(vo);
	}



}

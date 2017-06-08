package com.yedam.bridgecode.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.member.MemberVO;


@Service("heartService") 
public class HeartServiceImpl implements HeartService{
	 
	
	//DAO를 호출하는 부분
	@Autowired
	private HeartMapper HeartDAO;

	@Override
	public void insertHeart(HeartVO vo) {
		HeartDAO.insertHeart(vo);
	}

	@Override
	public void updateHeart(HeartVO vo) {
		HeartDAO.updateHeart(vo);
	}

	@Override
	public void deleteHeart(HeartVO vo) {
		HeartDAO.deleteHeart(vo); 
	}

	@Override
	public HeartVO getFromHeart(MemberVO vo) {
		return HeartDAO.getFromHeart(vo);
	}


	@Override
	public List<HeartVO> getHeartListVO(HeartVO vo) {
		return HeartDAO.getHeartListVO(vo);
	}

	@Override
	public HeartVO checkHeart(MemberVO vo) {;
		if(HeartDAO.checkHeart(vo) == null){
			return null;
		} 
		
		return HeartDAO.checkHeart(vo);

	}

	@Override
	public List<Map<String, Object>> getMyHeartList(MemberVO vo) {
		return HeartDAO.getMyHeartList(vo);
	}

	@Override 
	public List<Map<String, Object>> getToHeartList(MemberVO vo) {
		return HeartDAO.getToHeartList(vo); 
	}

	@Override
	public void heartYES(HeartVO vo) {
		HeartDAO.heartYES(vo);
	}

	@Override
	public void heartNO(HeartVO vo) {
		HeartDAO.heartNO(vo);
	}

	

}

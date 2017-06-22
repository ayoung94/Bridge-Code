package com.yedam.bridgecode.heart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.board.BoardVO;
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
	public void heartYES(HeartVO vo,MemberVO from,MemberVO to) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("vo",vo);
		map.put("from",from);
		map.put("to", to);
		
		 
		HeartDAO.heartYES(map);  
		HeartDAO.heartYES2(map);
		HeartDAO.heartYES3(map);
		HeartDAO.heartYES4(map);
		HeartDAO.heartYES5(map);
		
	}

	@Override
	public void heartNO(HeartVO vo) {
		HeartDAO.heartNO(vo);
	}
 
	@Override
	public HeartVO getHeart(HeartVO vo) {
		return HeartDAO.getHeart(vo);
	}

	@Override
	public void coupleDelete(MemberVO from, MemberVO to) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("from",from);
		map.put("to", to);

		HeartDAO.coupleDelete(map);  
		HeartDAO.coupleDelete2(map);
		HeartDAO.coupleDelete3(map);
	}

	@Override
	public HeartVO getCoupleHeart(MemberVO from, MemberVO to) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("from",from);
		map.put("to", to);

		return HeartDAO.getCoupleHeart(map);
	}

	@Override
	public List<Map<String, Object>> getCoupleBoardList(MemberVO vo) {
		return HeartDAO.getCoupleBoardList(vo);
	}

	@Override
	public void boardInsert(BoardVO vo) {
		HeartDAO.boardInsert(vo);
	}

	@Override
	public void boardDelete(String id) {
		HeartDAO.boardDelete(id);
	}

	@Override
	public void boardUpdateLike(String id) {
		HeartDAO.boardUpdateLike(id);
	}

	@Override
	public void boardUpdateDislike(String id) {
		HeartDAO.boardUpdateDislike(id);
	}

}

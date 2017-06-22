package com.yedam.bridgecode.heart;

import java.util.List;
import java.util.Map;

import com.yedam.bridgecode.board.BoardVO;
import com.yedam.bridgecode.member.MemberVO;
 
public interface HeartService {
	public HeartVO getHeart(HeartVO vo);
	public HeartVO checkHeart(MemberVO vo); // 마지막으로 보낸 하트가 24이 지났는지 체크하여 가장 나중에 보낸하트정보를 가져온다.
	public void heartYES(HeartVO vo,MemberVO from,MemberVO to); //하트 수락 
	public void heartNO(HeartVO vo); //하트 거절
	public void coupleDelete(MemberVO from,MemberVO to); //커플 해제
	public void insertHeart(HeartVO vo);
	public void updateHeart(HeartVO vo); 
	public void deleteHeart(HeartVO vo);
	public HeartVO getFromHeart(MemberVO vo);
	public List<Map<String, Object>> getToHeartList(MemberVO vo);
	public List<Map<String,Object>> getMyHeartList(MemberVO vo);
	public List<HeartVO> getHeartListVO(HeartVO vo);
	public HeartVO getCoupleHeart(MemberVO from,MemberVO to);
	
	public List<Map<String,Object>> getCoupleBoardList(MemberVO vo);
	public void boardInsert(BoardVO vo);
	public void boardDelete(String id);
	public void boardUpdateLike(String id);
	public void boardUpdateDislike(String id);
	//user-mapper.xml의 내용 확인해서 return값, 클래스 이름 같게하기.
}

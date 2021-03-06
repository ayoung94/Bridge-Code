package com.yedam.bridgecode.heart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.board.BoardVO;
import com.yedam.bridgecode.member.MemberVO;


@MapperScan 
public interface HeartMapper { 
	public HeartVO getHeart(HeartVO vo);
	public HeartVO checkHeart(MemberVO vo); //마지막으로 보낸 하트가 24이 지났는지 체크하여 가장 나중에 보낸하트정보를 가져온다.
	
	public void heartYES(Map<String, Object> map); //하트 수락 status 변경
	public void heartYES2(Map<String, Object> map); //하트 수락 from_id(보낸사람) 의 member_partner_id 변경
	public void heartYES3(Map<String, Object> map); //하트 수락 to_id(받는사람) 의 member_partner_id 변경
	public void heartYES4(Map<String, Object> map); //보낸사람과 받는사람의 보냈던 하트들 모두 만료 시키기.
	//public void heartYES5(Map<String, Object> map); //보냈던 하트들 모두 만료 시키기.
	
	public void heartNO(HeartVO vo); //하트 거절
	
	public void coupleDelete(Map<String, Object> map); //커플 해제 하트 status 변경
	public void coupleDelete2(Map<String, Object> map); //커플 해제 파트너1 member_partner_id 삭제
	public void coupleDelete3(Map<String, Object> map); //커플 해제 파트너2 member_partner_id 삭제
	public void coupleDelete4(Map<String, Object> map); //board 테이블의 글쓴이로 검색하여 모두 삭제.
	
	public void insertHeart(HeartVO vo);
	public void updateHeart(HeartVO vo);
	public void deleteHeart(HeartVO vo);
	
	public HeartVO getFromHeart(MemberVO vo); //이거 왜있지..?나중에도 필요없으면 삭제예정
	public HeartVO getCoupleHeart(Map<String, Object> map); 
	
	public List<Map<String,Object>> getToHeartList(MemberVO vo); //보낸 하트 리스트 (이때까지)
	public List<Map<String,Object>> getMyHeartList(MemberVO vo); //받은 하트 리스트(승인 대기중인 하트만)
	
	public List<HeartVO> getHeartListVO(HeartVO vo); 
	
	public List<Map<String,Object>> getCoupleBoardList(MemberVO vo); //커플의 게시판 내역 받아오기.
	
	public void boardInsert(BoardVO vo);
	public void boardDelete(String id);
	public void boardUpdateLike(String id);
	public void boardUpdateDislike(String id);
}

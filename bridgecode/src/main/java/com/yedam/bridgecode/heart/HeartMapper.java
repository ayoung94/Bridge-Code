package com.yedam.bridgecode.heart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;


@MapperScan
public interface HeartMapper {
	public void insertHeart(HeartVO vo);
	public void updateHeart(HeartVO vo);
	public void deleteHeart(HeartVO vo);
	public HeartVO getFromHeart(MemberVO vo);
	public List<Map<String,Object>> getHeartList(HeartVO vo);
	public List<HeartVO> getHeartListVO(HeartVO vo);
	//user-mapper.xml의 내용 확인해서 return값, 클래스 이름 같게하기.
}

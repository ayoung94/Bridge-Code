package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.bridgecode.member.MemberService;
import com.yedam.bridgecode.member.MemberVO;

@Controller
@SessionAttributes("matching")
public class MatchingController {

	@Autowired
	MatchingService MatchingService;
	@Autowired
	MemberService memberService;
	
	// 조건에 맞는 회원 찾기
	@RequestMapping("/matching/memberMatchingList.do")
	public String getCodeList(CodeVO vo, Model model) {
		MemberVO me = new MemberVO();
		List<Map<String, Object>> list = memberService.getMemberList(me);
		model.addAttribute("member", list);
		List<Map<String, Object>> interest = MatchingService.getCodeList(vo);
		model.addAttribute("list", interest);
		return "matching/memberMatchingList";
	}
	// 상세프로필 보기로 이동
	@RequestMapping("/matching/memberSelect.do")
	public String memberSelect(MemberVO vo, @RequestParam String id, Model model) {
		vo.setMember_id(id);
		MemberVO member = memberService.getMember(vo);
		model.addAttribute("profile", member);

		return "matching/memberSelect";
	}
}
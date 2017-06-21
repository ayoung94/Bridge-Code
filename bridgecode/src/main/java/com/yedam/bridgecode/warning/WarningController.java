package com.yedam.bridgecode.warning;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.bridgecode.member.MemberVO;

@Controller
public class WarningController {

	@Autowired WarningService warningService;
	@Autowired WarningMapper warningDAO;


	//비매너 신고 당한 유저 리스트 조회
	@RequestMapping("/getWarningList.do")
	public String getWarningList(Model model) {
		model.addAttribute("warningList", warningDAO.getWarningList());
		return "warning/warningApplication";
	}

	//비매너 신고 기각
	@RequestMapping("/updateWarningReject")
	public String updateWarningReject(WarningVO vo){
		warningService.updateWarningReject(vo);
		return "redirect:/getWarningList.do";
	}

	//유저 경고 횟수 증가 메소드
	@RequestMapping("/updateWarningApplication.do")
	public String updateMemberWarning(MemberVO vo, WarningVO vo2){
		
		System.out.println(vo2);
		warningService.updateWarningApplicationWarning(vo2);
		System.out.println("11111 : "+vo);
		warningService.updateWarningApplicationMember(vo);
		
		return "redirect:/getWarningList.do";
	}
}
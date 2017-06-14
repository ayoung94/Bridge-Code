package com.yedam.bridgecode.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.bridgecode.member.MemberVO;

@Controller
public class AdminController {

	@Autowired AdminService adminService;
	@Autowired AdminMapper adminDAO;

	//정식 등록 인가된 유저 리스트 조회
	@RequestMapping("/getUserList.do")
	public String getUserList(Model model) {
		model.addAttribute("userList", adminDAO.getUserList());
		return "admin/adminUserList";
	}

	//정식 등록 인가된 유저 상세보기
	@RequestMapping("/getUserSel.do")
	public String getUserSel(MemberVO vo, Model model) {
		model.addAttribute("userList", adminService.getUserSel(vo));
		return "/popup/admin/adminUserSel";
	}
}

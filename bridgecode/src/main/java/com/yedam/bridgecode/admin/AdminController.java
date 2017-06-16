package com.yedam.bridgecode.admin;

import javax.servlet.http.HttpServletRequest;

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
	public String getUserList(Model model, MemberVO vo, HttpServletRequest rq) {
		if(rq.getParameter("member_level").equals("2")) {
			model.addAttribute("userList", adminDAO.getUserList(vo));
			return "admin/adminUserList";
		}

		else if(rq.getParameter("member_level").equals("1")) {
			model.addAttribute("userList", adminDAO.getUserList(vo));
			return "admin/adminUserApplication";
		}
		return null;

	}

	//정식 등록 인가된 유저 상세보기
	@RequestMapping("/getUserSel.do")
	public String getUserSel(MemberVO vo, Model model) {
		model.addAttribute("userList", adminService.getUserSel(vo));
		return "/popup/admin/adminUserSel";
	}

	//새로운 회원 신청인 조회 리스트
	/*@RequestMapping("/getAdminUserApplicationList.do")
	public String getUserList(Model model) {
		model.addAttribute("userList", adminDAO.getUserList());
		return "admin/adminUserList";
	}*/

	//관리자 페이지 이동
	@RequestMapping("/goAdminMain.do")
	public String goAdminMain(){
		return "/popup/admin/adminMain";
	}

}

package com.yedam.bridgecode.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.bridgecode.chart.ChartMapper;
import com.yedam.bridgecode.member.MemberVO;
import com.yedam.bridgecode.warning.WarningMapper;
import com.yedam.bridgecode.warning.WarningVO;

@Controller
public class AdminController {

	@Autowired AdminService adminService;
	@Autowired AdminMapper adminDAO;
	@Autowired WarningMapper warningDAO;
	@Autowired ChartMapper chartDAO;

	//유저 리스트 조회
	@RequestMapping("/getUserList.do")
	public String getUserList(Model model, MemberVO vo, HttpServletRequest rq) {
		//정식 등록 인가된 유저 리스트 조회
		if(rq.getParameter("member_level").equals("2")) {
			model.addAttribute("userList", adminDAO.getUserList(vo));
			return "admin/adminUserList";
		}
		//새로운 회원 신청인 조회 리스트
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

	//관리자 페이지 이동
	@RequestMapping("/goAdminMain.do")
	public String goAdminMain(Model model){
		int count = 0;
		int countUserApplication = 0;
		countUserApplication = adminDAO.countUserApplication(null);
		count = warningDAO.countWarning(null);
		model.addAttribute("countUserApplication", countUserApplication);
		model.addAttribute("count", count);
		return "/popup/admin/adminMain";
	}

	//회원 신청 승인
	@RequestMapping("/updateUserApplication.do")
	public String updateUserApplication(MemberVO vo){
		adminService.updateUserApplication(vo);
		return "redirect:/getUserList.do?member_level=1";
	}

	//회원 신청 거부
	@RequestMapping("/updateUserReject.do")
	public String updateUserReject(MemberVO vo){
		adminService.updateUserReject(vo);
		return "redirect:/getUserList.do?member_level=1";
	}

}

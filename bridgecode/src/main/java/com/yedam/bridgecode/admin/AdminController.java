package com.yedam.bridgecode.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@Autowired AdminService adminService;
	@Autowired AdminMapper adminDAO;

	//공지사항목록
	@RequestMapping("/getUserList.do")
	public String getUserList(Model model) {
		model.addAttribute("userList", adminDAO.getUserList());
		return "admin/adminUserList";
	}
}

package com.yedam.bridgecode.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	
	@RequestMapping("/")
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping("/member/memberInsert.do")
	public String memberInsert(){
		return "member/memberInsert";
	}
	
	@RequestMapping(value="/member/memberInsert.do",method= RequestMethod.POST)
	public String userInsert(MemberVO memberVO){
		
		System.out.println("command 객체" + memberVO);
		memberService.insertMember(memberVO);
		return "redirect:/member/memberList.do";
	}
	
	@RequestMapping("/member/memberList.do")
	public String getUserList(MemberVO vo,Model model){
		System.out.println("들어옴");
		List<Map<String,Object>> list = memberService.getMemberList(vo);
		model.addAttribute("list",list);
		System.out.println(list);
		return "member/memberList";
	}
	/*
	//등록하기
	@RequestMapping(value="/user/userInsert.do",method= RequestMethod.POST)
	public String userInsert(MemberVO userVO,
							 HttpServletRequest request){
		
		System.out.println("command 객체" + userVO);
		UserVO vo = new UserVO();
		vo.setId(request.getParameter("id"));
		vo.setName(request.getParameter("name"));
		vo.setPassword(request.getParameter("password"));
		vo.setRole(request.getParameter("role"));
		System.out.println("직접 등록한 객체 :"+vo);
		
		userService.insertUser(userVO);
		return "redirect:/user/getUserList.do";
	}
	
	@RequestMapping("/user/getUser.do")
	public String getUser(MemberVO vo,Model model){
		MemberVO user = userService.getUser(vo);
		model.addAttribute("user",user);
		return "user/getUser";
	}
	
	
	@RequestMapping(value={"/user/getUserList.do"})
	public String getUserList(MemberVO vo,Model model){
		List<Map<String,Object>> list = userService.getUserList(vo);
		model.addAttribute("list",list);
		System.out.println(list);
		return "user/userList";
	}
	
	
	@RequestMapping(value={"/user/getUserListVO.do"})
	public String getUserList1(MemberVO vo,Model model){
		List<MemberVO> list = userService.getUserListVO(vo);
		model.addAttribute("list",list);
		System.out.println(list);
		return "user/userList";
	}*/
}

package com.yedam.bridgecode.home;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.bridgecode.member.MemberService;
import com.yedam.bridgecode.member.MemberVO;

@Controller
public class HomeController {

	@Autowired MemberService memberService;
	@Autowired HomeService homeService;
	
	@RequestMapping("/")
	public String home(MemberVO vo,Model model) {
		System.out.println(homeService.bestMemberList(vo));
		List<Map<String,Object>> list = homeService.bestMemberList(vo);
		model.addAttribute("list",list);
		return "home"; 

	}
}

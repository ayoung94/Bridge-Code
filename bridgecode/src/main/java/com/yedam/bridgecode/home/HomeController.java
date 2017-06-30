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
	@Autowired HomeMapper homeDAO;
	
	@RequestMapping("/")
	public String home(MemberVO vo,Model model) {
		System.out.println(homeService.bestMemberMonthList(vo));
		System.out.println("주단위" +homeService.bestMemberWeekList(vo));
		System.out.println("베스트" +homeService.bestMemberAllList(vo));
		List<Map<String,Object>> list = homeService.bestMemberMonthList(vo);
		List<Map<String,Object>> list2 = homeService.bestMemberWeekList(vo);
		List<Map<String,Object>> list3 = homeService.bestMemberAllList(vo);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("countAllCouple", homeDAO.countAllCouple(null));
		return "home"; 
	}
	
	
	
}

package com.yedam.bridgecode.heart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("heart")
public class HeartController {
	
	@Autowired
	HeartService heartService;


/*	@RequestMapping("/member/memberInsert.do")
	public String memberInsert(){
		return "member/memberInsert";
	}
	
	@RequestMapping(value="/member/memberInsert.do",method= RequestMethod.POST)
	public String userInsert(HeartVO memberVO){
		
		System.out.println("command 객체" + memberVO);
		memberService.insertMember(memberVO);
		return "redirect:/member/memberList.do";
	}
	
	@RequestMapping("/member/memberList.do")
	public String getUserList(HeartVO vo,Model model){
		System.out.println("들어옴");
		List<Map<String,Object>> list = memberService.getMemberList(vo);
		model.addAttribute("list",list);
		System.out.println(list);
		return "member/memberList";
	}
	

	@RequestMapping("/member/mypage.do")
	public String myPage(HeartVO vo
						,Model model
						,HttpSession session){
		if(session.getAttribute("login") == null){
			model.addAttribute("msg", "로그인 해주세요"); 
			model.addAttribute("url", "/"); 
			
			return "/popup/alert";
		}
		
		HeartVO member = memberService.getMember(((HeartVO)session.getAttribute("login")));
		model.addAttribute("member",member);
		System.out.println(member);
		return "member/mypage";
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdateForm(HeartVO vo
						,Model model
						,HttpSession session){
		HeartVO member = memberService.getMember(((HeartVO)session.getAttribute("login")));
		model.addAttribute("member",member);
		System.out.println(member);
		
		session.setAttribute("member", member);
		
		return "member/memberUpdate";
	}
	
	@RequestMapping(value="/member/memberUpdate.do", 
            		method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute("member") HeartVO member
						,Model model
						,SessionStatus status){
		
		memberService.updateMember(member);
		status.setComplete();
		return "member/memberUpdate";
	}
	*/


}

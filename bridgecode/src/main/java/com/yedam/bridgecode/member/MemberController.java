package com.yedam.bridgecode.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.yedam.bridgecode.heart.HeartService;
import com.yedam.bridgecode.heart.HeartVO;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	HeartService heartService;

	
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
	

	@RequestMapping("/member/mypage.do")
	public String myPage(MemberVO vo
						,Model model
						,HttpSession session){
		if(session.getAttribute("login") == null){
			model.addAttribute("msg", "로그인 해주세요"); 
			model.addAttribute("url", "/"); 
			
			return "/popup/alert";
		}
		
		MemberVO member = memberService.getMember(((MemberVO)session.getAttribute("login")));
		HeartVO heart = heartService.getFromHeart(member);
		
		model.addAttribute("member",member);
		model.addAttribute("heart",heart);

		return "member/mypage";
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdateForm(MemberVO vo
						,Model model
						,HttpSession session){
		MemberVO member = memberService.getMember(((MemberVO)session.getAttribute("login")));
		model.addAttribute("member",member);
		System.out.println(member);
		
		session.setAttribute("member", member);
		
		return "member/memberUpdate";
	}
	
	@RequestMapping(value="/member/memberUpdate.do", 
            		method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute("member") MemberVO member
						,Model model
						,SessionStatus status){
		
		memberService.updateMember(member);
		status.setComplete();
		return "member/memberUpdate";
	}
	
	//로그인
	@RequestMapping(value="/login.do", 
	                method = RequestMethod.POST )
	public String login(
			 MemberVO member,
			 Model model,
			 HttpSession session) {
		
		System.out.println("로그인 시도");
		System.out.println(member);

		MemberVO result = memberService.login(member);
		
		if ( result != null ) {
			session.setAttribute("login", result);

			return "home";
			
		} else {

			model.addAttribute("msg", "로그인 실패."); 
			model.addAttribute("url", "/"); 
			
			return "/popup/alert";
		}
	}
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}	

}

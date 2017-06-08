package com.yedam.bridgecode.heart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.bridgecode.member.MemberVO;

@Controller
@SessionAttributes("heart")
public class HeartController {
	
	@Autowired
	HeartService heartService;

	@RequestMapping("/heart/heartInsert.do")
	public String heartInsert(Model model,
				  			  @RequestParam String id,
				  			  HttpSession session){
		
		if(session.getAttribute("login") == null){
			model.addAttribute("msg", "로그인 해주세요"); 
			model.addAttribute("url", "/member/memberSelect.do?id="+id); 
			
			return "/popup/alert";
		}
		
		/*if(){
			model.addAttribute("msg", "가진 하트가 없습니다."); 
			model.addAttribute("url", "/member/memberSelect.do?id="+id); 
			
			return "/popup/alert";
		}*/
		
		
		HeartVO vo = new HeartVO();
		MemberVO me = (MemberVO)session.getAttribute("login");
		
		vo.setHeart_to_id(id);
		vo.setHeart_from_id(me.getMember_id());
		heartService.insertHeart(vo);
		
		model.addAttribute("msg", "하트 보내기 완료!"); 
		model.addAttribute("url", "/member/memberSelect.do?id="+id); 
		
		return "/popup/alert";
	}

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

package com.yedam.bridgecode.member;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

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
	public String home(MemberVO vo,Model model) {
		
		List<Map<String,Object>> list = memberService.getBestMemberList(vo);
		model.addAttribute("list",list);
		return "home"; 
		
	}
	
	@RequestMapping("/member/memberInsert.do")
	public String memberInsertForm(){
		return "member/memberInsert";
	}
	
	@RequestMapping(value="/member/memberInsert.do",method= RequestMethod.POST)
	public String memberInsert(MemberVO vo) throws IOException{
		
		/*MultipartFile profile_img = vo.getMember_profile_img();
		if(!profile_img.isEmpty()){
			String fileName = profile_img.getOriginalFilename();
			profile_img.transferTo(new File("D:/egov/본프로젝트/bridgecode/src/main/webapp/WEB-INF/profile_img/"+fileName)); 
		}
		*/
		memberService.insertMember(vo);
		return "redirect:/member/memberList.do";
	}
	
	@RequestMapping("/member/memberList.do")
	public String getUserList(MemberVO vo,Model model){
		List<Map<String,Object>> list = memberService.getMemberList(vo);
		model.addAttribute("list",list);
		System.out.println(list);
		return "member/memberList";
	}
	
	@RequestMapping("/member/memberSelect.do")
	public String memberSelect(MemberVO vo,
							   Model model,
							   HttpSession session){
		
		vo = (MemberVO)session.getAttribute("login");
		model.addAttribute("member",vo);
		
		return "member/memberSelect";
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
		HeartVO heartfrom = heartService.checkHeart(member);
		List<Map<String,Object>> heartTo = heartService.getToHeartList(member);
		
		model.addAttribute("member",member);
		model.addAttribute("heartfrom",heartfrom);
		model.addAttribute("heartto",heartTo);
		

		return "member/mypage";
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdateForm(MemberVO vo
						,Model model
						,HttpSession session){
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		model.addAttribute("member", member);
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
		return "redirect:/member/memberSelect.do";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(@ModelAttribute("member") MemberVO member
					,Model model
					,HttpSession session){
		
		
		member = (MemberVO)session.getAttribute("login");
		memberService.deleteMember(member);
		
		model.addAttribute("msg", "정상적으로 처리되었습니다. 이용해주셔서 감사합니다."); 
		model.addAttribute("url", "/"); 
		
		session.invalidate();
		
		return "/popup/url";
	}
	
	//로그인
	@RequestMapping(value="/login.do", 
	                method = RequestMethod.POST )
	public String login(
			 MemberVO member,
			 Model model,
			 HttpSession session) {

		MemberVO result = memberService.login(member);
		
		if ( result != null ) {
			session.setAttribute("login", result);
			List<Map<String,Object>> heartTo = heartService.getToHeartList(result);
			session.setAttribute("heartto",heartTo);

			return "/login";
			
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
		return "redirect:/";
	}	

}

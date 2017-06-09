package com.yedam.bridgecode.heart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.bridgecode.member.MemberService;
import com.yedam.bridgecode.member.MemberVO;

@Controller
@SessionAttributes("heart")
public class HeartController {
	
	@Autowired
	HeartService heartService;
	@Autowired
	MemberService memberService;

	@RequestMapping("/heart/heartInsert.do")
	public String heartInsert(Model model,
				  			  @RequestParam String id,
				  			  HttpSession session){
		
		if(session.getAttribute("login") == null){
			model.addAttribute("msg", "로그인 해주세요"); 
			model.addAttribute("url", "/matching/memberSelect.do?id="+id); 
			
			return "/popup/alert";
		}

		HeartVO vo = new HeartVO();
		MemberVO me = (MemberVO)session.getAttribute("login");

		if(heartService.checkHeart(me) != null){
			
			model.addAttribute("msg", "가진 하트가 없습니다."); 
			model.addAttribute("url", "/matching/memberSelect.do?id="+id); 
			
			return "/popup/alert";
		}

		vo.setHeart_to_id(id);
		vo.setHeart_from_id(me.getMember_id());
		heartService.insertHeart(vo);
		
		model.addAttribute("msg", "하트 보내기 완료!"); 
		model.addAttribute("url", "/matching/memberSelect.do?id="+id); 
		
		return "/popup/alert";
	} 
	
	
	@RequestMapping("/heart/heartYES.do")
	public String heartYES(Model model,
				  			  @RequestParam String heart_id,
				  			  HttpSession session,
				  			  MemberVO to,
				  			  MemberVO from,
				  			  HeartVO vo){
		vo.setHeart_id(heart_id);
		vo = heartService.getHeart(vo);

		to = (MemberVO)session.getAttribute("login");
		from.setMember_id(vo.getHeart_from_id());
		 
		vo.setHeart_id(heart_id);
		
		
		//heart, from_member, to_member
		heartService.heartYES(vo,from,to); 
		
		model.addAttribute("msg", "하트 수락 완료!"); 
		model.addAttribute("url", "/member/mypage.do"); 
		
		return "/popup/alert";
	} 
	
	@RequestMapping("/heart/heartNO.do")
	public String heartNO(Model model,
				  			  @RequestParam String heart_id,
				  			  HttpSession session){
		HeartVO vo = new HeartVO();
		vo.setHeart_id(heart_id);
		heartService.heartNO(vo);
		
		model.addAttribute("msg", "하트 거절 완료!"); 
		model.addAttribute("url", "/member/mypage.do"); 
		
		return "/popup/alert";
	} 
	

	@RequestMapping("/heart/heartFromList.do")
	public String heartFromList(MemberVO vo,Model model,HttpSession session){
		vo = (MemberVO)session.getAttribute("login");
		List<Map<String,Object>> list = heartService.getMyHeartList(vo);
		model.addAttribute("list",list);

		return "heart/heartFromList";
	}
	
	@RequestMapping("/couple/couplepage.do")
	public String couplePage(MemberVO vo,
							 MemberVO partner,
							 Model model,
							 HttpSession session){
		
		if(session.getAttribute("login") == null){
			model.addAttribute("msg", "로그인 해주세요"); 
			model.addAttribute("url", "/"); 
			return "/popup/alert";
		}
		
		vo = (MemberVO)session.getAttribute("login");
		partner.setMember_id(vo.getMember_partner_id());
		partner = memberService.getMember(partner);
		
		model.addAttribute("partner", partner);
		
		return "couple/couplePage";
	}
}
package com.yedam.bridgecode.heart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.bridgecode.board.BoardVO;
import com.yedam.bridgecode.matching.CodeVO;
import com.yedam.bridgecode.matching.MatchingService;
import com.yedam.bridgecode.member.MemberService;
import com.yedam.bridgecode.member.MemberVO;

@Controller
@SessionAttributes("heart")
public class HeartController {
	@Autowired
	MatchingService MatchingService;
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

		if(me.getMember_partner_id() != null){
			model.addAttribute("msg", "이미 커플이 존재합니다. 커플을 해제한 후 시도해주세요."); 
			model.addAttribute("url", "/matching/memberSelect.do?id="+id); 
			
			return "/popup/alert";
		}
		
		
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
	
	@RequestMapping("/couple/coupleDelete.do")
	public String coupleDelete(Model model,
				  			  MemberVO from,
				  			  MemberVO to,
				  			  HttpSession session){

		to = (MemberVO)session.getAttribute("login");
		from.setMember_id(to.getMember_partner_id());
		from = memberService.getMember(from);
		
		//heart, from_member, to_member
		heartService.coupleDelete(from,to); 
		
		model.addAttribute("msg", "커플 해제가 완료되었습니다!"); 
		model.addAttribute("url", "/member/mypage.do"); 
		
		to = memberService.getMember(to);
		session.setAttribute("login", to);
		
		return "/popup/url";
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
		
		if(to.getMember_partner_id() != null){
			model.addAttribute("msg", "이미 커플이 존재합니다. 커플을 해제한 후 시도해주세요."); 
			model.addAttribute("url", "/member/mypage.do"); 
			
			return "/popup/alert";
		}
		
		
		//heart, from_member, to_member
		heartService.heartYES(vo,from,to); 
		
		List<Map<String,Object>> heartTo = heartService.getToHeartList(to);
		session.setAttribute("heartto",heartTo);
		
		model.addAttribute("msg", "하트 수락 완료!"); 
		model.addAttribute("url", "/couple/couplepage.do"); 
		
		to = memberService.getMember(to);
		session.setAttribute("login", to);
		
		return "/popup/alert";
	} 
	
	@RequestMapping("/heart/heartNO.do")
	public String heartNO(Model model,
				  			  @RequestParam String heart_id,
				  			  HttpSession session){
		
		HeartVO vo = new HeartVO();
		vo.setHeart_id(heart_id);
		
		heartService.heartNO(vo);
		
		MemberVO to = (MemberVO)session.getAttribute("login");
		
		List<Map<String,Object>> heartTo = heartService.getToHeartList(to);
		session.setAttribute("heartto",heartTo);
		
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
	@RequestMapping("/couple/noCouplePage.do")
	public String noCouplePageForm(MemberVO vo,Model model,HttpSession session){
		
		List<Map<String, Object>> interest = MatchingService.getCodeList(new CodeVO());
		model.addAttribute("list", interest);
		return "couple/noCouplePage";
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
		
		
		if(vo.getMember_partner_id() == null){
			return "redirect:/couple/noCouplePage.do";
		}
		
		partner.setMember_id(vo.getMember_partner_id());
		partner = memberService.getMember(partner);
		HeartVO heart = heartService.getCoupleHeart(vo, partner);
		
		model.addAttribute("boardlist",heartService.getCoupleBoardList(vo));
		model.addAttribute("partner", partner);
		model.addAttribute("heart",heart);
		return "couple/couplePage";
	}
	
	@RequestMapping("/couple/boardInsert.do")
	public String boardInsert(BoardVO vo,
							 Model model,
							 HttpSession session){
		heartService.boardInsert(vo);
		return "redirect:/couple/couplepage.do";
	}
	@RequestMapping("/couple/boardDelete.do")
	public String boardDelete(@RequestParam String board_id,
							 Model model,
							 HttpSession session){
		heartService.boardDelete(board_id);
		return "redirect:/couple/couplepage.do";
	}
	
	@RequestMapping("/couple/boardUpdateLike.json")
	public @ResponseBody String boardUpdateLike(@RequestParam String board_id,
								 @RequestParam String like,
								 Model model,
								 HttpSession session){
		if(like.equals("0")){
			heartService.boardUpdateLike(board_id);
			return "1";
		}else if(like.equals("1")){
			heartService.boardUpdateDislike(board_id);
			return "0";
		}
		return null;
		
	}
}
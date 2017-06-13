package com.yedam.bridgecode.chat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.bridgecode.member.MemberService;
import com.yedam.bridgecode.member.MemberVO;


@Controller
@SessionAttributes("chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping("/chat/coupleChat.do")
	public String getCodeList(Model model,
							  MemberVO partner,
							  MemberVO vo,
							  HttpSession session) {
		vo = (MemberVO)session.getAttribute("login");
		partner.setMember_id(vo.getMember_partner_id());
		partner = memberService.getMember(partner);
		
		model.addAttribute("chatlist",chatService.getCoupleChatList(vo));
		model.addAttribute("partner", partner);	
		return "/popup/chat/coupleChat";
	}

}

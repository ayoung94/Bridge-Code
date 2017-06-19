package com.yedam.bridgecode.member;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
import com.yedam.bridgecode.matching.CodeVO;
import com.yedam.bridgecode.matching.MatchingService;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	HeartService heartService;
	@Autowired
	MatchingService MatchingService;

	
	@RequestMapping("/")
	public String home(MemberVO vo,Model model) {
		
		List<Map<String,Object>> list = memberService.getBestMemberList(vo);
		model.addAttribute("list",list);
		return "home"; 
		
	}
	
	@RequestMapping("/member/memberInsert.do")
	public String memberInsertForm(Model model){
		CodeVO vo = new CodeVO();
		List<Map<String, Object>> interest = MatchingService.getCodeList(vo);
		model.addAttribute("list", interest);
		
		return "member/memberInsert";
	}
	
	@RequestMapping(value="/member/memberInsert.do",method= RequestMethod.POST)
	public String memberInsert(MemberVO vo,
							   HttpServletRequest request) throws IllegalStateException,IOException{
		
		long t = System.currentTimeMillis();
		String randomName = t+""; 				//랜덤 이름 정하기
		
		String realPath = request.getSession().getServletContext().getRealPath("/"); //서블릿 내의 realPath 

		MultipartFile file = vo.getUploadFile();
		
		System.out.println("★★★★"+realPath);
		File saveFile = new File(realPath+"profile_img/",randomName);
		
		file.transferTo(saveFile);  //서버에 파일 저장
		vo.setMember_profile_img(randomName); //파일명 저장 file.getOriginalFilename()

		memberService.insertMember(vo);
		
		return "member/memberBeforeJoin";
	}
	
	@RequestMapping(value="/member/memberProfileUpdate.do",method= RequestMethod.POST)
	public String memberProfileUpdate(MemberVO vo,HttpServletRequest request,HttpSession session) throws IllegalStateException,IOException{
		try{

		long t = System.currentTimeMillis();
		String randomName = t+""; 				//랜덤 이름 정하기
		String realPath = request.getSession().getServletContext().getRealPath("/"); //서블릿 내의 realPath 

		MultipartFile file = vo.getUploadFile();
		File saveFile = new File(realPath+"profile_img/",randomName);
		
		file.transferTo(saveFile);  //서버에 파일 저장
		vo.setMember_profile_img(randomName); //파일명 저장 file.getOriginalFilename()

		memberService.memberProfileUpdate(vo);
		
		vo = memberService.getMember(vo);
		session.setAttribute("login", vo);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/member/memberSelect.do";
	}
	
	@RequestMapping("/member/memberList.do")
	public String getUserList(MemberVO vo,Model model){
		List<Map<String,Object>> list = memberService.getMemberList();
		model.addAttribute("list",list);
		System.out.println(list);
		return "member/memberList";
	}
	
	@RequestMapping("/member/memberNewList.do")
	public String getMemberNewList(MemberVO vo,Model model){
		List<Map<String,Object>> list = memberService.getNewMemberList();
		model.addAttribute("list",list);
		System.out.println(list);
		return "member/memberNewList";
	}
	
	
	@RequestMapping("/member/memberSelect.do")
	public String memberSelect(MemberVO vo,
							   Model model,
							   HttpSession session){
		
		vo = (MemberVO)session.getAttribute("login");
		model.addAttribute("member",vo);
		
		return "member/memberSelect";
	} 

	@RequestMapping("/member/passwordMissing.do")
	public String passwordMissingForm(){

		return "member/passwordMissing";
	} 
	@RequestMapping(value="/member/passwordMissing.do",method= RequestMethod.POST)
	public String passwordMissing(MemberVO vo,Model model){
		
		MemberVO result = memberService.getMember(vo);
		if(result == null){
			model.addAttribute("msg", vo.getMember_id()+"해당 회원이 존재하지 않습니다."); 
			model.addAttribute("url", "/"); 
			return "/popup/alert";
		}
		
		
		  long t = System.currentTimeMillis();
		  String newPasswd = t+""; //새 임시 비밀번호 랜덤으로 지정.
		  result.setMember_password(newPasswd);
		  memberService.updateMember(result);
		  
		  
	      // Recipient's email ID needs to be mentioned.
	      String to = result.getMember_id();//change accordingly

	      // Sender's email ID needs to be mentioned
	      String from = "bridgecode";//change accordingly
	      final String username = "bridgecode.com@gmail.com";//change accordingly
	      final String password = "hfumddzxqrjgszmr";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });

	      try {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	         InternetAddress.parse(to));

	         // Set Subject: header field
	         message.setSubject("[Bridge Code]임시 비밀번호 안내 메일입니다.");

	         // Now set the actual message
	         message.setContent("<html><body>안녕하세요 회원님! Bridge Code입니다.<br>"
	            + "신청하신 임시 비밀번호를 발급해 드렸습니다. <hr> <b>"+newPasswd+"</b><br>"
	            		+ "확인해 주시고, 로그인 후 임시 비밀번호 변경 꼭! 하시길 바랍니다.</body></html>","text/html; charset=UTF-8");
	         

	         // Send message
	         Transport.send(message);

	         System.out.println("Sent message successfully....");

	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
	      }

		
		
		
		model.addAttribute("msg", vo.getMember_id()+"님께 임시 비밀번호를 발송했습니다."); 
		model.addAttribute("url", "/"); 
		return "/popup/url";
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
	
	@RequestMapping(value="member/memberRejectJoin.do", 
				method = RequestMethod.POST)
	public String rejectMemberUpdate(@ModelAttribute("member") MemberVO member
					,Model model
					,SessionStatus status){
	memberService.updateRejectMember(member);
	status.setComplete();
	return "member/memberBeforeJoin";
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
			
			memberService.updateLastConnection(result); //마지막 접속시간 저장
			
			if ( result.getMember_level().equals("0")){
				session.setAttribute("login", result);	
				return "redirect:/goAdminMain.do";  	
			}
			
			if( result.getMember_level().equals("1") ){
				return "member/memberBeforeJoin";
			}else if( result.getMember_level().equals("3") ){
				model.addAttribute("member", result);
				session.setAttribute("member", result);
				return "member/memberRejectJoin";
			}
			
			
			session.setAttribute("login", result);
			List<Map<String,Object>> heartTo = heartService.getToHeartList(result);	//로그인 되었을때 부분
			session.setAttribute("heartto",heartTo);
			
			return "redirect:/loginOK.do?language="+result.getMember_country();
			
		} else {

			model.addAttribute("msg", "로그인 실패."); 
			model.addAttribute("url", "/"); 
			
			return "/popup/alert";
		}
	}
	
	@RequestMapping(value="/loginOK.do")
		public String loginOK() {
			return "/login";
		}

	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}	

}

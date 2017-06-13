package com.yedam.bridgecode.matching;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.bridgecode.member.MemberService;
import com.yedam.bridgecode.member.MemberVO;

@Controller
@SessionAttributes("matching")
public class MatchingController {

	@Autowired
	MatchingService MatchingService;
	@Autowired
	MemberService memberService;
	
	// 조건에 맞는 회원 찾기
	@RequestMapping("/matching/memberMatchingList.do")
	public String getCodeList(CodeVO vo, Model model) {
		MemberVO me = new MemberVO();
		List<Map<String, Object>> list = memberService.getMemberList();
		model.addAttribute("member", list);
		List<Map<String, Object>> interest = MatchingService.getCodeList(vo);
		model.addAttribute("list", interest);
		return "matching/memberMatchingList";
	}
	// 상세프로필 보기로 이동
	@RequestMapping("/matching/memberSelect.do")
	public String memberSelect(MemberVO vo, @RequestParam String id, Model model) {
		vo.setMember_id(id);
		MemberVO member = memberService.getMember(vo);
		model.addAttribute("profile", member);

		return "matching/memberSelect";
	}
	// 서브프로필 이미지 추가 폼으로 
	@RequestMapping("/profile/profileUpdate.do")
	public String profileInsertForm() {
		return "profile/profileUpdate";
	}
	
	// 서브프로필 이미지추가 
		@RequestMapping(value="/profile/profileUpdate.do" ,method= RequestMethod.POST)
		public String profileUpdate(MemberVO vo,
									HttpServletRequest request) 
				throws IllegalStateException,IOException{
			
			long t = System.currentTimeMillis();
			String randomName = t+""; 				//랜덤 이름 정하기
			String realPath = request.getSession().getServletContext().getRealPath("/");//서블릿 내의 realPath 
			MultipartFile file = vo.getUploadFile();
			File saveFile = new File(realPath+"profile_img/",randomName);
			file.transferTo(saveFile);  //서버에 파일 저장
			vo.setMember_img1(randomName); //파일명 저장 file.getOriginalFilename()
			MatchingService.profileUpdate(vo);
			
			return "redirect:/matching/memberSelect.jsp";
		}
}

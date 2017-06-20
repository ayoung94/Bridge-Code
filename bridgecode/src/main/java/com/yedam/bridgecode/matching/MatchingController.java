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
import org.springframework.web.bind.annotation.ResponseBody;
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

	//코드리스트 출력
	@RequestMapping("/matching/memberMatchingList.do")
	public String getCodeList(CodeVO vo, Model model) {
		List<Map<String, Object>> interest = MatchingService.getCodeList(vo);
		model.addAttribute("list", interest);
		return "matching/memberMatchingList";
		
	}
	//조건에 맞는 회원 찾기
	@RequestMapping("/matching/memberMatching.do")
	public @ResponseBody List<Map<String, Object>> getMemberList(MemberVO vo, Model model)throws Exception{
		//model.addAttribute("member", MatchingService.getMemberList(vo));
		return MatchingService.getMemberList(vo);

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
	/*
	 * @RequestMapping("/profile/profileUpdate.do") public String
	 * profileUpdateForm(MemberVO vo , Model model , HttpSession session) {
	 * MemberVO member = (MemberVO)session.getAttribute("login");
	 * model.addAttribute("member", member); session.setAttribute("member",
	 * member); return "profile/profileUpdate"; }
	 */

	// 서브프로필 이미지추가
	@RequestMapping(value = "/profile/profileUpdate.do", method = RequestMethod.POST)
	public String profileUpdate(MemberVO vo,
	// @RequestParam String img,
			HttpServletRequest request) throws IllegalStateException,
			IOException {

		long t = System.currentTimeMillis();
		String randomName = t + ""; // 랜덤 이름 정하기
		String realPath = request.getSession().getServletContext()
				.getRealPath("/");// 서블릿 내의 realPath
		String image = request.getParameter("img");
		System.out.println(image);
		MultipartFile file = vo.getUploadFile();
		File saveFile = new File(realPath + "profile_img/", randomName);
		file.transferTo(saveFile); // 서버에 파일 저장
		if (image.equals("member_img1")) {
			vo.setMember_img1(randomName); // 파일명 저장 file.getOriginalFilename()
			System.out.println("1번11111111");
		}
		if (image.equals("member_img2")) {
			vo.setMember_img2(randomName); // 파일명 저장 file.getOriginalFilename()
			System.out.println("2번222222222");
		}
		if (image.equals("member_img3")) {
			vo.setMember_img3(randomName); // 파일명 저장 file.getOriginalFilename()
			System.out.println("3번333333333");
		}
		MatchingService.profileUpdate(vo);

		return "/login";
	}

	// 자기 소개글 수정
	@RequestMapping(value="/profile/introductionUpdate.do", method=RequestMethod.POST)
	public String introductionUpdate(MemberVO vo
									/*, @RequestParam String id*/
									,HttpServletRequest request){

		MatchingService.introductionUpdate(vo);
		return "/login";

	}
}
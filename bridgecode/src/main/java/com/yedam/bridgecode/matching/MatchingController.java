package com.yedam.bridgecode.matching;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String getCodeList(CodeVO vo, Model model,HttpSession session) {
		if(session.getAttribute("login") == null){
			model.addAttribute("msg", "로그인 해주세요"); 
			model.addAttribute("url", "/"); 
			return "/popup/alert";
		}
		List<Map<String, Object>> interest = MatchingService.getCodeList(vo);
		model.addAttribute("list", interest);
		return "matching/memberMatchingList";
		
	}
	//조건에 맞는 회원 찾기
	@RequestMapping("/matching/memberMatching.do")
	public @ResponseBody List<Map<String, Object>> getMemberList(MemberVO vo,
								HttpSession session, HttpServletRequest request) throws Exception {
		// model.addAttribute("member", MatchingService.getMemberList(vo));
		vo = (MemberVO)session.getAttribute("login");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		String minage = request.getParameter("minage");
		String maxage = request.getParameter("maxage");
		String toggle = request.getParameter("toggle");
		String optionsRadios = request.getParameter("optionsRadios");
		// 최소 검색나이
		map.put("minage", minage);
		// 최대 검색나이
		map.put("maxage", maxage);
		// toggle(남 or 여)
		map.put("toggle", toggle);
		// 국적선택
		map.put("optionsRadios", optionsRadios);
		System.out.println(map);
		return MatchingService.getMemberList(map);

	}
	// 실시간 ajax 조건검색  
	@RequestMapping("/matching/realMatching.do")
	public @ResponseBody List<Map<String, Object>> realMatchingList(
								MemberVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		vo = (MemberVO)session.getAttribute("login");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		// 변수 선언
		String minage = request.getParameter("minage");
		String maxage = request.getParameter("maxage");
		String toggle = request.getParameter("toggle");
		String sliderRange = request.getParameter("sliderRange");		
		String optionsRadios = request.getParameter("optionsRadios");
		String interest1 = request.getParameter("interest1");
		String interest2 = request.getParameter("interest2");		
		String interest3 = request.getParameter("interest3");
		// 최소 검색나이
		map.put("minage", minage);
		// 최대 검색나이
		map.put("maxage", maxage);
		// toggle(남 or 여)
		map.put("toggle", toggle);
		// 연령
		map.put("sliderRange", sliderRange);
		// 국적선택
		map.put("optionsRadios", optionsRadios);
		// 관심사
		map.put("interest1", interest1);
		// 관심사
		map.put("interest2", interest2);
		// 관심사
		map.put("interest3", interest3);
		// 관심사
	
		return MatchingService.realMatchingList(map);
	}

	// 상세프로필 보기로 이동
	@RequestMapping("/matching/memberSelect.do")
	public String memberSelect(CodeVO co, MemberVO vo, @RequestParam String id, Model model, HttpSession session) {
		if(session.getAttribute("login") == null){
			model.addAttribute("msg", "로그인 해주세요"); 
			model.addAttribute("url", "/"); 
			return "/popup/alert";
		}
		vo.setMember_id(id);
		MemberVO member = memberService.getMember(vo);
		model.addAttribute("profile", member);
		
		List<Map<String, Object>> interest = MatchingService.getCodeList(co);
		model.addAttribute("list", interest);
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

		return "login";
	}

	// 자기 소개글 수정
	@RequestMapping(value="/profile/introductionUpdate.do", method=RequestMethod.POST)
	public String introductionUpdate(MemberVO vo
									/*, @RequestParam String id*/
									,HttpServletRequest request){

		MatchingService.introductionUpdate(vo);
		return "login";
	}
	
	// 이성 멤버 리스트
	@RequestMapping(value="/matching/searchGenderList.do")
	public String searchGenderList(MemberVO vo, Model model,HttpSession session,HttpServletRequest request){
		List<Map<String, Object>> memberlist = MatchingService.searchGenderList(vo);
		model.addAttribute("list", memberlist);
		return "matching/searchGenderList";
	}
	
	// 전체 멤버 리스트
	@RequestMapping(value="/matching/allmemberList.do")
	public String memberList(MemberVO vo, Model model,HttpSession session,HttpServletRequest request){
		List<Map<String, Object>> memberlist = MatchingService.allmemberList(vo);
		model.addAttribute("list", memberlist);
		return "matching/allmemberList";
	}
}
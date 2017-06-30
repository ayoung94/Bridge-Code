package com.yedam.bridgecode.chart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.bridgecode.member.MemberVO;

@Controller
public class ChartController {

	@Autowired ChartMapper chartDAO;

	//site 차트 보기
	@RequestMapping("/Ratioview.do")
	public String ratioView(MemberVO vo) {
		return "/ADMIN/chart/siteStats";
	}

	//성비 차트
	@RequestMapping("/sexRatio.do")
	public @ResponseBody List<Map<String, Object>> sexRatio(MemberVO vo) {
		return chartDAO.sexRatio(vo);
	}

	//성비 차트
	@RequestMapping("/countryRatio.do")
	public @ResponseBody List<Map<String, Object>> countryRatio(MemberVO vo) {
		return chartDAO.countryRatio(vo);
	}

	//월별 사용 하트 수
	@RequestMapping("/monthRatio.do")
	public @ResponseBody List<Map<String, Object>> monthRatio(MemberVO vo) {
		return chartDAO.monthRatio(vo);
	}

	//월별 커플 성사 수
	@RequestMapping("/monthCoupleRatio.do")
	public @ResponseBody List<Map<String, Object>> monthCoupleRatio(MemberVO vo) {
		return chartDAO.monthCoupleRatio(vo);
	}

	//전체 유저 대비 커플 수
	@RequestMapping("/coupleRatio.do")
	public @ResponseBody List<Map<String, Object>> coupleRatio(MemberVO vo) {
		return chartDAO.coupleRatio(vo);
	}
}
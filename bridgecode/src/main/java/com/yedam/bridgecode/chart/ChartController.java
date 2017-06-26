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

	//sie 차트 보기
	@RequestMapping("/Ratioview.do")
	public String ratioView(MemberVO vo) {
		return "/popup/chart/siteStats";
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
}
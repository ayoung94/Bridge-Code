package com.yedam.bridgecode.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.googlecode.charts4j.Color;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.PieChart;
import com.googlecode.charts4j.Slice;


@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	@Autowired NoticeMapper noticeDAO;

	//등록폼
	@RequestMapping(value="/noticeInsertForm.do")
	//값(value)을 사용하면 배열로도 가능
	public String noticeInsert() {
		return "notice/noticeInsert";
	}


	//등록
	@RequestMapping(value="/noticeInsert.do", 
			method = RequestMethod.POST)
	public String noticeInsert(NoticeVO noticeVO, 
			HttpServletRequest request) {
		//noticeVO noticeVO, LoginVo loginvo 로 두개 이상의 VO에 파라미터 입력 가능
		System.out.println("등록:" + noticeVO);
		/* 또다른 예시 : UserVO vo = new UserVO();
			vo.setName(request.getParameter("name"));AI
			vo.setId(request.getParameter("id"));
			System.out.println("파라미터:" + vo);
		 */		
		noticeService.insertNotice(noticeVO);
		return "redirect:/getNoticeList.do";
	}
/*
	//다건조회
	@RequestMapping(value="/getNoticeList.do")
	public String getNoticeList(NoticeVO vo, Model model) {
		//List<Map<String, Object>> list = userService.getUserList(vo);
		//List<NoticeVO> list = noticeService.getNoticeListVO(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "notice/noticeList";
	}*/

	//단건조회
	@RequestMapping(value="/getNotice.do")
	public String getUser(NoticeVO vo, Model model) {
		NoticeVO list = noticeService.getNotice(vo);
		model.addAttribute("notice", list);
		return "notice/getNotice";
	}
/*-------------------------------------------------------*/
	//chart시작
	
	/*@RequestMapping("/getNoticeChart.do")
	public String getChart(Model model) {

		Slice s1 = Slice.newSlice(15, Color.newColor("CACACA"),"mac"); 
		Slice s2 = Slice.newSlice(50, Color.newColor("DF7417"),"window"); 
		Slice s3 = Slice.newSlice(25, Color.newColor("951800"),"linux"); 
		Slice s4 = Slice.newSlice(10, Color.newColor("01A1DB"),"others"); 
		PieChart pieChart = GCharts.newPieChart(s1,s2,s3,s4);  
		pieChart.setTitle("google chart", Color.BLACK,15); 
		pieChart.setSize(720, 360); 
		pieChart.setThreeD(true);	//3D화 여부 
		model.addAttribute("pieUrl",pieChart.toURLString());
		return "chart/getChart";
	}*/

	//공지사항목록
	@RequestMapping("/getNoticeList.do")
	public String getNoticeList(Model model) {
		model.addAttribute("noticeList", noticeDAO.getNoticeList());
		return "notice/noticeList";
	}

	


}

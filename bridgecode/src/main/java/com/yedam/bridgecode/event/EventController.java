package com.yedam.bridgecode.event;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.googlecode.charts4j.Color;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.PieChart;
import com.googlecode.charts4j.Slice;
import com.yedam.bridgecode.member.MemberVO;


@Controller
public class EventController {

	@Autowired
	EventService eventService;
	@Autowired EventMapper eventDAO;

	//등록폼
	@RequestMapping(value="/eventInsertForm.do")
	//값(value)을 사용하면 배열로도 가능
	public String eventInsert(HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		if(member != null){
			if(member.getMember_level().equals("0")){
				return "/ADMIN/event/eventInsert";
			}
			}
		return "event/eventInsert";
	}

	//등록
	@RequestMapping(value="/eventInsert.do", 
			method = RequestMethod.POST)
	public String eventInsert(EventVO eventVO, 
			HttpServletRequest request) {
		//eventVO eventVO, LoginVo loginvo 로 두개 이상의 VO에 파라미터 입력 가능
		System.out.println("등록:" + eventVO);
		/* 또다른 예시 : UserVO vo = new UserVO();
			vo.setName(request.getParameter("name"));AI
			vo.setId(request.getParameter("id"));
			System.out.println("파라미터:" + vo);
		 */		
		eventService.insertEvent(eventVO);
		return "redirect:/getEventList.do";
	}

	//단건조회
	@RequestMapping(value="/getEvent.do")
	public String getUser(EventVO vo, Model model,HttpSession session) {
		eventService.updateCnt(vo);
		EventVO list = eventService.getEvent(vo);
		model.addAttribute("event", list);
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		if(member != null){
			if(member.getMember_level().equals("0")){
				return "/ADMIN/event/getEvent";
			}
			}
		return "event/getEvent";
	}

	//다건조회(datatable()사용)
	@RequestMapping("/getEventList.do")
	public String getEventList(Model model,HttpSession session) {
		model.addAttribute("eventList", eventDAO.getEventList());
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		if(member != null){
			if(member.getMember_level().equals("0")){	
				return "/ADMIN/event/eventList";
			}
			}
		return "event/eventList";
	}

	//수정
	@RequestMapping("/modifyEvent.do")
	public String updateEvent(EventVO vo) {
		eventService.updateEvent(vo);
		return "redirect:/getEvent.do?eventId="+vo.getEventId();
	}
	
	//삭제
	@RequestMapping("deleteEvent.do")
	public String deleteEvent(EventVO vo) {
		eventService.deleteEvent(vo);
		return "redirect:/getEventList.do";
	}
	
	/*-------------------------------------------------------*/
	//chart시작

	/*@RequestMapping("/getEventChart.do")
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
}
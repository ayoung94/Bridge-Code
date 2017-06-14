package com.yedam.bridgecode.chat;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("/chat/chatTranslate.json")
	public @ResponseBody String chatTranslate(HttpServletRequest request) {
		String value = request.getParameter("value");
		String source = request.getParameter("source");
		String target = request.getParameter("target");

		if(source.equals("jp")){source = "ja";}
		if(source.equals("cn")){source = "zh-CN";}
		if(target.equals("jp")){target = "ja";}
		if(target.equals("cn")){target = "zh-CN";}
		
		System.out.println("text="+value+"  source="+source+"  target="+target);
		
		String result = null;
		String result2 = null;
		
		String clientId = "39RaYZCZYozCqIczMVmJ";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "UYrfrl7T73";//애플리케이션 클라이언트 시크릿값";
        try {
        	
            String text = URLEncoder.encode(value, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/language/translate";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source="+source+"&target="+target+"&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            
            br.close();
            result = response.toString();
            int i = result.indexOf("translatedText");
            result2 = result.substring(i+17, result.length());
            result2 = result2.substring(0,result2.length()-4);
            
            result2 = URLEncoder.encode(result2,"UTF-8");

        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("result="+result2);
		
        return result2; 
	}
	
	
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
	
	@RequestMapping(value="/warning/warningInsert.do",method= RequestMethod.POST)
	public String warningInsert(Model model,
							  MemberVO partner,
							  MemberVO vo,
							  HttpSession session) {
		
		vo = (MemberVO)session.getAttribute("login");
		partner.setMember_id(vo.getMember_partner_id());
		partner = memberService.getMember(partner);
		
		
		
		return "";
	}
	
	@RequestMapping("/warning/warningInsert.do")
	public String warningInsertForm() {
		return "/popup/chat/warningInsert";
	}

}

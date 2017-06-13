package com.yedam.bridgecode.chat;

import java.util.List;
import java.util.Map;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
	
	@RequestMapping("/chat/chatTranslate.do")
	public void chatTranslate(String tt) {
		
		String clientId = "Yq8eXfIrImd6XBx6QhUs";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "xwZV9UFHNJ";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode("만나서 반갑습니다.", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/language/translate";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source=ko&target=en&text=" + text;
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
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
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

}

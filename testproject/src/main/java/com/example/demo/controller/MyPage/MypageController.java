package com.example.demo.controller.MyPage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Alarm;
import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.service.MypageService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MypageController {
	
	private final MypageService service; 
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Alarm alarm, Runner runner, Model model) {

		Member member = (Member) session.getAttribute("member");

		if (member == null) {
			return "redirect:/loginpage";
		}

		String user_id = member.getUser_id();
		Runner dbrunner = service.getMember(user_id);
		Alarm[] dbalarm = service.getAlarm(user_id);


		model.addAttribute("runner", dbrunner);
		model.addAttribute("dbalarm", dbalarm);

		return "/mypage/mypage";
	}
}

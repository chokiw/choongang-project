package com.example.demo.controller.UserPage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.service.UserpageService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class UserpageController {
	private final UserpageService service;
	
	//다른 사람 정보 페이지로 이동
	@RequestMapping("/userpage")
	public String userpage(@RequestParam(value="user_id", required=false)String user_id,
							HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");

		if (member == null) {
			return "redirect:/loginpage";
		}
		
		if (user_id == null || user_id.isEmpty()) {
	        return "redirect:/mypage"; // 파라미터 없으면 마이페이지로 이동
	    }
		
		Runner userRunner = service.getMemberB(user_id);
		model.addAttribute("runner", userRunner);

		return "/userpage/userpage";
	}
	
}

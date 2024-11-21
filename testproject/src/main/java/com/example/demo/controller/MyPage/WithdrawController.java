package com.example.demo.controller.MyPage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.service.MypageService;
import com.example.demo.service.WithdrawService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WithdrawController {
	
	private final MypageService service; 
	private final WithdrawService withdrawservice;
	
	@RequestMapping("/withdraw")
	public String withdraw() {
		return "/mypage/mywithdraw/withdraw";
	}
	
	@RequestMapping("/withdraw_ok")
	public String withdraw(@RequestParam("user_passwd") String userPasswd, HttpSession session, Model model) {
	    int result = 0;

	    Member member = (Member) session.getAttribute("member");

	    if (member == null) {
	        return "redirect:/loginpage";
	    }

	    Runner dbrunner = service.getMember(member.getUser_id());

	    if (dbrunner.getUser_passwd().equals(userPasswd)) {
	        result = withdrawservice.runner_delete(member.getUser_id());
	        session.invalidate(); // 세션 종료
	    } else {
	        result = -1;
	    }
	    model.addAttribute("result", result);
	    return "/mypage/mywithdraw/withdrawresult";
	}

}
package com.example.demo.controller.Login;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.service.LoginService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class LoginController {
	private final LoginService service;
	@Autowired
	PasswordEncoder passwordEncoder;

	// 로그인 페이지로 이동
	@RequestMapping("/loginpage")
	public String loginpage() {
		System.out.println("loginpage");
		return "login/login";
	}

	// 아이디 찾기 창으로 이동
	@RequestMapping("/find_id")
	public String find_id() {
		return "login/find_id";
	}

	// 비번찾기창으로 이동
	@RequestMapping("/find_pass")
	public String find_pass() {
		return "login/find_pass";
	}

	// 아이디 찾기 액션
	@RequestMapping(value = "find_id_ok", method = RequestMethod.POST)
	public String find_id_ok(@ModelAttribute Runner runner, Model model) {
		Runner run = service.findid(runner);

		if (run == null) {
			return "login/id_result";
		} else {
			String id = run.getUser_id();

			model.addAttribute("id", id);
			return "login/id_ok";
		}
	}

	// 비번찾기 : email로 전송
	@RequestMapping(value = "find_pass_ok", method = RequestMethod.POST)
	public String pwd_find_ok(@ModelAttribute Runner runner, Model model) {

		Runner run = service.findpass(runner);

		if (run == null) {
			return "/login/id_result";

		} else {

			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "wnduddud97@naver.com";
			String hostSMTPpwd = "ymsgksmf82"; // 비밀번호 입력해야함

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "wnduddud97@naver.com";
			String fromName = "관리자";
			String subject = "비밀번호 찾기";

			// 받는 사람 E-Mail 주소
			String mail = run.getUser_emailid() + "@" + run.getUser_domain();

			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호:"
						+ run.getUser_passwd() + "</div>");
				email.send();
			} catch (Exception e) {
				System.out.println(e);
			}

			return "/login/pass_ok";

		}
	}

	// 로그인 서비스
	@RequestMapping("/login")
	public String login(@ModelAttribute Runner runner, HttpSession session, Model model) {
		int result = 0;

		Runner dbrunner = service.getMember(runner.getUser_id());

		if (dbrunner !=null &&passwordEncoder.matches(runner.getUser_passwd(), dbrunner.getUser_passwd())) {
			result = 1;
			Member member = new Member();
			member.setUser_id(dbrunner.getUser_id());
			member.setUser_nickname(dbrunner.getUser_nickname());
			member.setUser_photo(dbrunner.getUser_photo());
			session.setAttribute("member", member);
		} else {
			result = -1;
		}

		model.addAttribute("result", result);
		return "/login/loginresult";
	}
}

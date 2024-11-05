package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.ProjectService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins="*")
public class ProjectController {
		
	
	private final ProjectService service;
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/mainpage")
	public String mainpage() {
		return "mainpage";
	}
	
	@RequestMapping("/loginpage")
	public String loginpage() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(@ModelAttribute Runner runner,HttpSession session,Model model) {
		int result=0;
		
		Runner dbrunner=service.getMember(runner.getUser_id());
		
		if(dbrunner.getUser_passwd().equals(runner.getUser_passwd())) {
			result=1;
			Member member=new Member();
			member.setUser_id(dbrunner.getUser_id());
			member.setUser_nickname(dbrunner.getUser_nickname());
			member.setUser_photo(dbrunner.getUser_photo());
			session.setAttribute("member", member);
		}else {
			result=-1;
		}
		
		model.addAttribute("result", result);
		return "loginresult";
	}
	
	@RequestMapping("/member")
	public String member() {
		return "member";
	}
	
	
	@RequestMapping("/membership")
	public String membership(@ModelAttribute Runner runner,Model model) {
		int result=0;
		
		result=service.insert(runner);
		
		model.addAttribute("result",result);
		
		return "membershipresult";
	}
	
	@RequestMapping("/snspage")
	public String snspage() {
		return "snspage";
	}
	
	@RequestMapping("/snsdetail")
	public String snsdetail() {
		return "snsdetail";
	}
	
	@RequestMapping("/snslist")
	public String snslist(@RequestParam(value="pageNum",defaultValue="1") String pageNum,SnsBoard sns, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = service.getTotal(sns); // 검색
		System.out.println("total:"+total);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		
		sns.setStartRow(startRow);
		sns.setEndRow(endRow);
		int no = total - startRow + 1;
		System.out.println("no:"+no);
		List<SnsBoard> list = service.list(sns);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", sns.getSearch());
		model.addAttribute("keyword", sns.getKeyword());
		
		return "snslist";
	}

	
}
package com.example.demo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.ProjectService;
import com.example.demo.service.ProjectService_juyoung;
import com.example.demo.service.SJLService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

@CrossOrigin(origins = "*")
public class ProjectController_juyoung {

	private final ProjectService_juyoung service;
	
	// 트랙 게시판 수정폼으로 이동
	@RequestMapping("/sns_update")
	public String sns_update(@RequestParam(value = "pageNum") String pageNum,
			@RequestParam(value = "sns_no") String sns_no, Model model) {
		
				// 글정보 불러오기
				SnsBoard board = service.getboard(Integer.parseInt(sns_no));
				// 맵에 경로 표현을 위한 테이터 불러오기
				Runner_data rd = service.getrdata(board.getRunner_data_no());
				// 좌표값 불러오기
				Coordinate[] c = service.getcdata(board.getRunner_data_no());

				
				model.addAttribute("rd", rd);
				model.addAttribute("c", c);
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("board", board);
			
		
		return "sns_update";
	}
	
	// 트랙 게시판 수정 완료
	@RequestMapping("/snsupdate")
	public String snsupdate(@RequestParam(value = "pageNum")  String pageNum,   Model model, SnsBoard sns) {
		
		int sns_no = sns.getSns_no();
		SnsBoard board = service.getboard(sns_no);
		
	
		int update = service.updateboard(sns);
		
		model.addAttribute("sns_no",sns_no);
		model.addAttribute("update",update);
		model.addAttribute("pageNum", pageNum);
		return "snsupdateresult";
	}
	
	// 트랙 게시판 삭제
	@RequestMapping("/snsdelete")
	public String snsdelete(@RequestParam(value = "pageNum")  String pageNum,   Model model, SnsBoard sns) {
		
		int sns_no = sns.getSns_no();
		SnsBoard board = service.getboard(sns_no);
		
		int delete = service.deleteboard(sns);
		
		
		model.addAttribute("sns_no",sns_no);
		model.addAttribute("delete",delete);
		model.addAttribute("pageNum", pageNum);
		return "snsdeleteresult";
	}
	
	
	// 메이트 게시판 수정 폼으로 이동
	@RequestMapping("/mate_update")
	public String mate_detail(@RequestParam(value = "pageNum") String pageNum,
			@RequestParam(value = "recruit_no") String recruit_no, Model model) {
		
		// 글정보 불러오기
		RecruitBoard board = service.getrecruitD(Integer.parseInt(recruit_no));
		// 맵에 경로 표현을 위한 테이터 불러오기
		Recruit_c[] rc = service.getrecruitC(board.getRecruit_no());
		
		//글쓴이 정보 불러오기
		Runner r = service.getMember(board.getUser_id());
		
		model.addAttribute("r", r);
		model.addAttribute("rc", rc);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);

		return "mate_update";
	}
	
	// 메이트 게시판 수정
	@RequestMapping("/mateupdate")
	public String mateupdate(@RequestParam(value="coords") String[] coords,
			@RequestParam(value = "pageNum")  String pageNum, RecruitBoard rb,Model model ) {
		System.out.println("수정");
		System.out.println(rb.getRecruit_no());
		System.out.println(rb.getUser_id());
		System.out.println(rb.getRecruit_d_day());
		System.out.println(rb.getRecruit_recruitnum());
		System.out.println(rb.getRecruit_remainnum());
		System.out.println(rb.getRecruit_subject());
		System.out.println(rb.getRecruit_content());
		System.out.println(rb.getRecruit_address1());
		System.out.println(rb.getRecruit_address2());
		
		for(String s: coords) {
			System.out.println(s);
		}
	
		int update =0;
		
		model.addAttribute("update",update);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("recruit_no", rb.getRecruit_no());
		return "mateupdateresult";
	}
	
	
	// 메이트 게시판 삭제
	@RequestMapping("/matedelete")
	public String matedelete(@RequestParam(value = "pageNum")  String pageNum,   Model model, RecruitBoard rb) {
		
		int recruit_no = rb.getRecruit_no();
		RecruitBoard board	= service.getrecruitD(recruit_no);
		
		int delete = service.deleterb(rb);
		
		
		model.addAttribute("recruit_no",recruit_no);
		model.addAttribute("delete",delete);
		model.addAttribute("pageNum", pageNum);
		return "matedeleteresult";
	}
	
	

	
	
	
	
	
	
	}
	
	
	


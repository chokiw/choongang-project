package com.example.demo.controller.Mate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.RecruitBoard;
import com.example.demo.service.MateDeleteService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MateDeleteController {
	private final MateDeleteService service;
	
	// 메이트 게시판 삭제
	@RequestMapping("/matedelete")
	public String matedelete(@RequestParam(value = "pageNum") String pageNum, Model model, RecruitBoard rb) {

		int recruit_no = rb.getRecruit_no();
		RecruitBoard board = service.getrecruitD(recruit_no);

		int delete = service.deleteRecruit(recruit_no);

		model.addAttribute("recruit_no", recruit_no);
		model.addAttribute("delete", delete);
		model.addAttribute("pageNum", pageNum);
		return "/mate/mateDelete/matedeleteresult";
	}

}

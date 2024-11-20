package com.example.demo.controller.Mate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.service.MateUpdateService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MateUpdateController {
	private final MateUpdateService service;
	
	// 메이트 게시판 수정 폼으로 이동
	@RequestMapping("/mate_update")
	public String mate_detail(@RequestParam(value = "pageNum") String pageNum,
			@RequestParam(value = "recruit_no") String recruit_no, Model model) {

		// 글정보 불러오기
		RecruitBoard board = service.getrecruitD(Integer.parseInt(recruit_no));
		// 맵에 경로 표현을 위한 테이터 불러오기
		Recruit_c[] rc = service.getrecruitC(board.getRecruit_no());

		// 글쓴이 정보 불러오기
		Runner r = service.getMember(board.getUser_id());

		model.addAttribute("r", r);
		model.addAttribute("rc", rc);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);

		return "/mate/mateUpdate/mate_update";
	}

	// 메이트 게시판 수정
	@RequestMapping("/mateupdate")
	public String mateupdate(@RequestParam(value = "coords") String[] coords,
			@RequestParam(value = "pageNum") String pageNum, RecruitBoard rb, Model model) {
		System.out.println("mate수정");

		int update = service.updateRb(rb);
		service.deleteRc(rb.getRecruit_no());
		int cnt = 0;
		Recruit_c[] rc = new Recruit_c[coords.length / 2];
		for (int i = 0; i < coords.length; i += 2) {
			rc[cnt] = new Recruit_c();
			rc[cnt].setRecruit_no(rb.getRecruit_no());
			rc[cnt].setLat(coords[i]);
			rc[cnt].setLng(coords[i + 1]);
			service.setRecruitC(rc[cnt]);
			cnt++;
		}

		model.addAttribute("update", update);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("recruit_no", rb.getRecruit_no());
		return "/mate/mateUpdate/mateupdateresult";
	}
}

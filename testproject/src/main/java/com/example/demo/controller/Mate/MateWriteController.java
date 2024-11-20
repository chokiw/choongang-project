package com.example.demo.controller.Mate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.service.MateWriteService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MateWriteController {
	private final MateWriteService service;
	
	// 모집 글쓰기
	@RequestMapping("/mate_write")
	public String mate_write() {

		return "/mate/mateWrite/mate_write";
	}

	// 모집 글쓰기
	@RequestMapping("/mate_writing")
	public String mate_writing(@RequestParam(value = "coords") String[] coords, RecruitBoard board, Model model) {
		board.setRecruit_remainnum(board.getRecruit_recruitnum());
		board.setRecruit_del(0);
		board.setRecruit_readcount(0);
		Recruit_c[] rc = new Recruit_c[coords.length / 2];
		int cnt = 0;

		int result = service.setRecruitBoard(board);

		for (int i = 0; i < coords.length; i += 2) {
			rc[cnt] = new Recruit_c();
			rc[cnt].setLat(coords[i]);
			rc[cnt].setLng(coords[i + 1]);
			service.setRecruitC(rc[cnt]);
			cnt++;
		}

		model.addAttribute("result", result);
		return "/mate/mateWrite/mate_writingresult";
	}
}

package com.example.demo.controller.Track;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.TrackUpdateService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class TrackUpdateController {
	private final TrackUpdateService service;

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

		return "/track/trackUpdate/sns_update";
	}

	// 트랙 게시판 수정 완료
	@RequestMapping("/snsupdate")
	public String snsupdate(@RequestParam(value = "pageNum") String pageNum, Model model, SnsBoard sns) {

		int update = service.updateboard(sns);

		model.addAttribute("sns_no", sns.getSns_no());
		model.addAttribute("update", update);
		model.addAttribute("pageNum", pageNum);
		return "/track/trackUpdate/snsupdateresult";
	}
}

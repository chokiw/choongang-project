package com.example.demo.controller.Track;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.SnsBoard;
import com.example.demo.service.TrackDeleteService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class TrackDeleteController {
	private final TrackDeleteService service;

	// 트랙 게시판 삭제
	@RequestMapping("/snsdelete")
	public String snsdelete(@RequestParam(value = "pageNum") String pageNum, Model model, SnsBoard sns) {

		int sns_no = sns.getSns_no();
		SnsBoard board = service.getboard(sns_no);

		int delete = service.deleteboard(sns);

		model.addAttribute("sns_no", sns_no);
		model.addAttribute("delete", delete);
		model.addAttribute("pageNum", pageNum);
		return "/track/trackDelete/snsdeleteresult";
	}

}

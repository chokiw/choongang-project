package com.example.demo.controller.Mate;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;

import com.example.demo.model.Coordinate;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.MateBoardService;
import com.example.demo.service.PagingPgm;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MateBoardController {
	private final MateBoardService service;

	// 메이트 게시글 목록으로 이동
	@RequestMapping("/mate_board")
	public String mate_board() {
		return "/mate/mate_board";
	}

	// 메이트 리스트 받기
	@RequestMapping("/mate_list")
	public String mate_list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, RecruitBoard recruit,
			Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// 전체데이터 갯수
		int total = service.getrecruitTotal(recruit);
		// System.out.println("total:" + total);
		// 페이지 이동에 따라서 10개의 데이터를 어디서 어디까지 가져올지 알기위한 변수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// 페이지 이동 변수들을 담아놓는 DTO에 저장
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		// DTO에 페이지 변수가져가는 이유는 mapper파일 이동시 매개변수는 1개만 가져갈 수 있다.
		// 따라서 map같은 거에 많은 데이터를 한번에 가져가야한다.
		recruit.setStartRow(startRow);
		recruit.setEndRow(endRow);
		int no = total - startRow + 1;
		// System.out.println("no:" + no);
		// 불러온 게시판 데이터 리스트에 담기
		List<SnsBoard> list = service.recruitList(recruit);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", recruit.getSearch());
		model.addAttribute("keyword", recruit.getKeyword());

		return "/mate/mate_list";
	}

	// 메이트 게시판 지역별로 불러오기
	@RequestMapping("/mate_list_location")
	public String matelist_location(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@RequestParam("recruit_address1") String recruit_address1,
			@RequestParam("recruit_address2") String recruit_address2, @ModelAttribute RecruitBoard recruit,
			Model model) {

		System.out.println("pageNum:" + pageNum);
		System.out.println("recruit_address1:" + recruit_address1);
		System.out.println("recruit_address2:" + recruit_address2);

		int pageNum1 = Integer.parseInt(pageNum);
//			String pageNum1 = UriUtils.encodePath(pageNum, StandardCharsets.UTF_8);
		String encodedPath1 = UriUtils.encodePath(recruit_address1, StandardCharsets.UTF_8);
		String encodedPath2 = UriUtils.encodePath(recruit_address2, StandardCharsets.UTF_8);

//			return redirectUrl;
		return "redirect:/mate_list?pageNum=" + pageNum1 + "&recruit_address1=" + encodedPath1 + "&recruit_address2="
				+ encodedPath2;
	}

}

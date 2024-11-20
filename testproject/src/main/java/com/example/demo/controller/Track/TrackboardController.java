package com.example.demo.controller.Track;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;

import com.example.demo.model.SnsBoard;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.TrackboardService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class TrackboardController {
	private final TrackboardService service;

	// 트랙게시판
	@RequestMapping("/sns_board")
	public String sns_board() {
		return "track/sns_board";
	}

	// 트랙 게시판 지역별로 불러오기
	@RequestMapping("/snslist_location")
	public String snslist_location(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@RequestParam("sns_address1") String sns_address1, @RequestParam("sns_address2") String sns_address2,
			@ModelAttribute SnsBoard sns, Model modele,HttpServletRequest request, HttpServletResponse response) {

		String path = request.getServletContext().getRealPath("/WEB-INF/views/track"); 
//		System.out.println("pageNum:" + pageNum);
//		System.out.println("sns_address1:" + sns_address1);
//		System.out.println("sns_address2:" + sns_address2);

		int pageNum1 = Integer.parseInt(pageNum);
//			String pageNum1 = UriUtils.encodePath(pageNum, StandardCharsets.UTF_8);
		String encodedPath1 = UriUtils.encodePath(sns_address1, StandardCharsets.UTF_8);
		String encodedPath2 = UriUtils.encodePath(sns_address2, StandardCharsets.UTF_8);

//			return redirectUrl;
		return "redirect:snslist?pageNum=" + pageNum1 + "&sns_address1=" + encodedPath1 + "&sns_address2="
				+ encodedPath2;
	}

	// sns 리스트에서 인기글목록 순으로 나타내 기위한 컨트롤러
	@RequestMapping("/snslist/best")
	public String snslistBest(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, SnsBoard sns,
			Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// 전체 데이터 갯수
		int total = service.getTotal(sns);
		// 페이지 이동에 따라서 10개의 데이터를 어디서 어디까지 가져올지 알기 위한 변수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// 페이지 이동 변수들을 담아놓는 DTO에 저장
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		sns.setStartRow(startRow);
		sns.setEndRow(endRow);
		int no = total - startRow + 1;
		// 불러온 추천수 순으로 정렬된 게시판 데이터를 리스트에 담기
		List<SnsBoard> list = service.listBest(sns);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		model.addAttribute("search", sns.getSearch());
		model.addAttribute("keyword", sns.getKeyword());
		model.addAttribute("best", true); // 인기글 목록임을 표시하는 플래그 추가

		return "track/snslist";
	}
	
	@RequestMapping("/snslist")
	public String snslist(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, SnsBoard sns,
			Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		//전체데이터 갯수
		int total = service.getTotal(sns); 
		//System.out.println("total:" + total);
		//페이지 이동에 따라서 10개의 데이터를 어디서 어디까지 가져올지 알기위한 변수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		//페이지 이동 변수들을 담아놓는 DTO에 저장
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		
		//DTO에 페이지 변수가져가는 이유는 mapper파일 이동시 매개변수는 1개만 가져갈 수 있다.
		//따라서  map같은 거에 많은 데이터를 한번에 가져가야한다.
		sns.setStartRow(startRow);
		sns.setEndRow(endRow);
		int no = total - startRow + 1;
		//System.out.println("no:" + no);
		//불러온 게시판 데이터 리스트에 담기
		List<SnsBoard> list = service.list(sns);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", sns.getSearch());
		model.addAttribute("keyword", sns.getKeyword());
		model.addAttribute("sns_address1", sns.getSns_address1());
		model.addAttribute("sns_address2", sns.getSns_address2());
		return "track/snslist";
	}
}

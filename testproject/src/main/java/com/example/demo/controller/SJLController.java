package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.SJLService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class SJLController {
	private final SJLService service;

	// 모집 글쓰기
	@RequestMapping("/sns_writing")
	public String sns_writing(SnsBoard board, Model model) {
		
		int result = service.insertSns(board);

		model.addAttribute("result", result);
		return "sns_writingresult";
	}

	//트랙과 모집에 글쓰기할때 지도에 데이터를 불러오기 위해서 필요한 컨트롤러
	@RequestMapping("/getMyData")
	@ResponseBody
	public List getMyData(@RequestParam(value = "runner_data_no") String runner_data_no) {
		List list = new ArrayList();

		Runner_data rd = service.getrd(Integer.parseInt(runner_data_no));
		Coordinate[] cd = service.getc(Integer.parseInt(runner_data_no));

		String[] cdarr = new String[cd.length * 2];

		int i = -1;
		for (Coordinate c : cd) {
			cdarr[++i] = c.getLat();
			cdarr[++i] = c.getLng();
		}

		list.add(cdarr);
		list.add(rd.getRunner_data_distance());
		list.add(rd.getRunner_data_time());

		return list;
	}

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

		return "mate_list";
	}

	// 모집 글상세
	@RequestMapping("/mate_detail")
	public String mate_detail(@RequestParam(value = "pageNum",defaultValue = "1") String pageNum,
			@RequestParam(value = "recruit_no") String recruit_no, Model model) {
		// 글정보 불러오기
		RecruitBoard board = service.getrecruitD(Integer.parseInt(recruit_no));
		// 맵에 경로 표현을 위한 테이터 불러오기
		Recruit_c[] rc = service.getrecruitC(board.getRecruit_no());
		// 글쓴이 정보 불러오기
		Runner r = service.getMember_SJL(board.getUser_id());

		model.addAttribute("r", r);
		model.addAttribute("rc", rc);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);

		return "mate_detail";
	}

	// 모집 글쓰기
	@RequestMapping("/mate_write")
	public String mate_write() {

		return "mate_write";
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
		return "mate_writingresult";
	}

	// 기록측정을 관리하는 컨트롤러
	@RequestMapping("/runnerdata")
	@ResponseBody
	public int runnerdata(@RequestParam(value = "path") String[] path,
			@RequestParam(value = "distance") String distance, @RequestParam(value = "time") String time,
			HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		Runner_data rd = new Runner_data();
		rd.setUser_id(member.getUser_id());
		rd.setRunner_data_distance(distance);
		rd.setRunner_data_time(Integer.toString(Integer.parseInt(distance)/100));

		int result = service.setRunnerdata(rd);

		for (int i = 0; i < path.length; i++) {
			Coordinate coord = new Coordinate();
			coord.setLat(path[i]);
			coord.setLng(path[++i]);
			service.setCoordinate(coord);
		}

		Runner runner = new Runner();

		runner.setUser_distance(Integer.parseInt(distance) + runner.getUser_distance());
		runner.setUser_runtime(Integer.parseInt(rd.getRunner_data_time()) + runner.getUser_runtime());
		runner.setUser_id(member.getUser_id());
		// 뛴거리와 시간 업데이트
		service.updateRunnerdata(runner);
		return result;
	}
	
	@RequestMapping("/runnerdataresult")
	public String runnerdataresult(@RequestParam(value="result") String result,Model model) {
		model.addAttribute("result",Integer.parseInt(result));
		return "runnerdataresult";
	}

}

package com.example.demo.controller.MyPage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.Runner_data;
import com.example.demo.service.MytrackService;
import com.example.demo.service.PagingPgm;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MytrackController {
	private final MytrackService service;

	// 내가 달린 트랙으로 이동
	@RequestMapping("/runnertrack")
	public String runnertrack(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, HttpSession session,
			Model model) {

		// 세션에서 Member 객체를 가져옴
		Member member = (Member) session.getAttribute("member");

		// 세션에 저장된 내용이 없으면 login페이지로 이동
		if (member == null) {
			return "redirect:/loginpage";
		}

		Runner_data runnerdata = new Runner_data();
		runnerdata.setUser_id(member.getUser_id());

		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = service.getRunnerTrack(member.getUser_id());
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		runnerdata.setStartRow(startRow);
		runnerdata.setEndRow(endRow);
		int no = total - startRow + 1;
		List<Runner_data> list = service.listRunnerTrack(runnerdata);

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);

		return "mypage/mytrack/runnertrack";
	}
	
	//내가 달린 경로 상세페이지 이동
	@RequestMapping("runnertrack_detail")
	public String runnertrack_detail(@RequestParam(value = "runner_data_no") int runner_data_no,Model model) {
		// 맵에 경로 표현을 위한 데이터 불러오기
	    Runner_data rd = service.getRunnerData(runner_data_no);
	    // 좌표값 불러오기
	    Coordinate[] c = service.getCoordData(runner_data_no);

	    model.addAttribute("rd", rd);
	    model.addAttribute("c", c);
		
		
		return "mypage/mytrack/runnertrack_detail";
	}
}

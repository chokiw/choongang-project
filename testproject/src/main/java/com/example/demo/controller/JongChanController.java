package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.JongChanService;
import com.example.demo.service.PagingPgm;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class JongChanController {

	private final JongChanService service;

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
		System.out.println("no:" + no);
		List<Runner_data> list = service.listRunnerTrack(runnerdata);

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);

		return "runnertrack";
	}

	// 모집 글상세
    @RequestMapping("/mate_detail")
    public String mate_detail(@RequestParam(value="sns_no", defaultValue="1")int sns_no, Model model) {
       
    	SnsBoard snsboard = service.getSnsBoardID(sns_no);
    	model.addAttribute("sns", snsboard);
    	
    	Runner runner = service.getRunnerID(snsboard.getUser_id());
    	model.addAttribute("runner", runner);
    	
    	
        return "mate_detail";
    }


}

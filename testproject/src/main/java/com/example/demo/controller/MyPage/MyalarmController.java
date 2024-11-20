package com.example.demo.controller.MyPage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.demo.model.Alarm;
import com.example.demo.model.Member;
import com.example.demo.service.MyalarmService;
import com.example.demo.service.PagingPgm;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MyalarmController {
	private final MyalarmService service;

	//알람 게시판 글 목록
	@RequestMapping("alarm_list")
	public String alram_page(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@SessionAttribute(name = "member", required = false) Member member, Alarm alarm, Model model) {

		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = service.getTotal(alarm);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		alarm.setStartRow(startRow);
		alarm.setEndRow(endRow);
		int no = total - startRow + 1;

		List<Alarm> list = service.alarmList(alarm);

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);

		return "mypage/myalarm/alarm_list";
	}

	//알람 페이지로 이동
	@RequestMapping("alarm_page")
	public String alram_page() {
		return "mypage/myalarm/alarm_page";
	}
	
	//알람 디테일 페이지로 이동
	@RequestMapping("alarm_detail")
	public String alarm_detail(@RequestParam(value = "pageNum") String pageNum, @RequestParam("alarm_no") int alarm_no,
			Model model) {


		Alarm alarm = service.getDetail(alarm_no);

		model.addAttribute("alarm", alarm);

		return "mypage/myalarm/alarm_detail";
	}
}

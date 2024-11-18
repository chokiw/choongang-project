package com.example.demo.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Alarm;
import com.example.demo.model.Apply;
import com.example.demo.model.Member;
import com.example.demo.model.Runner_data;
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
	
	@RequestMapping("/apply")
	@ResponseBody
	public Integer apply(@RequestParam(value="recruit_no") int recruit_no,
						@RequestParam(value="user_id") String user_id,
					   @RequestParam(value="applyType") String applyType) {
		
		Date date = new Date(System.currentTimeMillis());
				
		Apply apply = new Apply();
		apply.setRecruit_no(recruit_no);
		apply.setUser_id(user_id);
		apply.setApply_date(date);
		
		
		Alarm alarm = new Alarm();
		alarm.setUser_id(user_id);
		alarm.setRecruit_no(recruit_no);
		alarm.setAlarm_date(date);
		
		int result = 0;
		
		if("start".equals(applyType)) {
			apply.setApply_del(0);
			alarm.setAlarm_content("참가신청이 완료 되었습니다.");
			alarm.setAlarm_subject("참가신청 알림");
			service.getapply(apply);
			service.getalarmB(alarm);
			result = 1;
				
		}else if("stop".equals(applyType)) {
			apply.setApply_del(1);
			alarm.setAlarm_content("신청이 취소 되었습니다.");
			alarm.setAlarm_subject("참가취소 알림");
			service.getcancelapply(apply);
			service.getcancelalarm(alarm);
			result = 2;
		}
		
		
		return result;
	}
	
	@RequestMapping("/userpage")
	public String userpage() {
		
		return "userpage";
	}
	

}

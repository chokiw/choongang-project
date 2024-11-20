package com.example.demo.controller.Mate;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Alarm;
import com.example.demo.model.Apply;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.service.MateDetailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MateDetailController {
	private final MateDetailService service;

	// 모집 글상세
	@RequestMapping("/mate_detail")
	public String mate_detail(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@RequestParam(value = "recruit_no") String recruit_no, Model model) {
		// 글정보 불러오기
		RecruitBoard board = service.getrecruitD(Integer.parseInt(recruit_no));
		// 맵에 경로 표현을 위한 테이터 불러오기
		Recruit_c[] rc = service.getrecruitC(board.getRecruit_no());
		// 글쓴이 정보 불러오기
		Runner r = service.getMember_SJL(board.getUser_id());
		// 글쓴 사람의 사진 불러오기
		String userphoto = service.getUserPhotoB(Integer.parseInt(recruit_no));
		// 글쓴 사람의 닉네임 불러오기
		String nickname = service.getNickNameB(Integer.parseInt(recruit_no));

		model.addAttribute("r", r);
		model.addAttribute("rc", rc);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		model.addAttribute("userphoto", userphoto);
		model.addAttribute("nickname", nickname);

		return "/mate/mateDetail/mate_detail";
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

}

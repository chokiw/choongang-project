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
		if (board.getRecruit_del() == 1)
			return "redirect:/mate_board";
		// 맵에 경로 표현을 위한 테이터 불러오기
		Recruit_c[] rc = service.getrecruitC(board.getRecruit_no());
		// 글쓴이 정보 불러오기
		Runner r = service.getMember_SJL(board.getUser_id());
		// 글쓴 사람의 사진 불러오기
		String userphoto = service.getUserPhotoB(Integer.parseInt(recruit_no));
		// 글쓴 사람의 닉네임 불러오기
		String nickname = service.getNickNameB(Integer.parseInt(recruit_no));
		
		service.read(recruit_no);

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
	public Integer apply(@RequestParam(value = "recruit_no") int recruit_no,
			@RequestParam(value = "user_id") String user_id, @RequestParam(value = "applyType") String applyType,
			@RequestParam(value = "recruitnum",defaultValue = "1") String recruitnum) {

		// 글쓴 사람의 user_id 가져오기
		String writer_id = service.getWriter_id(recruit_no);

		// 글쓴 사람은 참가 신청 못하게 하는 코드
		if (writer_id != null && writer_id.equals(user_id)) {
			return -1;
		}

		int result = 0;
		int remainNum = service.getRemainNum(recruit_no);

		if ("start".equals(applyType)) {

			if (remainNum <= 0) {
				return -2;
			}

			Apply apply = new Apply();
			apply.setRecruit_no(recruit_no);
			apply.setUser_id(user_id);
			apply.setApply_del(0);

			Alarm alarm = new Alarm();
			alarm.setUser_id(user_id);
			alarm.setRecruit_no(recruit_no);
			alarm.setAlarm_subject("참가신청 알림");
			alarm.setAlarm_content("참가신청이 완료 되었습니다.");

			// 글쓴 사람에게 알림 추가
			Alarm writerAlarm = new Alarm();
			writerAlarm.setUser_id(writer_id);
			writerAlarm.setRecruit_no(recruit_no);
			writerAlarm.setAlarm_subject("작성하신 글에 참가신청 알림입니다.");
			writerAlarm.setAlarm_content(user_id + "님이 참가 신청하셨습니다.");

			service.getapply(apply);
			service.getalarmB(alarm);
			service.getalarmB(writerAlarm);
			
			//모집인원 감소
			service.updateRemainNum(recruit_no,remainNum-1);
			
			result= 1;

		} else if ("stop".equals(applyType)) {
			
			Apply apply = new Apply();
			apply.setRecruit_no(recruit_no);
			apply.setUser_id(user_id);
			apply.setApply_del(1);

			Alarm alarm = new Alarm();
			alarm.setUser_id(user_id);
			alarm.setRecruit_no(recruit_no);
			alarm.setAlarm_subject("참가취소 알림");
			alarm.setAlarm_content("신청이 취소 되었습니다.");

			// 글쓴 사람에게 알림 추가
			Alarm writerAlarm = new Alarm();
			writerAlarm.setUser_id(writer_id);
			writerAlarm.setRecruit_no(recruit_no);
			writerAlarm.setAlarm_subject("작성하신 글에 참가취소 알림입니다.");
			writerAlarm.setAlarm_content(user_id + "님이 참가 취소하셨습니다.");

			service.getcancelapply(apply);
			service.getcancelalarm(alarm);
			service.getalarmB(writerAlarm);
			
			//모집인원 증가
			if(remainNum < Integer.parseInt(recruitnum)) {
				service.updateRemainNum(recruit_no,remainNum+1);
			}
			
			result= 2;
		}

		return result;
	}

	@RequestMapping("/checkapply")
	@ResponseBody
	public boolean checkapply(@RequestParam(value = "recruit_no") int recruit_no,
			@RequestParam(value = "user_id") String user_id) {

		return service.isAlreadyApplied(recruit_no, user_id);
	}

}

package com.example.demo.controller.Track;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.demo.model.Member;
import com.example.demo.model.SnsBoard;
import com.example.demo.model.SnsReplyBoard;
import com.example.demo.service.TrackDetailService;
import com.example.demo.service.TrackReplyServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class TrackReplyController {

	@Autowired
	private final TrackReplyServiceImpl rbs;
	private final TrackDetailService service;

	// sns댓글 목록
	@RequestMapping("/srlist/num/{num}")
	public String rlist(@PathVariable("num") int num,
			@SessionAttribute(name = "member", required = false) Member member, Model model) {

		SnsBoard board = service.getboard(num);

		List<SnsReplyBoard> srlist = rbs.srlist(num); // 댓글 목록

		model.addAttribute("srlist", srlist);
		model.addAttribute("board", board);
		return "/track/trackDetail/srlist"; // 웹브라우저에 출력되는 결과가 callback함수로 리턴된다.
	}

	// sns댓글 작성
	@RequestMapping("/srInsert")
	public String srInsert(SnsReplyBoard srb, Model model) {

		int sns_r_no = srb.getSns_r_no();

		int number = rbs.getSrMaxNum(srb.getSns_no());

		SnsReplyBoard reboard = rbs.srSelect(sns_r_no);

		if (sns_r_no != 0) { // 댓이면

			srb.setSns_r_parent(reboard.getSns_r_no());

			if (reboard.getSns_r_step() == 0 && reboard.getSns_r_level() == 0) { // root 댓글에 댓글달면

				srb.setSns_r_ref(reboard.getSns_r_ref()); // ref값에 부모 ref 설정 clear

				int maxstep = rbs.getSrMaxNum2(srb.getSns_r_no()); // 같은 부모ref 중 다음 step값 구하기

				srb.setSns_r_level(reboard.getSns_r_level() + 1); // 부모 댓글레벨에서 +1해 자식댓글로 들어가기

				srb.setSns_r_step(maxstep); // 가장 나중에 들어온 댓글을 가장 높은 step값 부여

			} else { // 대댓을 달 때

				int child = rbs.getSrChild(reboard); // 자식댓글중에 가장 마지막 step을 가져옴

				if (child == 0)
					srb.setSns_r_step(reboard.getSns_r_step() + 1); // 새로 작성하는 댓글에 step 부여

				else {

					srb.setSns_r_step(child);
				}

				srb.setSns_r_ref(reboard.getSns_r_ref()); // 같은 ref 부여

				rbs.updateSrStep(srb); // 새로 들어가는 댓글 아래의 댓글들의 step을 1씩 증가

				srb.setSns_r_level(reboard.getSns_r_level() + 1); // 레벨값을 올려 들여쓰기
			}

		} else {
			srb.setSns_r_ref(number);

		}

		int result = rbs.srInsert(srb);

		return "redirect:srlist/num/" + srb.getSns_no(); // 댓글 목록 요청
	}

	// sns댓글 삭제
	@RequestMapping("/repsDelete")
	public String delete(SnsReplyBoard srb, Model model) {

		rbs.srDelete(srb.getSns_r_no());
		return "redirect:srlist/num/" + srb.getSns_no(); // 댓글 목록 요청
	}

	// sns댓글 수정
	@RequestMapping("/srepUpdate")
	public String repUpdate(SnsReplyBoard srb, Model model) {
		rbs.srUpdate(srb);
		return "redirect:srlist/num/" + srb.getSns_no(); // 댓글 목록 요청
	}

}
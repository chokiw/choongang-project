package com.example.demo.controller.Mate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.Member;
import com.example.demo.model.RecruitBoard;
import com.example.demo.service.MateReplyServiceImpl;


@Controller
public class MateReplyController {
	
	@Autowired
	private MateReplyServiceImpl rbs;	
	
	// 댓글 목록
	@RequestMapping("/rlist/num/{num}")
	public String rlist(@PathVariable("num") int num, 
						@SessionAttribute(name = "member", required = false) Member member,
						Model model) {
		
		
		RecruitBoard board = rbs.rgetdetail(num);
					
		List<MateReplyBoard> rlist = rbs.list(num);	// 댓글 목록			

		model.addAttribute("rlist", rlist);
		model.addAttribute("board", board);
		return "/mate/mateDetail/rlist";		// 웹브라우저에 출력되는 결과가 callback함수로 리턴된다.
	}
	
	
	
	
	// 댓글 작성
	@RequestMapping("/sInsert")
	public String sInsert(MateReplyBoard rb, Model model) {		
	
		
		int recruit_r_no = rb.getRecruit_r_no();
		int number = rbs.getMaxNum(rb.getRecruit_no());		// count 최대값+1		count = ref
		MateReplyBoard reboard = rbs.select(recruit_r_no);	// reboard 부모 댓글
		

		
		if (recruit_r_no != 0) {		// 댓이면 
			
			rb.setRecruit_r_parent(reboard.getRecruit_r_no());								// del 값에 부모 no 삽입 clear
			System.out.println(rb.getRecruit_r_parent());
			
			if(reboard.getRecruit_r_step() == 0 && reboard.getRecruit_r_level()==0) {	// root 댓글에 댓글달면
				
				System.out.println("루트댓글에 댓글달기");
				
				rb.setRecruit_r_ref(reboard.getRecruit_r_ref());					// ref값에 부모 ref 설정 clear
				
				int maxstep = rbs.getMaxNum2(rb.getRecruit_r_no());						// 같은 부모ref 중 다음 step값 구하기
				
				System.out.println("max step : " +maxstep);
				
				rb.setRecruit_r_level(reboard.getRecruit_r_level()+1);					// 부모 댓글레벨에서 +1해 자식댓글로 들어가기
				
				rb.setRecruit_r_step(maxstep);											// 가장 나중에 들어온 댓글을 가장 높은 step값 부여
				
				
			} else {	// 대댓을 달 때
				
				int child = rbs.getChild(reboard);						// 자식댓글중에 가장 마지막 step을 가져옴
				
				if (child == 0)
					rb.setRecruit_r_step(reboard.getRecruit_r_step()+1);	// 새로 작성하는 댓글에 step 부여
				
				else {
					
					rb.setRecruit_r_step(child);
				}
				
				
				rb.setRecruit_r_ref(reboard.getRecruit_r_ref());		// 같은 ref 부여	
				
				rbs.updateStep(rb);											// 새로 들어가는 댓글 아래의 댓글들의 step을 1씩 증가
								
												
				rb.setRecruit_r_level(reboard.getRecruit_r_level()+1);		// 레벨값을 올려 들여쓰기
			} 
			
		}else {
			rb.setRecruit_r_ref(number);
			
		}
			
		int result = rbs.insert(rb);
		
		return "redirect:rlist/num/" + rb.getRecruit_no();		// 댓글 목록 요청
	}
					


	// 댓글 삭제
	@RequestMapping("/repDelete")
	public String delete(MateReplyBoard rb, Model model) {
		
		
		rbs.delete(rb.getRecruit_r_no());
		return "redirect:rlist/num/" + rb.getRecruit_no();		// 댓글 목록 요청
	}

	// 댓글 수정
	@RequestMapping("/repUpdate")
	public String repUpdate(MateReplyBoard rb, Model model) {
		rbs.update(rb);
		return "redirect:rlist/num/" + rb.getRecruit_no();		// 댓글 목록 요청
	}
	
}
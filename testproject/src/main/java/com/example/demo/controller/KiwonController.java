package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.demo.model.Alarm;
import com.example.demo.model.Member;
import com.example.demo.model.SnsReplyBoard;
import com.example.demo.service.KiwonService;
import com.example.demo.service.MateReplyServiceImpl;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.ProjectService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class KiwonController {

	@Autowired
	private final KiwonService kservice;
	
	@Autowired
	private final MateReplyServiceImpl rbs;
	
	private final ProjectService service;

	@RequestMapping("alarm_list")
	public String alram_page(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
							 @SessionAttribute(name = "member", required = false) Member member,
							 Alarm alarm,
							 Model model) {
		
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = kservice.getTotal(alarm);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		
		alarm.setStartRow(startRow);
		alarm.setEndRow(endRow);
		int no = total - startRow + 1;
	
		
		List<Alarm> list = kservice.alarmList(alarm);
		
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);		
		
		return "alarm_list";
	}
	
	@RequestMapping("alarm_page")
	public String alram_page() {
		
		
		
		return "alarm_page";
	}
	

	
	// sns댓글 목록
	@RequestMapping("/srlist/num/{num}")
	public String rlist(@PathVariable("num") int num, 
						@SessionAttribute(name = "member", required = false) Member member,
						Model model) {
		System.out.println("sns reply list in");
		System.out.println("sns no : " + num);
		
		SnsReplyBoard board = rbs.srgetDetail(num);
		
		System.out.println("board : " + board);
		
		List<SnsReplyBoard> srlist = rbs.srlist(num);	// 댓글 목록			
		
		System.out.println("srlist : " + srlist);
		
		model.addAttribute("srlist", srlist);
		model.addAttribute("board", board);
		return "/srlist";		// 웹브라우저에 출력되는 결과가 callback함수로 리턴된다.
	}
	
	
	// sns댓글 작성
	@RequestMapping("/srInsert")
	public String srInsert(SnsReplyBoard srb, Model model) {		
	

		
		int sns_r_no = srb.getSns_r_no();
		
		
		System.out.println("부모 댓글번호 : "+ sns_r_no);
		
		
		
		int number = rbs.getSrMaxNum();		
		
		SnsReplyBoard reboard = rbs.srSelect(sns_r_no);	
		

		
		if (sns_r_no != 0) {		// 댓이면 
			
			srb.setSns_r_parent(reboard.getSns_r_no());
			System.out.println(srb.getSns_r_parent());
			
			if(reboard.getSns_r_step() == 0 && reboard.getSns_r_level()==0) {	// root 댓글에 댓글달면
				
				System.out.println("루트댓글에 댓글달기");
				
				srb.setSns_r_ref(reboard.getSns_r_ref());					// ref값에 부모 ref 설정 clear
				
				int maxstep = rbs.getSrMaxNum2(srb.getSns_r_no());						// 같은 부모ref 중 다음 step값 구하기
				
				System.out.println("max step : " +maxstep);
				
				srb.setSns_r_level(reboard.getSns_r_level()+1);					// 부모 댓글레벨에서 +1해 자식댓글로 들어가기
				
				srb.setSns_r_step(maxstep);											// 가장 나중에 들어온 댓글을 가장 높은 step값 부여
				
				
			} else {	// 대댓을 달 때
				System.out.println("대댓 작성");
				
				int child = rbs.getSrChild(reboard);						// 자식댓글중에 가장 마지막 step을 가져옴
				
				System.out.println("child : " + child);
				
				System.out.println("reboard step : " +reboard.getSns_r_step());
								
				
				if (child == 0)
					srb.setSns_r_step(reboard.getSns_r_step()+1);	// 새로 작성하는 댓글에 step 부여
				
				else {
					
					srb.setSns_r_step(child);
				}
				
				System.out.println("새댓 step : "+srb.getSns_r_step());
				
				srb.setSns_r_ref(reboard.getSns_r_ref());		// 같은 ref 부여	
				
				rbs.updateSrStep(srb);											// 새로 들어가는 댓글 아래의 댓글들의 step을 1씩 증가
								
												
				srb.setSns_r_level(reboard.getSns_r_level()+1);		// 레벨값을 올려 들여쓰기
			} 
			
		}else {
			srb.setSns_r_ref(number);			

			System.out.println("자신의 r_no로 count 값 설정" + srb.getSns_r_no() + "," + srb.getSns_r_ref());
				
		}
			
		int result = rbs.srInsert(srb);
		
		if(result == 1 ) System.out.println("댓글 작성성공");
			else System.out.println("댓글작성 실패");
			 
			return "redirect:srlist/num/" + srb.getSns_no();		// 댓글 목록 요청
	}


	// sns댓글 삭제
	@RequestMapping("/repsDelete")
	public String delete(SnsReplyBoard srb, Model model) {
		
		System.out.println("repsDelete in");
		
		System.out.println("삭제할 글 번호 : " + srb.getSns_no());
		System.out.println("삭제할 댓 번호 : " + srb.getSns_r_no());
		
		rbs.srDelete(srb.getSns_r_no());
		return "redirect:srlist/num/" + srb.getSns_no();		// 댓글 목록 요청
	}

	// sns댓글 수정
	@RequestMapping("/srepUpdate")
	public String repUpdate(SnsReplyBoard srb, Model model) {
		rbs.srUpdate(srb);
		return "redirect:srlist/num/" + srb.getSns_no();		// 댓글 목록 요청
	}
	
	
	
	
	
	
	
}
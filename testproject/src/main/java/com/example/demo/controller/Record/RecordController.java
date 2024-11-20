package com.example.demo.controller.Record;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.service.RecordService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class RecordController {

	private final RecordService service;

	// 측정페이지로 이동
	@RequestMapping("/run")
	public String run() {
		return "/record/run";
	}
	
	// 기록측정을 관리하는 컨트롤러
	@RequestMapping("/runnerdata")
	@ResponseBody
	public int runnerdata(@RequestParam(value = "path") String[] path,
			@RequestParam(value = "distance") String distance, @RequestParam(value = "time") String time,
			HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		Runner_data rd = new Runner_data();
		
		//측정 기록 저장
		rd.setUser_id(member.getUser_id());
		rd.setRunner_data_distance(distance);
		rd.setRunner_data_time(Integer.toString(Integer.parseInt(time) / 100));
		
		int result = service.setRunnerdata(rd);

		//경로 좌표값 저장
		for (int i = 0; i < path.length; i++) {
			Coordinate coord = new Coordinate();
			coord.setLat(path[i]);
			coord.setLng(path[++i]);
			service.setCoordinate(coord);
		}
		
		//회원 자료값 최신화
		Runner runner = service.getMember_SJL(member.getUser_id());

		runner.setUser_distance(Integer.parseInt(distance) + runner.getUser_distance());
		runner.setUser_runtime(Integer.parseInt(rd.getRunner_data_time()) + runner.getUser_runtime());
		runner.setUser_id(member.getUser_id());
		// 뛴거리와 시간 업데이트
		service.updateRunnerdata(runner);
		return result;
	}
	
	//측정 결과창
	@RequestMapping("/runnerdataresult")
	public String runnerdataresult(@RequestParam(value="result") String result,Model model) {
		model.addAttribute("result",Integer.parseInt(result));
		return "/record/runnerdataresult";
	}
}

package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;
import com.example.demo.service.RunnertrackDetailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class RunnertrackDetailController {
	private final RunnertrackDetailService service;
	
	@RequestMapping("runnertrack_detail")
	public String runnertrack_detail(@RequestParam(value = "runner_data_no") int runner_data_no,Model model) {
		// 맵에 경로 표현을 위한 데이터 불러오기
	    Runner_data rd = service.getRunnerData(runner_data_no);
	    // 좌표값 불러오기
	    Coordinate[] c = service.getCoordData(runner_data_no);

	    model.addAttribute("rd", rd);
	    model.addAttribute("c", c);
		
		
		return "runnertrack_detail";
	}
}

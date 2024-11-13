package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Runner_data;
import com.example.demo.service.JongChanService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class JongChanController {
	
	private final JongChanService service;
	
	// 내가 달린 트랙으로 이동
	@RequestMapping("/runnertrack")
	public String runnertrack(Runner_data runner_data, Model model) {
		
		
		model.addAttribute(model);
		
		return "runnertrack";
	}
}

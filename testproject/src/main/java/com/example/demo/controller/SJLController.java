package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;
import com.example.demo.service.SJLService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class SJLController {
	private final SJLService service;
	
	@RequestMapping("/getMyData")
	public List getMyData(@RequestParam(value = "runner_data_no") int runner_data_no) {
		List list = new ArrayList();
		
		Runner_data rd = service.getrd(runner_data_no);
		Coordinate[] cd =  service.getc(runner_data_no);
		
		String[] cdarr = new String[cd.length*2];
		
		int i=-1;
		for(Coordinate c : cd) {
			cdarr[++i]=c.getLat();
			cdarr[++i]=c.getLng();
		}
		
		list.add(cdarr);
		list.add(rd.getRunner_data_distance());
		list.add(rd.getRunner_data_time());
		
		return list;
	}
	
}

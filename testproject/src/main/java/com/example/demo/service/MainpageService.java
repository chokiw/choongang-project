package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MainpageDAO;
import com.example.demo.model.Runner;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainpageService {
	private final MainpageDAO dao;

	public List<Runner> rundata(Runner runner) {
		return dao.rundata(runner);
	}

	public List<SnsBoard> routedata(SnsBoard sns) {
		return dao.routedata(sns);
	}
}

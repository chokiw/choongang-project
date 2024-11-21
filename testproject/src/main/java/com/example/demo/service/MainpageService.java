package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MainpageDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainpageService {
	private final MainpageDAO dao;

	public List<Runner> rundata(Runner runner) {
		return dao.rundata(runner);
	}

	public List<SnsBoard> routedata() {
		return dao.routedata();
	}

	public Runner_data getRankRd(int runner_data_no) {
		return dao.getRankRd(runner_data_no);
	}

	public Runner getRankUd(String user_id) {
		return dao.getRankUd(user_id);
	}

	public Coordinate[] getRankCd(int runner_data_no) {
		return dao.getRankCd(runner_data_no);
	}
}

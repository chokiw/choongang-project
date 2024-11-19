package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.RunnertrackDetailDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RunnertrackDetailService {
	private final RunnertrackDetailDAO dao;

	public Runner_data getRunnerData(int runner_data_no) {
		return dao.getRunnerData(runner_data_no);
	}

	public Coordinate[] getCoordData(int runner_data_no) {
		return dao.getCoordData(runner_data_no);
	}
}

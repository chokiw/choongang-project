package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MytrackDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MytrackService {
	private final MytrackDAO dao;

	public int getRunnerTrack(String user_id) {
		return dao.getRunnerTrack(user_id);
	}

	public List<Runner_data> listRunnerTrack(Runner_data runnerdata) {
		return dao.listRunnerTrack(runnerdata);
	}

	public Runner_data getRunnerData(int runner_data_no) {
		return dao.getRunnerData(runner_data_no);
	}

	public Coordinate[] getCoordData(int runner_data_no) {
		return dao.getCoordData(runner_data_no);
	}
}

package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.SJLDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SJLService {
	private final SJLDAO dao;

	public Runner_data getrd(int runner_data_no) {
		return dao.getrd(runner_data_no);
	}

	public Coordinate[] getc(int runner_data_no) {
		return dao.getc(runner_data_no);
	}
}

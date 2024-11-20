package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MateBoardDAO;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MateBoardService {
	private final MateBoardDAO dao;

	public int getrecruitTotal(RecruitBoard recruit) {
		return dao.getrecruitTotal(recruit);
	}

	public List<SnsBoard> recruitList(RecruitBoard recruit) {
		return dao.recruitList(recruit);
	}

}

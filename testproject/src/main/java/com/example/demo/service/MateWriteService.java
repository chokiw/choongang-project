package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MateWriteDAO;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MateWriteService {
	private final MateWriteDAO dao;

	public int setRecruitBoard(RecruitBoard board) {
		return dao.setRecruitBoard(board);
	}

	public void setRecruitC(Recruit_c recruit_c) {
		dao.setRecruitC(recruit_c);
	}
}

package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.SJLDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

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

	public int getrecruitTotal(RecruitBoard recruit) {
		
		return dao.getrecruitTotal(recruit);
	}

	public List<SnsBoard> recruitList(RecruitBoard recruit) {
		
		return dao.recruitList(recruit);
	}

	public RecruitBoard getrecruitD(int recruit_no) {
		return dao.getrecruitD(recruit_no);
	}

	public Recruit_c getrecruitC(int recruit_no) {
		return dao.getrecruitC(recruit_no);
	}

	public Runner getMember(String user_id) {
		return dao.getMember(user_id);
	}
}

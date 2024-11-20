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

	public Recruit_c[] getrecruitC(int recruit_no) {
		return dao.getrecruitC(recruit_no);
	}

	public Runner getMember_SJL(String user_id) {
		return dao.getMember_SJL(user_id);
	}

	public int setRecruitBoard(RecruitBoard board) {
		return dao.setRecruitBoard(board);
	}

	public void setRecruitC(Recruit_c recruit_c) {
		// TODO Auto-generated method stub
		dao.setRecruitC(recruit_c);
	}

	public int setRunnerdata(Runner_data rd) {
		return dao.setRunnerdata(rd);
	}

	public void setCoordinate(Coordinate coord) {
		dao.setCoordinate(coord);
	}

	public void updateRunnerdata(Runner runner) {
		dao.updateRunnerdata(runner);
	}

	public int insertSns(SnsBoard board) {
		return dao.insertSns(board);
	}
	
	
}

package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ProjectDAO;
import com.example.demo.dao.ProjectDAO_juyoung;
import com.example.demo.model.Coordinate;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectService_juyoung {
	
	private final ProjectDAO_juyoung dao;
		
	public SnsBoard getboard(int int1) {
		return dao.getboard(int1);
	}

	public Runner_data getrdata(int runner_data_no) {
		return dao.getrdata(runner_data_no);
	}

	public Coordinate[] getcdata(int runner_data_no) {
		return dao.getcdata(runner_data_no);
	}

	public int updateboard(SnsBoard sns) {
		
		return dao.updateboard(sns);
	}

	public int deleteboard(SnsBoard sns) {
		
		return dao.deleteboard(sns);
	}
	
	public RecruitBoard getrecruitD(int recruit_no) {
		return dao.getrecruitD(recruit_no);
	}

	public Recruit_c[] getrecruitC(int recruit_no) {
		return dao.getrecruitC(recruit_no);
	}

	public Runner getMember(String user_id) {
		return dao.getMember(user_id);
	}

	public int updateRb(RecruitBoard rb) {
		
		return dao.updateRb(rb);
	}

	public int deleterb(RecruitBoard rb) {
		
		return dao.deleteRb(rb);
	}

	public int getTotal(SnsBoard sns) {
		
		return dao.getTotal(sns);
	}

	public List<SnsBoard> listLocation(SnsBoard sns) {
		
		return dao.listLocation(sns);
	}

	}

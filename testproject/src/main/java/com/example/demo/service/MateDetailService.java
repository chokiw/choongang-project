package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MateDetailDAO;
import com.example.demo.model.Alarm;
import com.example.demo.model.Apply;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MateDetailService {
	private final MateDetailDAO dao;

	public RecruitBoard getrecruitD(int int1) {
		return dao.getrecruitD(int1);
	}

	public Recruit_c[] getrecruitC(int recruit_no) {
		return dao.getrecruitC(recruit_no);
	}

	public Runner getMember_SJL(String user_id) {
		return dao.getMember_SJL(user_id);
	}

	public String getUserPhotoB(int int1) {
		return dao.getUserPhotoB(int1);
	}

	public String getNickNameB(int int1) {
		return dao.getNickNameB(int1);
	}

	public void getapply(Apply apply) {
		dao.getapply(apply);
	}

	public void getalarmB(Alarm alarm) {
		dao.getalarmB(alarm);
	}

	public void getcancelapply(Apply apply) {
		dao.getcancelapply(apply);
	}

	public void getcancelalarm(Alarm alarm) {
		dao.getcancelalarm(alarm);
	}

	public String getWriter_id(int recruit_no) {
		return dao.getWriter_id(recruit_no);
	}

	public boolean isAlreadyApplied(int recruit_no, String user_id) {
		return dao.isAlreadyApplied(recruit_no, user_id) > 0;
	}


	public int getRemainNum(int recruit_no) {
		return dao.getRemainNum(recruit_no);
	}

	public void updateRemainNum(int recruit_no, int remainNum) {
		dao.updateRemainNum(recruit_no, remainNum);
	}

	public void read(String recruit_no) {
		dao.read(recruit_no);
	}

}

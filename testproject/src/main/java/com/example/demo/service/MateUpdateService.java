package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MateUpdateDAO;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MateUpdateService {
	private final MateUpdateDAO dao;

	public RecruitBoard getrecruitD(int int1) {
		return dao.getrecruitD(int1);
	}

	public Recruit_c[] getrecruitC(int recruit_no) {
		// TODO Auto-generated method stub
		return dao.getrecruitC(recruit_no);
	}

	public Runner getMember(String user_id) {
		// TODO Auto-generated method stub
		return dao.getMember(user_id);
	}

	public int updateRb(RecruitBoard rb) {
		// TODO Auto-generated method stub
		return dao.updateRb(rb);
	}

	public void deleteRc(int recruit_no) {
		dao.deleteRc(recruit_no);
	}

	public void setRecruitC(Recruit_c recruit_c) {
		dao.setRecruitC(recruit_c);
	}
}

package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MateReplyDAO;
import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.SnsReplyBoard;

@Service
public class MateReplyServiceImpl {
	@Autowired
	private MateReplyDAO rbd;

	public List<MateReplyBoard> list(int num) {
		return rbd.list(num);
	}

	public int insert(MateReplyBoard rb) {
		return rbd.insert(rb);
	}

	public void delete(int recruit_r_no) {
		rbd.delete(recruit_r_no);
		
	}

	public void update(MateReplyBoard rb) {
		rbd.update(rb);
	}

	public int getMaxNum(int recruit_no) {
		return rbd.getMaxNum(recruit_no);
	}

	public void updateRe(MateReplyBoard rb) {
		rbd.updateRe(rb);
	}

	public MateReplyBoard select(int rno) {
		return rbd.select(rno);
	}

	public int getMaxNum2(int recruit_r_no) {
		return rbd.getMaxNum2(recruit_r_no);
	}

	public void updateStep(MateReplyBoard rb) {
		rbd.updateStep(rb);
		
	}

	public int getChild(MateReplyBoard reboard) {
		return rbd.getChild(reboard);
	}

	public RecruitBoard rgetdetail(int num) {
		return rbd.rgetdetail(num);
	}

}
package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MateReplyDAO;
import com.example.demo.dao.TrackReplyDAO;
import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.SnsReplyBoard;

@Service
public class TrackReplyServiceImpl {
	@Autowired
	private TrackReplyDAO rbd;

	public SnsReplyBoard srgetDetail(int num) {
		return rbd.srgetDetail(num);
	}

	public List<SnsReplyBoard> srlist(int num) {
		return rbd.srList(num);
	}

	public SnsReplyBoard srSelect(int sns_r_no) {
		return rbd.srSelect(sns_r_no);
	}

	public int getSrMaxNum2(int sns_r_no) {
		return rbd.getSrMaxNum2(sns_r_no);
	}

	public int getSrChild(SnsReplyBoard reboard) {
		return rbd.getSrChild(reboard);
	}

	public void updateSrStep(SnsReplyBoard srb) {	
		rbd.updateSrStep(srb);
	}

	public int srInsert(SnsReplyBoard srb) {
		return rbd.srInsert(srb);
	}

	public void srUpdate(SnsReplyBoard srb) {
		rbd.srUpdate(srb);
	}

	public void srDelete(int sns_r_no) {
		rbd.srDelete(sns_r_no);
	}

	public int getSrMaxNum(int sns_no) {
		return rbd.getSrMaxNum(sns_no);
	}

	
	


}
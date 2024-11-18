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

	public int getMaxNum() {
		return rbd.getMaxNum();
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

	public int getSrMaxNum() {
		return rbd.getSrMaxNum();
	}

	
	


}
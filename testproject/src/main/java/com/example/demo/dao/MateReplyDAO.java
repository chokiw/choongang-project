package com.example.demo.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.RecruitBoard;

@Mapper
public interface MateReplyDAO {

	List<MateReplyBoard> list(int num);

	int insert(MateReplyBoard rb);

	void delete(int recruit_r_no);

	void update(MateReplyBoard rb);
	
	void updateRe(MateReplyBoard rb);

	int getMaxNum();

	MateReplyBoard select(int rno);

	int getMaxNum2(int recruit_r_no);

	void updateStep(MateReplyBoard rb);

	void update2(MateReplyBoard rb);

	int getChild(MateReplyBoard reboard);

	RecruitBoard rgetdetail(int num);
	
}
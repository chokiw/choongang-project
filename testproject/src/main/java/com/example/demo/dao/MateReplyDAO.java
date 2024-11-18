package com.example.demo.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.SnsReplyBoard;

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
	
	int getChild(MateReplyBoard reboard);

	RecruitBoard rgetdetail(int num);

	SnsReplyBoard srgetDetail(int num);

	List<SnsReplyBoard> srList(int num);

	SnsReplyBoard srSelect(int sns_r_no);

	int getSrMaxNum2(int sns_r_no);

	int getSrChild(SnsReplyBoard reboard);

	void updateSrStep(SnsReplyBoard srb);

	int srInsert(SnsReplyBoard srb);

	void srUpdate(SnsReplyBoard srb);

	void srDelete(int sns_r_no);

	int getSrMaxNum();
	
}
package com.example.demo.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.SnsReplyBoard;

@Mapper
public interface TrackReplyDAO {	

	SnsReplyBoard srgetDetail(int num);

	List<SnsReplyBoard> srList(int num);

	SnsReplyBoard srSelect(int sns_r_no);

	int getSrMaxNum2(int sns_r_no);

	int getSrChild(SnsReplyBoard reboard);

	void updateSrStep(SnsReplyBoard srb);

	int srInsert(SnsReplyBoard srb);

	void srUpdate(SnsReplyBoard srb);

	void srDelete(int sns_r_no);

	int getSrMaxNum(int sns_no);
	
}
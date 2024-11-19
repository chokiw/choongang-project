package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface SJLDAO {

	Runner_data getrd(int runner_data_no);

	Coordinate[] getc(int runner_data_no);

	int getrecruitTotal(RecruitBoard recruit);

	List<SnsBoard> recruitList(RecruitBoard recruit);

	RecruitBoard getrecruitD(int recruit_no);

	Recruit_c[] getrecruitC(int recruit_no);

	Runner getMember_SJL(String user_id);

	int setRecruitBoard(RecruitBoard board);

	void setRecruitC(Recruit_c recruit_c);
	
	int setRunnerdata(Runner_data rd);

	void setCoordinate(Coordinate coord);

	void updateRunnerdata(Runner runner);

	int updateSns(SnsBoard board);
}

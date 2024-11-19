package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface ProjectDAO_juyoung {

	SnsBoard getboard(int int1);

	Runner_data getrdata(int runner_data_no);

	Coordinate[] getcdata(int runner_data_no);

	int updateboard(SnsBoard sns);

	int deleteboard(SnsBoard sns);
	
	RecruitBoard getrecruitD(int recruit_no);

	Recruit_c[] getrecruitC(int recruit_no);

	Runner getMember(String user_id);

	int updateRb(RecruitBoard rb);

	int deleteRb(RecruitBoard rb);

	void setRecruitC(Recruit_c recruit_c);

	void deleteRc(int recruit_no);

}

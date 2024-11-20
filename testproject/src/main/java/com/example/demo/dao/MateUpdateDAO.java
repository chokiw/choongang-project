package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;

@Mapper
public interface MateUpdateDAO {

	RecruitBoard getrecruitD(int int1);

	Recruit_c[] getrecruitC(int recruit_no);

	Runner getMember(String user_id);

	int updateRb(RecruitBoard rb);

	void deleteRc(int recruit_no);

	void setRecruitC(Recruit_c recruit_c);

}

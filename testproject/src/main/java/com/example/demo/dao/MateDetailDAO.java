package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Alarm;
import com.example.demo.model.Apply;
import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;
import com.example.demo.model.Runner;

@Mapper
public interface MateDetailDAO {

	RecruitBoard getrecruitD(int int1);

	Recruit_c[] getrecruitC(int recruit_no);

	Runner getMember_SJL(String user_id);

	String getUserPhotoB(int int1);

	String getNickNameB(int int1);

	void getapply(Apply apply);

	void getalarmB(Alarm alarm);

	void getcancelapply(Apply apply);

	void getcancelalarm(Alarm alarm);

}

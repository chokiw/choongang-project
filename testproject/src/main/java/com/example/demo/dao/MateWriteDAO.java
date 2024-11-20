package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Recruit_c;

@Mapper
public interface MateWriteDAO {

	int setRecruitBoard(RecruitBoard board);

	void setRecruitC(Recruit_c recruit_c);

}

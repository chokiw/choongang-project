package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.RecruitBoard;

@Mapper
public interface MateDeleteDao {

	RecruitBoard getrecruitD(int recruit_no);

	int deleterb(int recruit_no);

}

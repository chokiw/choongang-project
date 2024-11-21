package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.RecruitBoard;

@Mapper
public interface MateDeleteDao {

	RecruitBoard getrecruitD(int recruit_no);

	int deleteRecruit(int recruit_no);

}

package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.model.Runner;

@Mapper
public interface MemberEditDAO {
	
	Runner membereditview(@Param("user_id") String user_id);
	
	int membereditupdate(Runner runner);
}

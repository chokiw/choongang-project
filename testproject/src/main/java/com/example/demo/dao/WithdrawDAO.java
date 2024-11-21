package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface WithdrawDAO {

	int runner_delete(@Param("user_id") String user_id); 
	
}

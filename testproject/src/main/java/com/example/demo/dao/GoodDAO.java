package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.model.Good;

@Mapper
public interface GoodDAO {
	
	int good_insert(@Param("user_id") String user_id, @Param("sns_no") int sns_no );
	
	int good_delete(@Param("user_id") String user_id, @Param("sns_no") int sns_no);
	
	int good_minus(@Param("user_id") String user_id, @Param("sns_no") int sns_no);
	
	int good_plus(@Param("user_id") String user_id, @Param("sns_no") int sns_no);
	
	int checkGood(@Param("user_id") String user_id, @Param("sns_no") int sns_no);
	
	Good get_good(@Param("sns_no") int sns_no);
	
}

package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Runner;

@Mapper
public interface UserpageDAO {

	Runner getMemberB(String user_id);

}

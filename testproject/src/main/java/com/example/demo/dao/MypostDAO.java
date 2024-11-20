package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Totalpage;

@Mapper
public interface MypostDAO {

	Totalpage[] getSnsboard(String userId);

	Totalpage[] getMateboard(String userId);
}

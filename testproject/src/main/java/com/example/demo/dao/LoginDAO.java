package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Runner;

@Mapper
public interface LoginDAO {

	Runner findid(Runner runner);

	Runner findpass(Runner runner);

	Runner getMember(String user_id);
}

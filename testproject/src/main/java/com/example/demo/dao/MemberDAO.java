package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Runner;

@Mapper
public interface MemberDAO {

	int idcheck(String id);

	int nicknamecheck(String nickname);

	int insert(Runner runner);
}

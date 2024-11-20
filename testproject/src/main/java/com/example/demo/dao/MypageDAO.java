package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Alarm;
import com.example.demo.model.Runner;

@Mapper
public interface MypageDAO {

	Runner getMember(String user_id);

	Alarm[] getAlarm(String user_id);
}

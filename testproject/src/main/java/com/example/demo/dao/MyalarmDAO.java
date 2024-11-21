package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Alarm;

@Mapper
public interface MyalarmDAO {

	int getTotal(Alarm alarm);

	List<Alarm> alarmList(Alarm alarm);

	Alarm getDetail(int alarm_no);

	String getWriterID(int recruit_no);

	void read(int alarm_no);
}



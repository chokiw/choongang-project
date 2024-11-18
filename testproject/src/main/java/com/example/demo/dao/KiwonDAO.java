package com.example.demo.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Alarm;
import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.RecruitBoard;

@Mapper
public interface KiwonDAO {

	int getTotal(Alarm alarm);

	List<Alarm> alarmList(Alarm alarm);


}